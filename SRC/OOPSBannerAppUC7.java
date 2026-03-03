/**
 * OOPSBannerAppUC7 - Store Character Pattern in a Class
 *
 * Extends UC6 by creating a CharacterPatternMap inner static class that
 * encapsulates character data and its corresponding banner pattern,
 * allowing the application to retrieve and display the "OOPS" banner
 * using these stored mappings.
 *
 * Key Concepts: Inner Static Class, Instance Variables, Constructor,
 * Getters, StringBuilder, Arrays of Objects, JavaDoc
 *
 * OOPS Principles: Encapsulation, Modularity, Reusability,
 * Abstraction, Immutability, Single Responsibility, Separation of Concerns
 */
public class OOPSBannerAppUC7 {

    /**
     * CharacterPatternMap - Inner class for storing character-to-pattern mappings
     *
     * Encapsulates a single character and its corresponding ASCII art pattern.
     * Provides immutable access to character and pattern data through getters.
     */
    static class CharacterPatternMap {
        /** The character being represented */
        Character character;
        /** The ASCII art pattern lines for the character */
        String[] pattern;

        /**
         * Constructs a CharacterPatternMap with a character and its pattern
         *
         * @param character the character to be mapped
         * @param pattern   the ASCII art pattern representation as array of strings
         */
        public CharacterPatternMap(Character character, String[] pattern) {
            this.character = character;
            this.pattern = pattern;
        }

        /**
         * Retrieves the mapped character
         *
         * @return the character associated with this pattern map
         */
        public Character getCharacter() {
            return character;
        }

        /**
         * Retrieves the ASCII art pattern
         *
         * @return the pattern array representing the character
         */
        public String[] getPattern() {
            return pattern;
        }
    }

    /**
     * Static Method to Create and initializes CharacterPatternMap array for
     * predefined characters
     *
     * Populates pattern maps for letters 'O', 'P', 'S' and space character.
     * Each character has a 7-line ASCII art representation.
     *
     * @return array of CharacterPatternMap objects containing character patterns
     */
    public static CharacterPatternMap[] createCharacterPatternMaps() {
        CharacterPatternMap[] characterPatternMap = new CharacterPatternMap[4];

        characterPatternMap[0] = new CharacterPatternMap('O', new String[] {
                " *** ",
                "*   *",
                "*   *",
                "*   *",
                "*   *",
                "*   *",
                " *** "
        });

        characterPatternMap[1] = new CharacterPatternMap('P', new String[] {
                "***  ",
                "*  * ",
                "*  * ",
                "***  ",
                "*    ",
                "*    ",
                "*    "
        });

        characterPatternMap[2] = new CharacterPatternMap('S', new String[] {
                "*****",
                "  *  ",
                "  *  ",
                "  *  ",
                "  *  ",
                "  *  ",
                "*****"
        });

        characterPatternMap[3] = new CharacterPatternMap(' ', new String[] {
                "     ",
                "     ",
                "     ",
                "     ",
                "     ",
                "     ",
                "     "
        });

        return characterPatternMap;
    }

    /**
     * Retrieves the ASCII pattern for a given character
     *
     * Searches through the character pattern maps to find a matching character.
     * If the character is not found, recursively returns the pattern for space
     * character.
     *
     * @param ch       the character to look up
     * @param charMaps the array of CharacterPatternMap objects to search through
     * @return the pattern array for the given character, or space pattern if not
     *         found
     */
    public static String[] getCharacterPattern(char ch, CharacterPatternMap[] charMaps) {
        for (CharacterPatternMap map : charMaps) {
            if (map.getCharacter() == ch) {
                return map.getPattern();
            }
        }
        // If character not found, return space pattern
        return getCharacterPattern(' ', charMaps);
    }

    /**
     * Prints a message as a banner using ASCII art patterns
     *
     * Renders the entire message horizontally by combining individual character
     * patterns line by line. Characters are separated by spacing for readability.
     *
     * @param message  the message string to be displayed as a banner
     * @param charMaps the array of CharacterPatternMap objects containing available
     *                 patterns
     */
    public static void printMessage(String message, CharacterPatternMap[] charMaps) {
        for (int line = 0; line < 7; line++) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < message.length(); i++) {
                String[] pattern = getCharacterPattern(message.charAt(i), charMaps);
                if (i > 0) {
                    sb.append(" ");
                }
                sb.append(pattern[line]);
            }
            System.out.println(sb.toString());
        }
    }

    /**
     * Main method - Entry point of the application
     *
     * Creates CharacterPatternMap instances and displays the "OOPS" banner.
     *
     * @param args command line arguments (not used)
     */
    public static void main(String[] args) {
        // Create character pattern maps
        CharacterPatternMap[] charMaps = createCharacterPatternMaps();

        // Print the OOPS banner
        printMessage("OOPS", charMaps);
    }
}
