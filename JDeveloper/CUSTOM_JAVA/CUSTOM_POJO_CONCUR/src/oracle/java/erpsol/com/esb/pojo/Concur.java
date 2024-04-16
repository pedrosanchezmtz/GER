package oracle.java.erpsol.com.esb.pojo;

import java.io.IOException;
import java.io.Serializable;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import java.util.Base64;
import java.util.Map;

import oracle.java.erpsol.com.esb.pojo.concur.AbstractConcur;
import oracle.java.erpsol.com.esb.pojo.concur.AbstractConcur.AbstractConcurHeader;
import oracle.java.erpsol.com.esb.pojo.concur.AbstractConcur.Lines;
import oracle.java.erpsol.com.esb.pojo.concur.AbstractConcur.Lines.Line;
import oracle.java.erpsol.com.esb.pojo.util.ConfProperties;
import oracle.java.erpsol.com.esb.pojo.util.GenerateData;
import oracle.java.erpsol.com.esb.pojo.util.GenerateMapCSV;

public class Concur implements Serializable {
    String abstractConcur;
    String xmlAbstractConcur;
    AbstractConcur claseAbstractConcur;
    GenerateData data;

    public Concur() {
        
    }

    public String GetXmlAbstractConcur(String abstractConcurB64) {
    	
        //creamos objeto principal y header y lineas
        claseAbstractConcur = new AbstractConcur();
        claseAbstractConcur.setLines(new Lines());
        claseAbstractConcur.setAbstractConcurHeader(new AbstractConcurHeader());
        
		try {
			this.abstractConcur = new String(Base64.getDecoder().decode(abstractConcurB64));
        //inicializamos Objeto vacio
        String xmlAbstractConcurLine =
            "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" + "<AbstractConcur>\n" + "  <AbstractConcurHeader/>\n" +
            "  <Lines>\n" + "    <Line>\n" + "      <BatchData />\n" + "      <EmployeeData/>\n" +
            "      <ReportData/>\n" + "      <EntryData/>\n" + "      <CreditCardData/>\n" +
            "      <EntryLocationData/>\n" + "      <JournalEntryData/>\n" + "      <CarMileageData/>\n" +
            "      <CashAdvanceData/>\n" + "      <AllocationData/>\n" + "      <TravelAllowanceData/>\n" +
            "      <VATTaxData/>\n" + "      <AssignedTravelRequestData/>\n" + "      <FutureUseSection/>\n" +
            "      <ExpensePayData/>\n" + "      <EmployeeBankingData/>\n" + "      <ReportEntryData/>\n" +
            "      <RequestData/>\n" + "    </Line>\n" + "  </Lines>\n" + "</AbstractConcur>";
        //Obtenemos el mapeo del CSV
        GenerateMapCSV mapeo = new GenerateMapCSV();
        //obtenemos el Path del mapeo
        ConfProperties properties;

			properties = new ConfProperties();

        String csvPath = properties.getProp().getProperty("ws.esb.concur.csv.path");
        Map<String, Integer> parameters = mapeo.GetMapCSV(csvPath);


        //llenamos espacios vacios
        abstractConcur = abstractConcur.replace("||", "|#NULL#|").replace("||", "|#NULL#|");
        //obtenemos lineas
        String[] arrayLines = abstractConcur.split("\n");



        //recorremos lienas
        for (int i = 0; i < arrayLines.length; i++) {
            //obtenemos los datos de la linea separada por |
            String[] arrayLineCampos = arrayLines[i].split("\\|");
            //creamos el template del principal
            data = new GenerateData();
            AbstractConcur claseAbstractConcurLine = data.GeneratePojo(xmlAbstractConcurLine);
            

            //header
            if (i <= 0) {
                //treamos la clase headera llenar
                AbstractConcurHeader header = claseAbstractConcurLine.getAbstractConcurHeader();
                //recorremos  los metodos de header
                Method[] methodsHeader = header.getClass().getMethods();
                for (Method methodHeader : methodsHeader) {
                    //tomamos solo los metodos set que vamos a utilizar
                    if (methodHeader.getName().contains("set")) {
                        String methodName = methodHeader.getName();
                        String key = header.getClass().getName() + "->" + methodName.replace("set", "");
                        // System.out.println(key);

                        //si existe el objeto en el CSV
                        if (parameters.get(key) != null) {
                            //obtenemos el valor que le corrsponde al objeto
                            int numCampo = parameters.get(key) - 1;
                            //  System.out.println(parameters.get(key)+" : "+key);

                            //si el numero de campo es mayor a los que hay en CONCUR

                            if (numCampo < arrayLineCampos.length) {
                                //si el objeto tiene datos se pobla
                                if (!arrayLineCampos[numCampo].contains("#NULL#")) {
                                    SetMethod(header, methodName, arrayLineCampos[numCampo]);
                                }

                            }
                        }

                    }

                }

                //agregamos el header generado al principal
                claseAbstractConcur.setAbstractConcurHeader(header);

            }

            //lines
            else {
                //traemos la clase linea a llenar
                Line line = claseAbstractConcurLine.getLines().getLine().get(0);

                //recorremos recorremos los metodos de la linea
                Method[] methodsLine = line.getClass().getMethods();
                for (Method methodLine : methodsLine) {
                    //tomamos solo los metodos que vamos a utilizar
                    if (methodLine.getName().contains("get") && !methodLine.getName().contains("getClass")) {
                        //ejecutamos el metodo y traemos los metodos que tenga dentro
                        Object claseAbstractConcurLineMethod = GetMethod(line, methodLine.getName());
                        Method[] methodLineMethods = claseAbstractConcurLineMethod.getClass().getMethods();
                        //recorremos metodos
                        for (Method methodLineMethod : methodLineMethods) {
                            //tomamos en cuenta solo metodos de envio de datos
                            if (methodLineMethod.getName().contains("set")) {
                                String methodName = methodLineMethod.getName();
                                String key =
                                    claseAbstractConcurLineMethod.getClass().getName() + "->" +
                                    methodName.replace("set", "");

                                //si existe el objeto en el CSV
                                if (parameters.get(key) != null) {
                                    //obtenemos el valor que le corrsponde al objeto
                                    int numCampo = parameters.get(key) - 1;
                                    //System.out.println(parameters.get(key)+" : "+key);

                                    //si el numero de campo es mayor a los que hay en CONCUR

                                    if (numCampo < arrayLineCampos.length) {
                                        //si el objeto tiene datos se pobla
                                        if (!arrayLineCampos[numCampo].contains("#NULL#")) {
                                            SetMethod(claseAbstractConcurLineMethod, methodName,
                                                      arrayLineCampos[numCampo]);
                                        }

                                    }
                                }

                            }
                        }
                    }
                }
                //agregamos la linea generada al principal
                claseAbstractConcur.getLines()
                                   .getLine()
                                   .add(line);

            }

        }
xmlAbstractConcur = data.GenerateXML(claseAbstractConcur);

        return xmlAbstractConcur;
        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return xmlAbstractConcur;
		}
    }


    // retorna la respuesta del metodo
    public Object GetMethod(Object clase, String methodTex) {
        try {
            Method metodo = clase.getClass().getMethod(methodTex, null);
            Object object;
            object = metodo.invoke(clase, null);
            return object;
        } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException |
                 NoSuchMethodException | SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    // envia y ejecuta metodo simple
    public void SetMethod(Object clase, String methodTex, String var1) {
        try {
            Method metodo = clase.getClass().getMethod(methodTex, String.class);
            Object object;
            object = metodo.invoke(clase, var1);

        } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException |
                 NoSuchMethodException | SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}

