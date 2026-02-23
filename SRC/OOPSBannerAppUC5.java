public class OOPSBannerAppUC5 {
    public static void main(String[] args) {

        // Inline array declaration + initialization in a single statement
        String[] bannerLines = {
                String.join("", "*****", " ", "***  ", " ", "*****", " ", " *** "),
                String.join("", "*   *", " ", "*  * ", " ", "  *  ", " ", "*   *"),
                String.join("", "*   *", " ", "*  * ", " ", "  *  ", " ", "*    "),
                String.join("", "* ** ", " ", "***  ", " ", "  *  ", " ", "*    "),
                String.join("", "*   *", " ", "*    ", " ", "  *  ", " ", "*    "),
                String.join("", "*   *", " ", "*    ", " ", "  *  ", " ", "*   *"),
                String.join("", "*****", " ", "*    ", " ", "*****", " ", " *** ")
        };

        // For-each loop to print each line
        for (String line : bannerLines) {
            System.out.println(line);
        }
    }
}