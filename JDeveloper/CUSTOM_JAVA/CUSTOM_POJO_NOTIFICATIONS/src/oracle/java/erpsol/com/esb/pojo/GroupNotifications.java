package oracle.java.erpsol.com.esb.pojo;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import oracle.java.erpsol.com.esb.pojo.pojoNotifications.NotificationTransactionsRequest;
import oracle.java.erpsol.com.esb.pojo.pojoNotifications.NotificationTransactionsRequest.Details;
import oracle.java.erpsol.com.esb.pojo.pojoNotifications.NotificationTransactionsRequest.Transactions;
import oracle.java.erpsol.com.esb.pojo.pojoNotifications.NotificationTransactionsRequest.Transactions.Transaction;
import oracle.java.erpsol.com.esb.pojo.pojoNotifications.NotificationTransactionsRequest.Transactions.Transaction.Attached;
import oracle.java.erpsol.com.esb.pojo.pojoNotifications.NotificationTransactionsRequest.Transactions.Transaction.Attached.Attachments;
import oracle.java.erpsol.com.esb.pojo.util.GenerateData;

public class GroupNotifications implements Serializable{
    
    //tomamos la lista de transacciones del pojo            
private  List<Transaction> listMsjs = new ArrayList<Transaction>();


    public String GroupNotifications(String xmlString)  {
        //objeto que manipulas los xml en objetos y viseversa
        GenerateData generateData = new GenerateData();
        NotificationTransactionsRequest objetoAgrupado=new NotificationTransactionsRequest();
            try {
            NotificationTransactionsRequest pojoSinAgrupar = generateData.GeneratePojoNotifications(xmlString); 
            objetoAgrupado = GenerateGrouped(pojoSinAgrupar);
                
            objetoAgrupado.setDetails(new Details());
            objetoAgrupado.getDetails().setStatus("Success");
            objetoAgrupado.getDetails().setMessage("successful grouped transactions");
                
            System.out.println("agrupado generado");
                
            return generateData.GenerateXMLNotifications(objetoAgrupado);
        } catch (Throwable e) {
                
            String MsgError = "Error " + e.getClass() + "\n" + " Message: " + e.getMessage();

            for (int i = 0; i < e.getStackTrace().length; i++) {
                MsgError = MsgError + "\n" + e.getStackTrace()[i].toString();
            }

            objetoAgrupado.setDetails(new Details());
            objetoAgrupado.getDetails().setStatus("Error");
            objetoAgrupado.getDetails().setMessage(MsgError);
            return generateData.GenerateXMLNotifications(objetoAgrupado);
        }

        
    }
        
    
    //La clase realiza el agrupado solo si el campo agrupar viene poblado en caso que no se pasa tal cual 
    //el agrupado se da en dos paso siempre se agrupa por receptor y emisor 
    //se realiza un segundo agrupado basado el el paramatro ingresado en agrupado
    public  NotificationTransactionsRequest GenerateGrouped(NotificationTransactionsRequest  PojoMsjs)throws IOException{
        
        //lo volvemos una lista
        listMsjs.addAll(PojoMsjs.getTransactions().getTransaction());
    	
        //creamos nuetro pojo de salida que vamos ir llenando
    	NotificationTransactionsRequest pojoAgrupado = new NotificationTransactionsRequest();
    	pojoAgrupado.setTransactions(new Transactions());
        
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
    	// creamos lista con los que se agrupan
    	Map<String, List<Transaction>> listGroup = listMsjs.stream().filter(agrupado -> agrupado.getGroup() !=null)
                                                             .collect(Collectors.groupingBy(agrupado -> agrupado.getGroup()));
        //recorremos los grupos encontrados
        listGroup.forEach((grupo,listaGrupo) ->{
////////////////////////////////////agregamos los que no se agrupan//////////////////////////////////////////////////////////
                if(grupo.isEmpty()) { 
                        //se agrupan los que van dentro de un ZIP y los que van fuera 
                              Map<String, List<Transaction>> listsGroupZip = listaGrupo.stream().filter(compress -> compress.getCompressName() !=null)
                                                                                         .collect(Collectors.groupingBy(compress -> compress.getCompressName()));
                              
                          listsGroupZip.forEach((compressName,compressMap)->{
                          compressMap.forEach((notification)->{
                                  if(compressName.isEmpty()){              
                                                  pojoAgrupado.getTransactions().getTransaction().add(notification);
                                                  listMsjs.remove(notification);                                  
                                        }
                                  //dentro de un zip
                                  else{
                                            try {
                                                List<Transaction> transactions = new ArrayList<Transaction>();
                                                transactions.add(notification);
                                                pojoAgrupado.getTransactions().getTransaction().add(GenerateTransactionsZip(transactions));
                                                listMsjs.remove(notification);
                                            } catch (IOException e) {
                                                throw new RuntimeException(e);
                                            }   
                                        }    
                                  });
                              });
                    }
///////////////////////////////////transacciones que se agrupan//////////////////////////////////////////////////////////////
                else{
                    //realizamos agrupado por receptor emisor y email
                    Map<String, Map<String, Map<String, List<Transaction>>>> listGrouped = 
                        listaGrupo.stream().collect(Collectors.groupingBy(receptor -> receptor.getReceptor()
                                                                          ,Collectors.groupingBy(emisor -> emisor.getEmisor()
                                                                                                 ,Collectors.groupingBy(email -> email.getEmail()))));
                    
                    listGrouped.forEach((receptorKey,receptorMap)->{
                            receptorMap.forEach((emisorKey,emisorMap)->{
                                emisorMap.forEach((emailKey,emailMap)->{
                                    try{
                                        pojoAgrupado.getTransactions().getTransaction().add(GenerateTransactionFromListTrasactions(emailMap));
                                        
                                        } catch (IOException e) {
                                            throw new RuntimeException(e);
                                        }
                                    });
                                });
                        });   
                }
            });

       
/////////////////////////////////////////procesamos los msjs que no se agrupan y compress(no existe el nodo)////////////////////////////////////////////
  //se agrupan los que van dentro de un ZIP y los que van fuera	
	Map<String, List<Transaction>> listsGroupZip = listMsjs.stream().filter(compress -> compress.getCompressName() !=null)
                                                                   .collect(Collectors.groupingBy(compress -> compress.getCompressName()));
	
    listsGroupZip.forEach((compressName,compressMap)->{
    compressMap.forEach((notification)->{
            if(compressName.isEmpty()){              
                            pojoAgrupado.getTransactions().getTransaction().add(notification);
                            listMsjs.remove(notification);                                  
                  }
            //dentro de un zip
            else{
                      try {
                          List<Transaction> transactions = new ArrayList<Transaction>();
                          transactions.add(notification);
                          pojoAgrupado.getTransactions().getTransaction().add(GenerateTransactionsZip(transactions));
                          listMsjs.remove(notification);
                      } catch (IOException e) {
                          throw new RuntimeException(e);
                      }   
                  }    
            });
        });
                  
       //las que tienen compress null           
       listMsjs.forEach((notification)->{
                          pojoAgrupado.getTransactions().getTransaction().add(notification);
                          //listMsjs.remove(notification);
            });
        
    	return pojoAgrupado;
    }
    
    //genera una trasaccion con arreglo de adjuntos apartir de una lista de transacciones
    public Transaction GenerateTransactionFromListTrasactions(List<Transaction> transacciones) throws IOException {
        
        //objeto donde vamos a ir agrupando
	Transaction transactionAgrupada =new Transaction();
	//header para la transaccion
	transactionAgrupada.setAttached(new Attached());
	transactionAgrupada.setEmail(transacciones.get(0).getEmail());
	transactionAgrupada.setReceptor(transacciones.get(0).getReceptor());
	transactionAgrupada.setEmisor(transacciones.get(0).getEmisor());
	transactionAgrupada.setSubject(transacciones.get(0).getSubject());
	      
	//se agrupan los que van dentro de un ZIP y los que van fuera	
	Map<String, List<Transaction>> listsGroupZip = transacciones.stream().filter(compress -> compress.getCompressName() !=null)
                                                                   .collect(Collectors.groupingBy(compress -> compress.getCompressName()));
	
    listsGroupZip.forEach((compressKey,compressMap)->{       
/////////////////////////////////los que no se comprimen se agregan a la transactionAgrupada//////////////////////////////////////////////////
            if(compressKey.isEmpty()) {
                //recorremos los documentos que no se comprimen 
                compressMap.forEach((notification)->{
                    //agregamos todos los attachment a la peticion agrupada
                        transactionAgrupada.getAttached().getAttachments().addAll(notification.getAttached().getAttachments());
                        listMsjs.remove(notification);
                        transacciones.remove(notification);
                    });   
            }
///////////////////////////////bloque que comprime los adjuntos en uno o mas zip///////////////////////////////////////////////////////////////////
            else{
                try{
                    //enviamos la lista de notifiaciones que se comprimen y 
                    //obtenemos el zip de respuesta para agregarla transactionAgrupada
                       transactionAgrupada.getAttached().getAttachments().addAll(GenerateTransactionsZip(compressMap).getAttached().getAttachments());
                      listMsjs.removeAll(compressMap);
                      transacciones.removeAll(compressMap);
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
        });
    
///////////////////////////notificaciones que no tienen el nodo compress//////////////////////////////////////////////////////////////////////////
    transacciones.forEach((notification)->{
            transactionAgrupada.getAttached().getAttachments().addAll(notification.getAttached().getAttachments());
           listMsjs.remove(notification);
        });    
    	return transactionAgrupada;
    }
    //este metodo se encarga de ingresar una lista de trasacciones en un zip
    public static Transaction GenerateTransactionsZip(List<Transaction> transactions) throws IOException {
    		//objeto donde colocaremos el zip
    	Transaction transactionZip =new Transaction();
    	Attachments attachmentZip= new Attachments();
    	byte[] docBinary = null;
    	ByteArrayOutputStream ZipBos = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(ZipBos);
    	//llenamos zip con los documentos del agrupado
    	for (Transaction transaction : transactions) {
    		//recorremos el arreglo de documentos
    		for (Attachments attachment: transaction.getAttached().getAttachments()) {
				
	    		ZipEntry zipEntryPDF = new ZipEntry(attachment.getName());
	    		zipEntryPDF.setSize(attachment.getBinaryDoc().length);
	    		zip.putNextEntry(zipEntryPDF);
	                zip.write(attachment.getBinaryDoc());  
    			
			}  
		}
    	
    	zip.close();
        docBinary = ZipBos.toByteArray();
        ZipBos.close();
        
        String docName =  transactions.get(0).getCompressName() + ".zip";
  
        transactionZip.setAttached(new Attached());
        transactionZip.getAttached().getAttachments().add(attachmentZip);
        transactionZip.setEmail(transactions.get(0).getEmail());
        transactionZip.setReceptor(transactions.get(0).getReceptor());
        transactionZip.setEmisor(transactions.get(0).getEmisor());
        transactionZip.setSubject(transactions.get(0).getSubject());
        transactionZip.getAttached().getAttachments().get(0).setBinaryDoc(docBinary);
        transactionZip.getAttached().getAttachments().get(0).setName(docName);
        transactionZip.getAttached().getAttachments().get(0).setContentType("application/octet-stream");
    	
    	return transactionZip;

    }
 
}
