public class NameTag
{
    //-----------------------------------------------------------------
    // Prints a simple name tag using a greeting and a name that is
    // specified by the user.
    //-----------------------------------------------------------------
    public static void main (String[] args)
    {
        System.out.println ();
        if( args.length >= 2) {
            System.out.println("tag is: " + args[0]);
            System.out.println("My name is: " + args[1]);
        }
        else
            System.out.println("no argument provided.");
    }


}