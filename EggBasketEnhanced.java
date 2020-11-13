import java.util.Scanner;

public class EggBasketEnhanced {
    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        System.out.print("Enter the number of eggs in each basket: ");
        String eggsStr = keyboard.nextLine();
        int eggsPerBasket = Integer.parseInt(eggsStr);
        System.out.print("Enter the number of baskets: ");
        String basketStr = keyboard.nextLine();
        int numberOfBaskets = Integer.parseInt(basketStr);
        int totalEggs = numberOfBaskets * eggsPerBasket;
        System.out.println(eggsPerBasket + " eggs per basket.");
        System.out.println(numberOfBaskets + " baskets.");
        System.out.println("Total number of eggs is " + totalEggs);
    }
}
