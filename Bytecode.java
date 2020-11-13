public class Bytecode {

    public static void main(String[] argv){

        /*
        int a = 1;
        int b = 2;
        int c = a + b;
*/

        int i = 0;
        int j = 0;
		j = i++ + i++;
        System.out.println("i = 0;  j = 0;  j = i++ + i++;");
		System.out.println(i);
		System.out.println(j);
    }
    
}
