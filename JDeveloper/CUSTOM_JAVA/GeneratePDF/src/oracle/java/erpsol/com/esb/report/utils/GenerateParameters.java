package oracle.java.erpsol.com.esb.report.utils;

import java.io.IOException;
import java.io.Reader;
    
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

import com.opencsv.CSVReader;


import com.opencsv.exceptions.CsvException;

import java.io.Serializable;

import java.util.logging.Logger;

import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

//esta clase se encarga de generar los parametros a enviar al reporte
//recibe el csv con los datos mapeados de jasper  y el map con los datos mapeados del xml  
public class GenerateParameters{
	//private static final Logger LOGGER = LoggerFactory.getLogger(GeneratePdFfromXmlApplication.class);
	private Map<String, Object> parameters;
	private String xmlFile;

	public GenerateParameters(Map<String, Object> parameters, String xmlFile) {
		super();
		this.parameters = parameters;
		this.xmlFile = xmlFile;
	}

	// este metodo obtiene el map de datos de un csv y un map de todos los datos
	public Map<String, Object> Generate() {
	//	LOGGER.info("Iniciando generacion de Map de parametros Jasper");
	try {
			Reader reader = null;
			reader = Files.newBufferedReader(Paths.get(xmlFile));
			CSVReader csvReader = new CSVReader(reader);
			//LOGGER.info("Archivo CSV de mapeo obtenido exitosamente");
			List<String[]> records;
			
				records = csvReader.readAll();

			Iterator<String[]> iterator = records.iterator();
			iterator.next();// brincamos el header
			Map<String, Object> parametros = new HashMap<String, Object>();
			
			
			while (iterator.hasNext()) {
				String[] record = iterator.next();
				int key =3;
				int keyValues =2;
				int isArray=1;
				
				if (!record[key].isEmpty()) {
					
//parametros que se usan que estan nulos
					if (this.parameters.get(record[keyValues])==null) {
						
						
					  parametros.put(record[key], "");
					} else {
					//System.out.println(record[keyValues]);
					// realizamos el tratamiento de arreglos
					if (this.parameters.get(record[keyValues]).getClass().getTypeName().equals("java.util.ArrayList")) {
						//System.out.println( record[key]+this.parameters.get(record[keyValues]));
						
						
						parametros.put(record[key], ProcessList((List<Object>) this.parameters.get(record[keyValues])));

					} else {
						
							if(record[keyValues].equals("Logo")) {
								
								//variable formato original
								parametros.put(record[key], this.parameters.get(record[keyValues]));
							}
							else {
							//parametros.put(record[key], this.parameters.get(record[keyValues]).toString());
                             parametros.put(record[key], this.parameters.get(record[keyValues]));

							}
					}
					}
				}
			}
			//LOGGER.info("Map de parametros Jasper generado con exito");
			//csvReader.close();
			//reader.close();
                        
	return parametros;
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
    }finally{
                //csvReader.close();
                //reader.close();
            }
        return null;
	}

	// esta clase encarga de procesar los list y retornar JRBeanCollectionDataSource
	public JRBeanCollectionDataSource ProcessList(List<Object> listItems) {
		JRBeanCollectionDataSource itemsJRBean = new JRBeanCollectionDataSource(listItems);

		for (Object object : listItems) {
			Method[] metodos = object.getClass().getMethods();
			for (Method metodo : metodos) {
				try {
					// traemos todo los get y la clase
					if (metodo.getName().contains("get") && !metodo.getName().contains("getClass")) {
						// omitimos los que son arreglos
						if (!metodo.getReturnType().isInterface()) {
							metodo.invoke(object, null);
							// System.out.println(metodo.getName()+" : "+);
						}
					}
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return itemsJRBean;
	}

}
