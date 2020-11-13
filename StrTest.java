import java.lang.System;

public class StrTest {

    public void test(String aa){
        aa += "11";
    }
    public static void main(String[] argv){
        byte a = (byte) 1000;
        int i = (int)3.9;
        String str = "strstr";
        StrTest l = new StrTest();
        l.test(str);
        //i = 5/2.0;
        int newNum = 10 * ++i;
//        System.out.println(newNum);
    }
}

