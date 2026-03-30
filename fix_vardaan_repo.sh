#!/bin/bash
#
# fix_vardaan_repo.sh
# --------------------------------------------------
# Fixes all branches in the Vardaan-03/OOPSBannerApp repo.
#
# BUGS FOUND AND FIXED:
#   UC-1: Class name 'Main' doesn't match filename 'OOPSBannerApp.java' (WON'T COMPILE)
#   UC-3: File at root instead of SRC/ directory
#   UC-4: Contains UC-2 code instead of proper UC4 implementation (array + for-each)
#   UC-5: Contains UC-2 code instead of proper UC5 implementation (inline array init)
#   UC-6: Contains UC-2 code instead of proper UC6 implementation (methods per letter)
#   UC-7: Contains UC-2 code instead of proper UC7 implementation (inner class)
#   UC-8: Class name 'OOPSBannerAppUC8' should be 'OOPSBannerApp' to match convention
#   dev:  Contains helloworld.java with class 'Main' - should have proper banner code
#
# USAGE:
#   1. cd into your OOPSBannerApp clone
#   2. bash /path/to/fix_vardaan_repo.sh
# --------------------------------------------------

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}=== Vardaan OOPSBannerApp Code Fixer ===${NC}"
echo ""

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo -e "${RED}ERROR: Not inside a git repository.${NC}"
    exit 1
fi

git fetch --all 2>/dev/null
ORIGINAL_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "main")

# ============================================================
# UC-1: Class 'Main' doesn't match filename 'OOPSBannerApp.java'
# ============================================================
fix_uc1() {
    echo -e "${GREEN}--- Fixing feature/UC-1 ---${NC}"
    echo "  BUG: class Main doesn't match filename OOPSBannerApp.java"
    git checkout feature/UC-1 2>/dev/null || git checkout -b feature/UC-1 origin/feature/UC-1 2>/dev/null

    mkdir -p SRC

    cat > SRC/OOPSBannerApp.java << 'JAVAEOF'
/**
 * OOPSBannerApp UC1 - OOPS Banner Display Application
 *
 * Displays the "OOPS" acronym to the console.
 *
 * @author Developer
 * @version 1.0
 */

public class OOPSBannerApp {

    public static void main(String[] args) {
        System.out.println("OOPS");
    }

}
JAVAEOF

    git add SRC/OOPSBannerApp.java
    git commit -m "fix(UC-1): rename class Main -> OOPSBannerApp to match filename" 2>/dev/null || echo "  (no changes)"
    echo -e "${GREEN}  UC-1 fixed.${NC}"
}

# ============================================================
# UC-2: No bugs - works correctly
# ============================================================
fix_uc2() {
    echo -e "${GREEN}--- Checking feature/UC-2 ---${NC}"
    git checkout feature/UC-2 2>/dev/null || git checkout -b feature/UC-2 origin/feature/UC-2 2>/dev/null
    echo -e "${GREEN}  UC-2 is correct - no fixes needed.${NC}"
}

# ============================================================
# UC-3: File at root instead of SRC/
# ============================================================
fix_uc3() {
    echo -e "${GREEN}--- Fixing feature/UC-3 ---${NC}"
    echo "  BUG: OOPSBannerApp.java at root instead of SRC/"
    git checkout feature/UC-3 2>/dev/null || git checkout -b feature/UC-3 origin/feature/UC-3 2>/dev/null

    mkdir -p SRC

    # Move file to SRC/ if it's at root
    if [ -f OOPSBannerApp.java ]; then
        git mv OOPSBannerApp.java SRC/OOPSBannerApp.java 2>/dev/null || mv OOPSBannerApp.java SRC/OOPSBannerApp.java
        git add SRC/OOPSBannerApp.java
        git commit -m "fix(UC-3): move OOPSBannerApp.java into SRC/ directory" 2>/dev/null || echo "  (no changes)"
    fi
    echo -e "${GREEN}  UC-3 fixed.${NC}"
}

# ============================================================
# UC-4: Contains UC-2 code. Should use array + for-each loop.
# ============================================================
fix_uc4() {
    echo -e "${GREEN}--- Fixing feature/UC-4 ---${NC}"
    echo "  BUG: contains UC-2 code instead of UC4 (array + for-each loop)"
    git checkout feature/UC-4 2>/dev/null || git checkout -b feature/UC-4 origin/feature/UC-4 2>/dev/null

    mkdir -p SRC

    cat > SRC/OOPSBannerApp.java << 'JAVAEOF'
/**
 * OOPSBannerApp UC4 - OOPS Banner Application (Use Case 4)
 *
 * Extends UC3 by storing all banner lines in a String array
 * and printing them using a for-each loop.
 *
 * @author Developer
 * @version 4.0
 */

public class OOPSBannerApp {

    public static void main(String[] args) {

        // Array to store all 7 banner rows
        String[] lines = new String[7];

        // Construct each row using String.join()
        lines[0] = String.join("", " ***  ", "  ***  ", " ****  ", "  **** ");
        lines[1] = String.join("", "*   * ", " *   * ", " *   * ", " *     ");
        lines[2] = String.join("", "*   * ", " *   * ", " *   * ", " *     ");
        lines[3] = String.join("", "*   * ", " *   * ", " ****  ", "  ***  ");
        lines[4] = String.join("", "*   * ", " *   * ", " *     ", "     * ");
        lines[5] = String.join("", "*   * ", " *   * ", " *     ", "     * ");
        lines[6] = String.join("", " ***  ", "  ***  ", " *     ", "  **** ");

        // Print banner using for-each loop
        for (String line : lines) {
            System.out.println(line);
        }
    }
}
JAVAEOF

    git add SRC/OOPSBannerApp.java
    git commit -m "fix(UC-4): implement proper UC4 with array storage and for-each loop" 2>/dev/null || echo "  (no changes)"
    echo -e "${GREEN}  UC-4 fixed.${NC}"
}

# ============================================================
# UC-5: Contains UC-2 code. Should use inline array init.
# ============================================================
fix_uc5() {
    echo -e "${GREEN}--- Fixing feature/UC-5 ---${NC}"
    echo "  BUG: contains UC-2 code instead of UC5 (inline array initialization)"
    git checkout feature/UC-5 2>/dev/null || git checkout -b feature/UC-5 origin/feature/UC-5 2>/dev/null

    mkdir -p SRC

    cat > SRC/OOPSBannerApp.java << 'JAVAEOF'
/**
 * OOPSBannerApp UC5 - OOPS Banner Application (Use Case 5)
 *
 * Extends UC4 by declaring and initializing the banner array
 * in a single step using inline array initialization.
 *
 * @author Developer
 * @version 5.0
 */

public class OOPSBannerApp {

    public static void main(String[] args) {

        // Declare and initialize array in one step using String.join()
        String[] lines = {
            String.join("", " ***  ", "  ***  ", " ****  ", "  **** "),
            String.join("", "*   * ", " *   * ", " *   * ", " *     "),
            String.join("", "*   * ", " *   * ", " *   * ", " *     "),
            String.join("", "*   * ", " *   * ", " ****  ", "  ***  "),
            String.join("", "*   * ", " *   * ", " *     ", "     * "),
            String.join("", "*   * ", " *   * ", " *     ", "     * "),
            String.join("", " ***  ", "  ***  ", " *     ", "  **** ")
        };

        // Print using for-each loop
        for (String line : lines) {
            System.out.println(line);
        }
    }
}
JAVAEOF

    git add SRC/OOPSBannerApp.java
    git commit -m "fix(UC-5): implement proper UC5 with inline array initialization" 2>/dev/null || echo "  (no changes)"
    echo -e "${GREEN}  UC-5 fixed.${NC}"
}

# ============================================================
# UC-6: Contains UC-2 code. Should use methods per letter.
# ============================================================
fix_uc6() {
    echo -e "${GREEN}--- Fixing feature/UC-6 ---${NC}"
    echo "  BUG: contains UC-2 code instead of UC6 (methods per letter pattern)"
    git checkout feature/UC-6 2>/dev/null || git checkout -b feature/UC-6 origin/feature/UC-6 2>/dev/null

    mkdir -p SRC

    cat > SRC/OOPSBannerApp.java << 'JAVAEOF'
/**
 * OOPSBannerApp UC6 - OOPS Banner Application (Use Case 6)
 *
 * Uses separate static methods to return the pattern for each letter.
 * Combines patterns line-by-line in main to display the banner.
 *
 * @author Developer
 * @version 6.0
 */

public class OOPSBannerApp {

    // Pattern for letter O
    public static String[] getOPattern() {
        return new String[]{
            " *** ",
            "*   *",
            "*   *",
            "*   *",
            "*   *",
            "*   *",
            " *** "
        };
    }

    // Pattern for letter P
    public static String[] getPPattern() {
        return new String[]{
            "**** ",
            "*   *",
            "*   *",
            "**** ",
            "*    ",
            "*    ",
            "*    "
        };
    }

    // Pattern for letter S
    public static String[] getSPattern() {
        return new String[]{
            " *** ",
            "*    ",
            "*    ",
            " *** ",
            "    *",
            "    *",
            " *** "
        };
    }

    public static void main(String[] args) {

        // Get patterns for each letter in "OOPS"
        String[] o1 = getOPattern();
        String[] o2 = getOPattern();
        String[] p  = getPPattern();
        String[] s  = getSPattern();

        // Combine and print line-by-line
        for (int i = 0; i < o1.length; i++) {
            System.out.println(
                o1[i] + "  " +
                o2[i] + "  " +
                p[i]  + "  " +
                s[i]
            );
        }
    }
}
JAVAEOF

    git add SRC/OOPSBannerApp.java
    git commit -m "fix(UC-6): implement proper UC6 with separate methods per letter" 2>/dev/null || echo "  (no changes)"
    echo -e "${GREEN}  UC-6 fixed.${NC}"
}

# ============================================================
# UC-7: Contains UC-2 code. Should use inner class.
# ============================================================
fix_uc7() {
    echo -e "${GREEN}--- Fixing feature/UC-7 ---${NC}"
    echo "  BUG: contains UC-2 code instead of UC7 (inner class pattern map)"
    git checkout feature/UC-7 2>/dev/null || git checkout -b feature/UC-7 origin/feature/UC-7 2>/dev/null

    mkdir -p SRC

    cat > SRC/OOPSBannerApp.java << 'JAVAEOF'
/**
 * OOPSBannerApp UC7 - OOPS Banner Application (Use Case 7)
 *
 * Uses an inner class CharacterPatternMap to associate each character
 * with its ASCII art pattern. Supports lookup and flexible message printing.
 *
 * @author Developer
 * @version 7.0
 */

public class OOPSBannerApp {

    static class CharacterPatternMap {
        private char character;
        private String[] pattern;

        public CharacterPatternMap(char character, String[] pattern) {
            this.character = character;
            this.pattern = pattern;
        }

        public char getCharacter() {
            return character;
        }

        public String[] getPattern() {
            return pattern;
        }
    }

    public static CharacterPatternMap[] createCharacterPatternMaps() {

        CharacterPatternMap[] charMaps = new CharacterPatternMap[4];

        String[] O = {
            "  ***  ",
            " *   * ",
            " *   * ",
            " *   * ",
            " *   * ",
            " *   * ",
            "  ***  "
        };

        String[] P = {
            " ****  ",
            " *   * ",
            " *   * ",
            " ****  ",
            " *     ",
            " *     ",
            " *     "
        };

        String[] S = {
            "  **** ",
            " *     ",
            " *     ",
            "  ***  ",
            "     * ",
            "     * ",
            " ****  "
        };

        String[] space = {
            "       ",
            "       ",
            "       ",
            "       ",
            "       ",
            "       ",
            "       "
        };

        charMaps[0] = new CharacterPatternMap('O', O);
        charMaps[1] = new CharacterPatternMap('P', P);
        charMaps[2] = new CharacterPatternMap('S', S);
        charMaps[3] = new CharacterPatternMap(' ', space);

        return charMaps;
    }

    public static String[] getCharacterPattern(char ch, CharacterPatternMap[] charMaps) {
        for (CharacterPatternMap map : charMaps) {
            if (map.getCharacter() == ch) {
                return map.getPattern();
            }
        }
        return charMaps[3].getPattern(); // default to space
    }

    public static void printMessage(String message, CharacterPatternMap[] charMaps) {
        for (int row = 0; row < 7; row++) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < message.length(); i++) {
                String[] pattern = getCharacterPattern(message.charAt(i), charMaps);
                sb.append(pattern[row]).append("  ");
            }
            System.out.println(sb.toString());
        }
    }

    public static void main(String[] args) {
        CharacterPatternMap[] charMaps = createCharacterPatternMaps();
        printMessage("OOPS", charMaps);
    }
}
JAVAEOF

    git add SRC/OOPSBannerApp.java
    git commit -m "fix(UC-7): implement proper UC7 with inner class CharacterPatternMap" 2>/dev/null || echo "  (no changes)"
    echo -e "${GREEN}  UC-7 fixed.${NC}"
}

# ============================================================
# UC-8: Class name OOPSBannerAppUC8 - should be OOPSBannerApp
# to match the project convention. Also rename file.
# ============================================================
fix_uc8() {
    echo -e "${GREEN}--- Fixing feature/UC-8 ---${NC}"
    echo "  BUG: class name OOPSBannerAppUC8 should be OOPSBannerApp"
    git checkout feature/UC-8 2>/dev/null || git checkout -b feature/UC-8 origin/feature/UC-8 2>/dev/null

    mkdir -p SRC

    cat > SRC/OOPSBannerApp.java << 'JAVAEOF'
import java.util.HashMap;

/**
 * OOPSBannerApp UC8 - OOPS Banner Application (Use Case 8)
 *
 * Uses a HashMap to store character-to-pattern mappings.
 * Supports flexible message display by looking up each character.
 *
 * @author Developer
 * @version 8.0
 */

public class OOPSBannerApp {

    public static HashMap<Character, String[]> createCharacterMap() {
        HashMap<Character, String[]> charMap = new HashMap<>();

        charMap.put('O', new String[] {
            " *** ",
            "*   *",
            "*   *",
            "*   *",
            "*   *",
            "*   *",
            " *** "
        });

        charMap.put('P', new String[] {
            "***  ",
            "*  * ",
            "*  * ",
            "***  ",
            "*    ",
            "*    ",
            "*    "
        });

        charMap.put('S', new String[] {
            " *** ",
            "*    ",
            "*    ",
            " *** ",
            "    *",
            "    *",
            " *** "
        });

        return charMap;
    }

    public static void displayBanner(String message, HashMap<Character, String[]> charMap) {
        int patternHeight = charMap.get('O').length;

        for (int line = 0; line < patternHeight; line++) {
            StringBuilder sb = new StringBuilder();
            for (char ch : message.toCharArray()) {
                String[] pattern = charMap.get(ch);
                sb.append(pattern[line]).append("  ");
            }
            System.out.println(sb.toString());
        }
    }

    public static void main(String[] args) {
        HashMap<Character, String[]> charMap = createCharacterMap();
        String message = "OOPS";
        displayBanner(message, charMap);
    }
}
JAVAEOF

    # Remove old misnamed file if it exists
    if [ -f SRC/OOPSBannerAppUC8.java ]; then
        git rm SRC/OOPSBannerAppUC8.java 2>/dev/null || rm SRC/OOPSBannerAppUC8.java
    fi

    git add SRC/OOPSBannerApp.java
    git commit -m "fix(UC-8): rename class OOPSBannerAppUC8 -> OOPSBannerApp to match convention" 2>/dev/null || echo "  (no changes)"
    echo -e "${GREEN}  UC-8 fixed.${NC}"
}

# ============================================================
# dev: Has helloworld.java with class Main - replace with
# proper UC8 banner code (the most complete version)
# ============================================================
fix_dev() {
    echo -e "${GREEN}--- Fixing dev ---${NC}"
    echo "  BUG: contains helloworld.java with class Main instead of banner code"
    git checkout dev 2>/dev/null || git checkout -b dev origin/dev 2>/dev/null

    mkdir -p SRC

    # Remove old helloworld file
    if [ -f helloworld.java ]; then
        git rm helloworld.java 2>/dev/null || rm helloworld.java
    fi

    cat > SRC/OOPSBannerApp.java << 'JAVAEOF'
import java.util.HashMap;

/**
 * OOPSBannerApp - OOPS Banner Display Application (dev)
 *
 * Uses HashMap-based character pattern mapping to display the "OOPS"
 * ASCII art banner. This is the most complete implementation combining
 * all use case concepts.
 *
 * @author Developer
 * @version 8.0
 */

public class OOPSBannerApp {

    public static HashMap<Character, String[]> createCharacterMap() {
        HashMap<Character, String[]> charMap = new HashMap<>();

        charMap.put('O', new String[] {
            " *** ",
            "*   *",
            "*   *",
            "*   *",
            "*   *",
            "*   *",
            " *** "
        });

        charMap.put('P', new String[] {
            "***  ",
            "*  * ",
            "*  * ",
            "***  ",
            "*    ",
            "*    ",
            "*    "
        });

        charMap.put('S', new String[] {
            " *** ",
            "*    ",
            "*    ",
            " *** ",
            "    *",
            "    *",
            " *** "
        });

        return charMap;
    }

    public static void displayBanner(String message, HashMap<Character, String[]> charMap) {
        int patternHeight = charMap.get('O').length;

        for (int line = 0; line < patternHeight; line++) {
            StringBuilder sb = new StringBuilder();
            for (char ch : message.toCharArray()) {
                String[] pattern = charMap.get(ch);
                sb.append(pattern[line]).append("  ");
            }
            System.out.println(sb.toString());
        }
    }

    public static void main(String[] args) {
        HashMap<Character, String[]> charMap = createCharacterMap();
        String message = "OOPS";
        displayBanner(message, charMap);
    }
}
JAVAEOF

    git add SRC/OOPSBannerApp.java
    git commit -m "fix(dev): replace helloworld with proper OOPSBannerApp banner code" 2>/dev/null || echo "  (no changes)"
    echo -e "${GREEN}  dev fixed.${NC}"
}

# ============================================================
# Run all fixes
# ============================================================

echo -e "${YELLOW}Applying fixes to all branches...${NC}"
echo ""

fix_uc1
fix_uc2
fix_uc3
fix_uc4
fix_uc5
fix_uc6
fix_uc7
fix_uc8
fix_dev

echo ""
git checkout "$ORIGINAL_BRANCH" 2>/dev/null || git checkout main 2>/dev/null

echo ""
echo -e "${GREEN}=== All fixes applied! ===${NC}"
echo ""
echo "Summary of bugs fixed:"
echo "  UC-1: class Main -> OOPSBannerApp (filename mismatch, WON'T COMPILE)"
echo "  UC-3: moved file from root into SRC/ directory"
echo "  UC-4: replaced duplicate UC-2 code with proper array + for-each implementation"
echo "  UC-5: replaced duplicate UC-2 code with proper inline array initialization"
echo "  UC-6: replaced duplicate UC-2 code with proper per-letter methods"
echo "  UC-7: replaced duplicate UC-2 code with proper inner class implementation"
echo "  UC-8: renamed class OOPSBannerAppUC8 -> OOPSBannerApp"
echo "  dev:  replaced helloworld.java with proper banner code"
echo ""
echo "Branches with no bugs: UC-2"
echo ""
echo -e "${YELLOW}NOTE: Changes are local. Use 'git push --all' to push.${NC}"
