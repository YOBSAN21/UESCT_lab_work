public class Literal {

    public static void main(String[] argv){
        //Literal.convert();
        //Literal.plus();
        //Literal.ch();
        Literal.cond();
    }
    public static void convert(){
        byte a =  100;
        int i = (int)3.9;
        //i = 5/2.0;
        int newNum = 10 * ++i;
        System.out.println(newNum);

        byte by = 33;
        char ch = 444;
        short sh = 5555;
        sh = a;
        //int l = 078;
        System.out.println(sh);
    }

    public static void cond(){
        //boolean b = true?false:true == true? false:true;
        int a = 5;
        System.out.println("value is " + ((a < 5)? 9.9: 9));

        char x = 'x';
        int i = 10;
        System.out.println(false? i : x);
        //String bb = false? "70000" : x;
        System.out.println(false? "70000" : x);
    }

    public static void plus(){
        int i = 0, j = 0;
        int numNum = 10* i++;
        i = ++i + i++;
        System.out.println(i);
    }

    public static void ch(){
        char a = '周';
        int b = a;

        //int t = "abc".length();

        System.out.format("%x\n", b);
        a = 0x5468;
        System.out.println(a);

        a = '\u5468';
        System.out.println(a);

    }
}
