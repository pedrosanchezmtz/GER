package oracle.java.erpsol.com.esb.report.utils;

import java.io.Serializable;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import java.util.Base64;
import java.util.List;
import java.util.Map;


//import java.util.logging.Logger;

//import org.slf4j.LoggerFactory;

//esta clase genera un Map de todos los atributos y arrayList de la clase dada con un key de ruta de clase y values con el valor
public class GenerateData{

    //private static final Logger LOGGER = (Logger) LoggerFactory.getLogger(GeneratePdFfromXmlApplication.class);

    // clase optenida del xml
    private Object clase;
    // map con key=rutaclase : values=valor de ruta
    private Map<String, Object> parameters;
   // byte[] logoBase64;


    public GenerateData(Object clase, Map<String, Object> parameters) {
        super();
        this.clase = clase;
        this.parameters = parameters;
     //   this.logoBase64 = logoBase64;
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
        	
            Method metodo = clase.getClass().getDeclaredMethod(methodTex, null);
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

    // retorna todos los elementos y sub elemntos declarados de una clase
    public Object GetMethods(Object clase) {
        // LOGGER.info("--------------Metodos de la clase:{}-------------------",
        // clase.getClass().getName());
        if (clase.getClass()
                 .getName()
                 .isEmpty()) {
            // LOGGER.error("--------------Metodo {} no declarado-------------------",
            // clase.getClass().getName());
        }
        Method[] metodos = clase.getClass().getDeclaredMethods();
        for (Method metodo :
             metodos) {
            // ubicamos solo los elementos get de todos los metodos
            if (metodo.getName().contains("get") &&
                !metodo.getName()
                                  .contains("getClass")) {
                // Filtramos todos los elementos tipo List
                if (metodo.getReturnType()
                    .isInterface()) {
                    // LOGGER.info("\nombreJava: {}" + "\nValor: {}", clase.getClass().getName().replace(clase.getClass().getPackage().getName().toString()+".", "")+"->"+metodo.getName(), GetListMethod(clase, metodo.getName()));
                    parameters.put(clase.getClass()
                                        .getName()
                                        .replace(clase.getClass()
                                                      .getPackage()
                                                      .getName()
                                                      .toString() + ".", "") + "->" + metodo.getName(),
                                   GetListMethod(clase, metodo.getName()));
                } else {
                    // detectamos si hay subclases que no son list
                    if (metodo.getReturnType()
                              .toString()
                              .contains("$")) {
                        try {
                            // LOGGER.info("--------------Metodos con subclase : {}-------------------",clase.getClass().getName().replace(clase.getClass().getPackage().getName().toString()+".", "")+"->"+metodo.getName());
                            // se invoca de nuevo el metodo para que obtenga los datos de la subclase
                            GetMethods(GetMethod(clase, metodo.getName()));
                        } catch (Exception e) {
                            // LOGGER.error("--------------Metodo {} no declarado, {} -------------------", metodo.getName(),e.getMessage());
                        }

                    }
                    // Atributos simples de clase
                    else {
                        // si el valor del metodo es null lo llenamos ""
                        if (GetMethod(clase, metodo.getName()) == null) {
                            // LOGGER.error("\nombreJava: {}" + "\nValor: {}", clase.getClass().getName().replace(clase.getClass().getPackage().getName().toString()+".", "")+"->"+metodo.getName(), "");
                            parameters.put(clase.getClass()
                                                .getName()
                                                .replace(clase.getClass()
                                                              .getPackage()
                                                              .getName()
                                                              .toString() + ".", "") + "->" + metodo.getName(), "");
                        } else {
                            //LOGGER.info("\nombreJava: {}" + "\nValor: {}", clase.getClass().getName().replace(clase.getClass().getPackage().getName().toString()+".", "")+"->"+metodo.getName(), GetMethod(clase, metodo.getName()));
                            parameters.put(clase.getClass()
                                                .getName()
                                                .replace(clase.getClass()
                                                              .getPackage()
                                                              .getName()
                                                              .toString() + ".", "") + "->" + metodo.getName(),
                                           GetMethod(clase, metodo.getName()));
                        }
                    }
                }
            }
        }

        //agregamos el el Logo a los parametros
        //agregamos a la imagen
       // parameters.put("Logo", logoBase64);

        return null;
        // LOGGER.info("************************Fin de Metodo: {}*********************\n", clase.getClass().getName());
    }

    public List<Object> GetListMethod(Object clase, String stringMethod) {
        // LOGGER.info("--------------Metodos de la clase tipo arreglo:{}-------------------",stringMethod);
        List<Object> items = (List<Object>) GetMethod(clase, stringMethod);
        // se valida que el arreglo no este vacio
        if (items.isEmpty()) {
            // LOGGER.error("+++++++++++++Metodo arreglo: {} no declarado+++++++++++++++++++\n",stringMethod);

        } else {
            for (Object object : items) {
                GetMethods(object);
            }
        }
        return items;
    }

    public void Genarate() {
        //LOGGER.info("Generando Map de datos de XML");
        GetMethods(clase);
        //LOGGER.info("Map de datos de XML generado exitosamente");
    }

}
