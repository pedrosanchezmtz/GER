package oracle.java.erpsol.com.esb.pojo.util;

import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;

import java.io.Serializable;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
//esta clse se encarga de llenar un archivo CSV con datos de una clase para poder usarlo para relacion DatoJava -> DatoJasper
public class GenerateMapCSV implements Serializable {
	// private static final Logger LOGGER =
	// LoggerFactory.getLogger(GeneratePdFfromXmlApplication.class);
	 Map<String, String> parameters;
	String rutaSalidaArchivo; // ruta de salida del archivo CSV
	Object clase; // clase de la cual sacaremos su mapeo de datos
	List<String[]> allData = new ArrayList<String[]>(); // array con todos los datos del CSV
	//byte[] logoBase64;

	public GenerateMapCSV(String rutaSalidaArchivo, Object clase) {

		this.rutaSalidaArchivo = rutaSalidaArchivo;

//        this.logoBase64 = logoBase64;
        this.clase = clase;
	}

	public GenerateMapCSV() {
		// TODO Auto-generated constructor stub
	}
	
	// este metodo obtiene el map de datos de un csv y un map de todos los datos
	public Map<String,Integer> GetMapCSV(String xmlFile) {
	//	LOGGER.info("Iniciando generacion de Map de parametros Jasper");
	try {
			Reader reader = null;
			reader = Files.newBufferedReader(Paths.get(xmlFile),Charset.forName("ISO-8859-1"));
			CSVReader csvReader = new CSVReader(reader);
			//LOGGER.info("Archivo CSV de mapeo obtenido exitosamente");
			List<String[]> records= csvReader.readAll();
			
			Iterator<String[]> iterator = records.iterator();
			iterator.next();// brincamos el header
			Map<String,Integer> parametros = new HashMap<String,Integer>();
			
			
			while (iterator.hasNext()) {
				String[] record = iterator.next();
				int key =2;
				int keyValues =3;
				//si parametro es vacio
				if(!record[keyValues].isEmpty()) {
				parametros.put(record[key],Integer.parseInt(record[keyValues]));
				//System.out.println(parametros.get(record[key]));
				}
			}
			
			//LOGGER.info("Map de parametros Jasper generado con exito");
	return parametros;
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
        return null;
	}

	// retorna la el tipo de la clase
	public Object GetTypeReturnMethod(Object clase, String textMethod) {
		try {
			Method metodo = clase.getClass().getDeclaredMethod(textMethod, null);
			return metodo.getReturnType();
		} catch (NoSuchMethodException | SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	// retorna la respuesta del metodo
	public Object GetMethod(Object clase, String methodTex) {
		try {
			Method metodo = clase.getClass().getMethod(methodTex, null);
			Object object;
			object = metodo.invoke(clase, null);
			return object;
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException
				| SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	// retorna todos los elementos declarados de una clase
	public void GetMethods(Object clase) {
		// LOGGER.info("--------------Metodos de la clase:{}-------------------",
		// clase.getClass().getName());
		Method[] metodos = clase.getClass().getMethods();
		for (Method metodo : metodos) {
			// ubicamos solo los elementos get de todos los metodos
			if (metodo.getName().contains("get")&&metodo.getName()!="getClass") {
				// Filtramos todos los elementos tipo List
				if (metodo.getReturnType().isInterface()) {
					String[] data = new String[] { metodo.getReturnType().getName(), "1",
							clase.getClass().getName() };
					SetTupla(allData, data);
					List<Object> items = GetListMethod(clase, metodo.getName());

				} else {
					// detectamos si hay subclases que no son list
					if (metodo.getReturnType().toString().contains("$")) {
						try {
							// LOGGER.info("--------------Metodos con subclase : {} Tipo:
							// {}-------------------",metodo.getName(), metodo.getReturnType().getName());
							// se invoca de nuevo el metodo para enviandole la subclase para que obtenga los
							// datos de la subclase
							GetMethods(GetMethod(clase, metodo.getName()));
						} catch (Exception e) {
							// LOGGER.error("--------------Metodo {} no declarado, {} -------------------",
							// metodo.getReturnType().getName(),e.getMessage());
						}

					}
					// Atributos simples de clase
					else {
						String[] data = new String[] { metodo.getReturnType().getName(), "0",
								clase.getClass().getName()+"->"+metodo.getName().replace("get", "")};
						SetTupla(allData, data);
						// LOGGER.info("\nNombre: {}," + "\nTipo: {}",
						// metodo.getName(),metodo.toString());

					}
				}
			}
		}

		// agregamos a la imagen

		// LOGGER.info("************************Fin de Metodo: {}
		// *********************\n", clase.getClass().getName());
	}

	public List<Object> GetListMethod(Object clase, String stringMethod) {
		// LOGGER.info("--------------Metodos de la clase tipo
		// arreglo:{}-------------------",stringMethod);
		List<Object> items = (List<Object>) GetMethod(clase, stringMethod);
		// se valida que el arreglo no este vacio
		if (items.isEmpty()) {
			// LOGGER.error("+++++++++++++Metodo arreglo: {} no
			// declarado+++++++++++++++++++\n",clase.getClass().getName());

			// GetMethods(items.get(0));

		} else {

			GetMethods(items.get(0));

		}
		return items;
	}

	public void Genarate() {

		GetMethods(clase);

	}

	public void CreateCSV()

	{
		System.out.println("creando CSV");
		boolean reprocesa = true;

		if (reprocesa) {
			File file = new File(rutaSalidaArchivo);
			file.delete();
		} else {
			// return true;
		}

		// creamos archivo CSV
		CSVWriter writer;
		try {
			writer = new CSVWriter(new FileWriter(rutaSalidaArchivo));

			// obtenemos el header y escribimos
			String[] header = { "tipo", "isArray", "nombreJava", "numP","nombreCloud" };
			// GetHeader("P:\\Desarrollo\\Spring\\GeneratePDFfromXML\\src\\main\\resources\\csv\\header.csv");
			writer.writeNext(header);

			// con el header generamos los renglones dinamicamente
			//String[] data = new String[] { "byte[]", "0", "Logo" };
			//SetTupla(allData, data);
			writer.writeAll(allData);

			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("se genero CSV: "+rutaSalidaArchivo);

	}

	// este metodo se encarga de generar una tupla dentro del erreglo de tuplas
	public List<String[]> SetTupla(List<String[]> Tuplas, String[] tupla) {
		Tuplas.add(tupla);
		for (String atributo : tupla) {
			// prueba
			// LOGGER.info("atributo: {} ",atributo);

		}

		return null;
	}

	// este metodo regresa el header de un csv con N columnas
	public String[] GetHeader(String rutaArchivo) {
		try {
			Reader reader;
			reader = Files.newBufferedReader(Paths.get(rutaArchivo));
			CSVReader csvReader = new CSVReader(reader);

			// optenemos la pirmer linea del archivo osea el header
			String[] nextRecord;
			nextRecord = csvReader.readNext();
			// prueba
			// for (String columna : nextRecord){System.out.println(columna);}
			return nextRecord;
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

}
