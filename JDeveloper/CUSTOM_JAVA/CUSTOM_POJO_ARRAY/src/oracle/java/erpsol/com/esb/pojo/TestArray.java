package oracle.java.erpsol.com.esb.pojo;

public class TestArray {
    public TestArray() {
        super();
    }

    public static void main(String[] args) {
        Array array =new Array("line:3133|line:999|line:777|line:555|line:333|line:111|");

        System.out.println(array.GetXMLArray());
    }
}
