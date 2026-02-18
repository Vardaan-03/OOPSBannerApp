/**
 * OOPSBannerApp UC3 - OOPS Banner Application (Use Case 3)
 *
 * This class extends the functionality of Use Case 2 by improving the way the
 * "OOPS" banner
 * is constructed and displayed. It focuses on enhancing code readability and
 * efficiency
 * by utilizing the String.join() method to create each line of the banner. This
 * approach
 * overcomes the drawbacks of using the + operator for string concatenation,
 * which can lead
 * to code inefficiency due to the creation of multiple intermediate String
 * objects in memory.
 *
 * @author Developer
 * @version 3.0
 */

// Extend use case UC2 to use String.join() method to create each line of the
// "OOPS" banner
// instead of concatenating strings with the + operator. This is essentially to
// overcome the
// drawbacks of using the + operator for string concatenation which essentially
// creates
// multiple intermediate String objects in memory leading to inefficiency.

public class OOPSBannerApp {

    public static void main(String[] args) {

        // Line 1 of all letters
        System.out.println(String.join("", " ***  ", "  ***  ", " ****  ", "  **** "));
        // Line 2 of all letters
        System.out.println(String.join("", "*   * ", " *   * ", " *   * ", " *     "));
        // Line 3 of all letters
        System.out.println(String.join("", "*   * ", " *   * ", " *   * ", " *     "));
        // Line 4 of all letters
        System.out.println(String.join("", "*   * ", " *   * ", " ****  ", "  ***  "));
        // Line 5 of all letters
        System.out.println(String.join("", "*   * ", " *   * ", " *     ", "     * "));
        // Line 6 of all letters
        System.out.println(String.join("", "*   * ", " *   * ", " *     ", "     * "));
        // Line 7 of all letters
        System.out.println(String.join("", " ***  ", "  ***  ", " *     ", "  **** "));
    }
}