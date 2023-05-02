import java.util.concurrent.TimeUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.io.FileWriter;  
import java.io.IOException;

class Main {

  /**
  * @return returns the index of the element numToFind in array array.
  * -1 if element not found.
  * @param array array, sorted or not, containing integers
  * @param numToFind integer to find in array
  * @precondition none
  * @postcondition index of numToFind has been returned. -1 has been
  * returned if element not found.
  */
  public static int linearSearch(int[] array, int numToFind){
    for(int i = 0;i<array.length;i++)
      if(array[i]==numToFind) return i;
    return -1;
  }

    /**
  * @return returns the index of the element numToFind in array array.
  * -1 if element not found.
  * @param array array, sorted or not, containing integers
  * @param numToFind integer to find in array
  * @precondition none
  * @postcondition index of numToFind has been returned. -1 has been
  * returned if element not found.
  */
  public static int binarySearch(int[] array, int numToFind){
    int left = 0;
    int right = array.length - 1;
    int middle = 0;

    while ( left <= right) {
      middle = (left + right) / 2;
      if(numToFind < array[middle]) 
        right = middle - 1;
      else if (numToFind > array[middle])
        left = middle + 1;
      else return middle;
    }
    return -1;
  }

  public static void main(String[] args) {
    final long runs = 1000000;
    //final long runs = 1000;
 
    System.out.format("Number of trials: %,d\n", runs);
    //unsorted array to search
    final int size = 100000;
    int[] unsortedArray= new int[size];
    for(int i = 0; i<size;i++)
      unsortedArray[i] = (int) ((Math.random()*99)+1);

    int[] sortedArray= new int[size];
    for(int i = 0; i<size;i++)
      sortedArray[i] = i;
    //for timing
    long startTime = 0;
    long endTime = 0;
    ArrayList<Long> linearSearchRunTimesSorted = new ArrayList<Long>();
    ArrayList<Long> binarySearchRunTimesSorted = new ArrayList<Long>();
    ArrayList<Long> linearSearchRunTimesUnsorted = new ArrayList<Long>();
    ArrayList<Long> binarySearchRunTimesUnsorted = new ArrayList<Long>();    
    long counter = 0;
    int average = 0;

    for(int i = 0; i<runs;i++) {
      startTime = System.nanoTime();
      linearSearch(unsortedArray,(int)((Math.random()*99)+1));
      endTime = System.nanoTime();
      linearSearchRunTimesUnsorted.add((endTime - startTime));
    }
    counter = 0;
    for(Long value : linearSearchRunTimesUnsorted) {
      counter += value;
    }
    average = (int) (counter / runs);
    System.out.println("\tLinear Search average runtime for unsorted array: " + average + " nanoseconds");

    for(int i = 0; i<runs;i++) {
      startTime = System.nanoTime();
      linearSearch(sortedArray,(int)((Math.random()*999)+1));
      endTime = System.nanoTime();
      linearSearchRunTimesSorted.add((endTime - startTime));
    }
    counter = 0;
    for(Long value : linearSearchRunTimesSorted) {
      counter += value;
    }
    average = (int) (counter / runs);
    System.out.println("\tLinear Search average runtime for sorted array:   " + average + " nanoseconds");


    for(int i = 0; i < runs; i++) {
      startTime = System.nanoTime(); 
      binarySearch(sortedArray,(int)((Math.random()*999)+1)); 
      endTime = System.nanoTime();
      binarySearchRunTimesSorted.add((endTime - startTime));
    }

    counter = 0;
    for(Long value : binarySearchRunTimesSorted) {
      counter += value;
    }
    average = (int)(counter / runs);
    System.out.println("\tBinary Search average runtime for sorted array:   " + average + " nanoseconds");    

// Do not enable unless runs is small!!
    for(int i = 0; i < runs; i++) {
      startTime = System.nanoTime(); 
      //have to sort the array
      int[] temp = new int[size];
      for(int j = 0; j< size; j++)
        temp[j] = unsortedArray[j];
      Arrays.sort(temp);

      binarySearch(unsortedArray,(int)((Math.random()*99)+1));
      endTime = System.nanoTime();
      binarySearchRunTimesUnsorted.add((endTime - startTime));
    }

    counter = 0;
    for(Long value : binarySearchRunTimesUnsorted) {
      counter += value;
    }
    average = (int)(counter / runs);
    System.out.println("\tBinary Search average runtime for unsorted array: " + average + " nanoseconds");


    //Write out the arrays to a csv for later analysis
    String csv = new String();
    csv += "\"Run Number\",\"Linear Search Sorted\",\"Linear Search Unsorted\",\"Binary Search Sorted\",\"Binary Search Unsorted\"\n";
    for(int i = 0; i<runs; i++) {
      csv += i + ",";
      csv += linearSearchRunTimesSorted.get(i) + ",";
      csv += linearSearchRunTimesUnsorted.get(i) + ",";
      csv += binarySearchRunTimesSorted.get(i) + ",";
      csv += binarySearchRunTimesUnsorted.get(i);
      csv += "\n";
    }
    try {
      FileWriter myWriter = new FileWriter("runtimes.csv");
      myWriter.write(csv);
      myWriter.close();
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
  }
}