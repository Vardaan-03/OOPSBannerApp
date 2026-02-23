public class OOPSBannerAppUC6 {

    // Helper method for letter O
    static String[] getOPattern() {
        return new String[] {
                String.join("", " *** "),
                String.join("", "*   *"),
                String.join("", "*   *"),
                String.join("", "*   *"),
                String.join("", "*   *"),
                String.join("", "*   *"),
                String.join("", " *** ")
        };
    }

    // Helper method for letter P
    static String[] getPPattern() {
        return new String[] {
                String.join("", "***  "),
                String.join("", "*  * "),
                String.join("", "*  * "),
                String.join("", "***  "),
                String.join("", "*    "),
                String.join("", "*    "),
                String.join("", "*    ")
        };
    }

    // Helper method for letter S
    static String[] getSPattern() {
        return new String[] {
                String.join("", "*****"),
                String.join("", "  *  "),
                String.join("", "  *  "),
                String.join("", "  *  "),
                String.join("", "  *  "),
                String.join("", "  *  "),
                String.join("", "*****")
        };
    }

    public static void main(String[] args) {

        // Get patterns for each character
        String[] o = getOPattern();
        String[] p = getPPattern();
        String[] s = getSPattern();

        // Assemble banner lines by combining each character pattern
        String[] bannerLines = {
                String.join(" ", o[0], p[0], s[0], o[0]),
                String.join(" ", o[1], p[1], s[1], o[1]),
                String.join(" ", o[2], p[2], s[2], o[2]),
                String.join(" ", o[3], p[3], s[3], o[3]),
                String.join(" ", o[4], p[4], s[4], o[4]),
                String.join(" ", o[5], p[5], s[5], o[5]),
                String.join(" ", o[6], p[6], s[6], o[6])
        };

        // Print each line using for-each loop
        for (String line : bannerLines) {
            System.out.println(line);
        }
    }
}