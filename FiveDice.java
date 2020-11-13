// Generates 2 sets of dice values (one for computer and one for player) from 1-6
// Compares each players' values

import java.util.ArrayList;

class Die {
    // constants: highest and lowest die values
    static final int HIGHEST_DIE_VALUE = 6;
    static final int LOWEST_DIE_VALUE = 1;
    // calculates random integer from 1 to 6
    int randomValue = ((int)(Math.random() * 100) % HIGHEST_DIE_VALUE +	LOWEST_DIE_VALUE);


    // returns the random integer that was calculated above
    public int getDieValue() {
        return randomValue;
    }

    // store "thrown" dice values
    int value;
}

public class FiveDice {

    public static void main(String[] args) {
        final int NUM_DIE = 5;
        int i = 0; // incrementer for for loop
        int compScore = 0; // keep track of computer's score
        int dieValue = 0; // keep track of die's value on every throw
        Die[] compDie = new Die[NUM_DIE]; // generates 5 die for computer

        // throws die for computer 5 times
        for (i=0; i<NUM_DIE; i++) {
            compDie[i] = new Die();
            dieValue = compDie[i].getDieValue(); // saves die value
            compScore += dieValue; // die value adds to computer score
            compDie[i].value = dieValue; // die value is recorded in die object array
        }

        Die[] playerDie = new Die[NUM_DIE]; // generate 5 die for player
        int playerScore = 0; // keep track of player's score

        // throws die for player 5 times
        for (i=0; i<NUM_DIE; i++) {
            playerDie[i] = new Die();
            dieValue = playerDie[i].getDieValue(); // saves die value
            playerScore += dieValue; // die value adds to player score
            playerDie[i].value = dieValue; // die value is recorded in array
        }

        // prints computer and player's total score
		/* game is not based on score
		System.out.println("Computer total score: " + compScore);
		System.out.println("Player total score: " + playerScore);
		System.out.println();*/

        // print dice values for computer and player from die array
        System.out.print("Computer dice values: ");
        for (i=0; i < NUM_DIE; i++) {
            System.out.print(compDie[i].value + " ");
        }
        System.out.println(); // adds line breaker
        System.out.print("Player dice values: ");
        for (i=0; i < NUM_DIE; i++) {
            System.out.print(playerDie[i].value + " ");
        }

    }

}