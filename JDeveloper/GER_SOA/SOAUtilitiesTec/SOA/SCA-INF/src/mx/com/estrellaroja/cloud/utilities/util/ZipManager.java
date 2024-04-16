package mx.com.estrellaroja.cloud.utilities.util;

import com.github.junrar.Archive;

import com.github.junrar.rarfile.FileHeader;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;


import java.io.InputStream;


import java.nio.charset.Charset;


import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import mx.com.estrellaroja.cloud.utilities.impl.types.AttachmentType;
import mx.com.estrellaroja.cloud.utilities.impl.types.DecompressFileRsType;



//esta clase se encarga de descomprimir uno o mas  de .zip o .rar
//o
//comprimir uno o mas documentos
public class ZipManager {

    //metodo que descomprime archivos rar
    public void UnRar(AttachmentType attachment, DecompressFileRsType attachmentsResponse) {
        try {
        
        
        Map<String, byte[]> mapFiles = new HashMap<>();
        ByteArrayInputStream bais = new ByteArrayInputStream(attachment.getAttachmentContent());
        

                final Archive archive = new Archive(bais);
                FileHeader fileHeader;
                while ((fileHeader = archive.nextFileHeader()) != null) {
                  ByteArrayOutputStream baos = new ByteArrayOutputStream();
                  archive.extractFile(fileHeader, baos);

                  mapFiles.put(fileHeader.getFileName(), baos.toByteArray());
                    
                    AttachmentType zipAttachment = new AttachmentType();
                    zipAttachment.setFileName(fileHeader.getFileName());
                    zipAttachment.setAttachmentContent(baos.toByteArray());
                    zipAttachment.setAttachmentType("application/octet-stream");
                    attachmentsResponse.getReturn().add(zipAttachment);
                }
                archive.close();
        
            
            
        } catch (Exception e) {
            attachmentsResponse.setSuccess(false);

            mx.com.estrellaroja.cloud.utilities.impl.types.ErrorType error = new mx.com.estrellaroja.cloud.utilities.impl.types.ErrorType();
            error.setErrorCode("SPRING-0004");
            error.setFailedService("DecompressFile-UnRar");
            error.setBusinessProcess("SOAUtilitiesTec");
            error.setShortDescription("Error "+e.toString());
            error.setDescription("Error "+e.getMessage());
            attachmentsResponse.setErrors(new mx.com.estrellaroja.cloud.utilities.impl.types.ErrorsType());
            attachmentsResponse.getErrors().getError().add(error);
            
        }
                             
        
      /* alternativa con fallas
                             String filename="C:\\Users\\pedro\\OneDrive\\Documentos\\Documentos.zip";
                              File f = new File(filename);
                              Archive a=null;
                              try {
                             
                                      a = new Archive(new NativeStorage(f));
                              } catch (RarException e) {
                                      // TODO Auto-generated catch block
                                      e.printStackTrace();
                              } catch (IOException e) {
                                      // TODO Auto-generated catch block
                                      e.printStackTrace();
                              }

                              if(a!=null){
                                      a.getMainHeader().print();
                                      FileHeader fh = a.nextFileHeader();
                                      while(fh!=null){        
                                              try {
                                                      File out = new File("C:\\Users\\pedro\\OneDrive\\Documentos\\"+fh.getFileNameString().trim());
                                                      System.out.println(out.getAbsolutePath());
                                                      FileOutputStream os = new FileOutputStream(out);
                                                      a.extractFile(fh, os);
                                                  
                                                  AttachmentType zipAttachment = new AttachmentType();
                                                  zipAttachment.setFileName(fh.getFileNameString().trim());
                                                  zipAttachment.setAttachmentContent(fh.getFileNameByteArray());
                                                  zipAttachment.setAttachmentType("application/octet-stream");
                                                  attachmentsResponse.getReturn().add(zipAttachment);
                                                      os.close();
                                              } catch (FileNotFoundException e) {
                                                      // TODO Auto-generated catch block
                                                      e.printStackTrace();
                                              } catch (RarException e) {
                                                      // TODO Auto-generated catch block
                                                      e.printStackTrace();
                                              } catch (IOException e) {
                                                      // TODO Auto-generated catch block
                                                      e.printStackTrace();
                                              }
                                              fh=a.nextFileHeader();
                                      }
                              }
*/
    }

    //esta funcion recibe un zip y retorna arreglo de documentos
    public void UnZip(AttachmentType attachment, DecompressFileRsType attachmentsResponse) {
        Charset CP866 = Charset.forName("CP866");
        byte[] buffer = new byte[2048];

        try {

            InputStream stream = new ByteArrayInputStream(attachment.getAttachmentContent());
           // ZipInputStream zis = new ZipInputStream(stream);
            ZipInputStream zis = new ZipInputStream(stream,CP866);

            // ZipInputStream zis = new ZipInputStream(new FileInputStream("resources\\resources.zip"));

            // ze;
            ZipEntry ze = zis.getNextEntry();

            while (ze != null) {
                if (!ze.isDirectory()) {
                    ByteArrayOutputStream ZipBos = new ByteArrayOutputStream();
                    String nombreArchivo = ze.getName();
                    int len;
                    while ((len = zis.read(buffer)) > 0) {
                        ZipBos.write(buffer, 0, len);
                    }

                    
                    AttachmentType zipAttachment = new AttachmentType();
                    zipAttachment.setFileName(nombreArchivo);
                    zipAttachment.setAttachmentContent(ZipBos.toByteArray());
                    zipAttachment.setAttachmentType("application/octet-stream");
                    attachmentsResponse.getReturn().add(zipAttachment);

                }
                //cuando es un directorio
                else {
                    
                }
                ze = zis.getNextEntry();
            }
            zis.closeEntry();
            zis.close();

        } catch (Exception e) {
            attachmentsResponse.setSuccess(false);

            mx.com.estrellaroja.cloud.utilities.impl.types.ErrorType error = new mx.com.estrellaroja.cloud.utilities.impl.types.ErrorType();
            error.setErrorCode("SPRING-0004");
            error.setFailedService("DecompressFile-UnZip");
            error.setBusinessProcess("SOAUtilitiesTec");
            error.setShortDescription("Error "+e.toString());
            error.setDescription("Error :"+e.getMessage());
            attachmentsResponse.setErrors(new mx.com.estrellaroja.cloud.utilities.impl.types.ErrorsType());
            attachmentsResponse.getErrors().getError().add(error);
        
        }
    }

}
