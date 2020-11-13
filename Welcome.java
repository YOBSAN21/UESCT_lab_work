//outputs Welcome to Java

public class Welcome {
    public static void main(String[] args) {

        System.out.println("Welcome to Java");
        System.out.println("Length: " + args.length);
        if(args.length > 0){
            System.out.println(args[0]);
        }
    }
}
