import java.util.*;

public class Array {

    public static void main(String[] args) {
        String[] wordArray =
                { "word1", "word2", "word3"};

        List<String> wordList2 =
                Arrays.asList(wordArray);

        List<String> wordList1 =
                Arrays.asList("word1", "word2", "word3");

        Integer[] ia = {1,3,4,5,6};
        List<Integer> list1 = new ArrayList<Integer>(Arrays.asList(ia));  //copy
        List<Integer> list2 = Arrays.asList(ia);
    }


}

