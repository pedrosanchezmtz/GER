package oracle.java.erpsol.com.esb.report.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import java.nio.file.Files;
import java.nio.file.Paths;

import java.util.ArrayList;
import java.util.List;

import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;

import java.io.Serializable;

import oracle.java.erpsol.com.esb.report.quality.certificate.GetData;
//esta clse se encarga de llenar un archivo CSV con datos de una clase para poder usarlo para relacion DatoJava -> DatoJasper
public class GenerateMapCSV {
	// private static final Logger LOGGER =
	// LoggerFactory.getLogger(GeneratePdFfromXmlApplication.class);

	String rutaSalidaArchivo; // ruta de salida del archivo CSV
	Object clase; // clase de la cual sacaremos su mapeo de datos
	List<String[]> allData = new ArrayList<String[]>(); // array con todos los datos del CSV
	//byte[] logoBase64;

	public GenerateMapCSV(String nameCSV, Object clase) {

		ConfProperties properties = new ConfProperties();
		String csvPath = properties.getProp().getProperty("ws.esb.jasper.csv.path");

		String l = File.separator;
		rutaSalidaArchivo = csvPath + l + nameCSV + ".csv";
	    
//        this.logoBase64 = logoBase64;
        this.clase = clase;
	}

	public GenerateMapCSV() {
		// TODO Auto-generated constructor stub
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
			if (metodo.getName().contains("get") && !metodo.getName().contains("getClass")) {
				// Filtramos todos los elementos tipo List
				if (metodo.getReturnType().isInterface()) {
					String[] data = new String[] { metodo.getReturnType().getName(), "1",
							clase.getClass().getName().replace(clase.getClass().getPackage().getName().toString() + ".",
									"") + "->" + metodo.getName() };
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
								clase.getClass().getName()
										.replace(clase.getClass().getPackage().getName().toString() + ".", "") + "->"
										+ metodo.getName() };
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
			String[] header = { "tipo", "isArray", "nombreJava", "nombreJasper" };
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
	    Reader reader;
	    CSVReader csvReader;
		try {
			
			reader = Files.newBufferedReader(Paths.get(rutaArchivo));
			csvReader = new CSVReader(reader);

			// optenemos la pirmer linea del archivo osea el header
			String[] nextRecord;
			nextRecord = csvReader.readNext();
			// prueba
			// for (String columna : nextRecord){System.out.println(columna);}
                    
			//csvReader.close();
			//reader.close();
			return nextRecord;
		} catch (IOException e) {
			e.printStackTrace();
                        }


		return null;
	}

}
