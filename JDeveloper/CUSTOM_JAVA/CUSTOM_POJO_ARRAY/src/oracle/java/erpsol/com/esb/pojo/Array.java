package oracle.java.erpsol.com.esb.pojo;

import com.erpsol.java.oracle.xmlns.esb.pojo.arrays.ArraysDocument;
import com.erpsol.java.oracle.xmlns.esb.pojo.arrays.ArraysDocument.Arrays.Array.Atributos;

public class Array {
    ArraysDocument arraysXML = ArraysDocument.Factory.newInstance();
    String arrayString;

    
    //recibe un string con formato 'dato1{|line:3133,|line:999|line:777|line:555|line:333|line:111},dato2{|line:3133|line:999|line:777|line:555|line:333|line:111}'
    public Array(String datos) {
        arrayString=datos;
    }
    public String GetXMLArray(){
        arraysXML.addNewArrays();

        String[] array = arrayString.split("\\|");
        
        
        
        for(String dato :array){
            Atributos atributos= arraysXML.getArrays().addNewArray().addNewAtributos();
           String[] atributo= dato.split(":");
            atributos.setNombre(atributo[0]);
           atributos.setDato(atributo[1]);
            
            
        }
        
    
        
        return arraysXML.xmlText();
    }
    
}
