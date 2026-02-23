public class OOPSBannerAppUC4 {
    public static void main(String[] args) {

        // Step 3a: Create a String array with 7 rows (one per banner line)
        String[] bannerLines = new String[7];

        // Step 3b: Populate each line using String.join()
        bannerLines[0] = String.join("", "*****", " ", "***  ", " ", "*****", " ", " *** ");
        bannerLines[1] = String.join("", "*   *", " ", "*  * ", " ", "  *  ", " ", "*   *");
        bannerLines[2] = String.join("", "*   *", " ", "*  * ", " ", "  *  ", " ", "*    ");
        bannerLines[3] = String.join("", "* ** ", " ", "***  ", " ", "  *  ", " ", "*    ");
        bannerLines[4] = String.join("", "*   *", " ", "*    ", " ", "  *  ", " ", "*    ");
        bannerLines[5] = String.join("", "*   *", " ", "*    ", " ", "  *  ", " ", "*   *");
        bannerLines[6] = String.join("", "*****", " ", "*    ", " ", "*****", " ", " *** ");

        // Step 3c: Use for-each loop to print each line
        for (String line : bannerLines) {
            System.out.println(line);
        }
    }
}