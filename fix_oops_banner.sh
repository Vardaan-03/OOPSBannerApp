#!/bin/bash
#
# fix_oops_banner.sh
# --------------------------------------------------
# Applies corrected Java code to every branch of the
# SanjeevAryanUni/OopsBannerApp repository.
#
# USAGE:
#   1. Clone the repo:  git clone https://github.com/SanjeevAryanUni/OopsBannerApp.git
#   2. cd OopsBannerApp
#   3. Run this script:  bash /path/to/fix_oops_banner.sh
#
# The script will checkout each feature branch, apply
# the corrected Java file, and commit the fix.
# --------------------------------------------------

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== OopsBannerApp Code Fixer ===${NC}"
echo ""

# Verify we're in a git repo
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo -e "${RED}ERROR: Not inside a git repository.${NC}"
    echo "Please cd into your OopsBannerApp clone first."
    exit 1
fi

# Fetch all remote branches
echo -e "${YELLOW}Fetching all remote branches...${NC}"
git fetch --all 2>/dev/null

# ============================================================
# FIX: feature/UC1
# Bug: File at root instead of src/. Minor - no code bugs.
# ============================================================
fix_uc1() {
    echo -e "${GREEN}--- Fixing feature/UC1 ---${NC}"
    git checkout feature/UC1 2>/dev/null || git checkout -b feature/UC1 origin/feature/UC1 2>/dev/null

    mkdir -p src

    cat > src/OopsBannerApp.java << 'JAVAEOF'
/**
 * OOPSBannerApp UC1 - OOPS Banner Display Application
 *
 * This class demonstrates a simple Java application that displays the Object
 * Oriented Programming System OOPS acronym to the console.
 *
 * @author Developer
 * @version 1.0
 */

public class OopsBannerApp {

    public static void main(String[] args) {
        System.out.println("OOPS");
    }

}
JAVAEOF

    # Remove old file at root if it exists
    if [ -f OopsBannerApp.java ]; then
        git rm OopsBannerApp.java 2>/dev/null || rm OopsBannerApp.java
    fi

    git add src/OopsBannerApp.java
    git commit -m "fix(UC1): move OopsBannerApp.java into src/ directory" 2>/dev/null || echo "  (no changes to commit)"
    echo -e "${GREEN}  UC1 fixed.${NC}"
}

# ============================================================
# FIX: feature/UC2
# Bug: Letter columns have no separator between them.
#      Adjacent '*' characters touch each other, e.g.:
#      "*       **       *" instead of "*       *  *       *"
#      Fixed by adding "  " spacing between each letter column.
# ============================================================
fix_uc2() {
    echo -e "${GREEN}--- Fixing feature/UC2 ---${NC}"
    git checkout feature/UC2 2>/dev/null || git checkout -b feature/UC2 origin/feature/UC2 2>/dev/null

    mkdir -p src

    cat > src/OopsBannerApp.java << 'JAVAEOF'
/**
 * OOPSBannerApp UC2 - OOPS Banner Application (Use Case 2)
 *
 * Displays the "OOPS" ASCII banner using direct string concatenation
 * with the + operator. Each println call builds one row of the banner.
 *
 * @author Developer
 * @version 2.0
 */

public class OopsBannerApp {

    public static void main(String[] args) {

        // Each println = one row of banner
        // FIX: Added "  " spacing between letter columns so they don't merge
        System.out.println("  *****  " + "  " + "  *****  " + "  " + " ******  " + "  " + "  *****  ");
        System.out.println(" *     * " + "  " + " *     * " + "  " + " *     * " + "  " + " *     * ");
        System.out.println("*       *" + "  " + "*       *" + "  " + " *     * " + "  " + "*        ");
        System.out.println("*       *" + "  " + "*       *" + "  " + " ******  " + "  " + " *****   ");
        System.out.println("*       *" + "  " + "*       *" + "  " + " *       " + "  " + "      *  ");
        System.out.println(" *     * " + "  " + " *     * " + "  " + " *       " + "  " + " *    *  ");
        System.out.println("  *****  " + "  " + "  *****  " + "  " + " *       " + "  " + "  ****   ");

    }
}
JAVAEOF

    # Remove old file at root if it exists
    if [ -f OopsBannerApp.java ]; then
        git rm OopsBannerApp.java 2>/dev/null || rm OopsBannerApp.java
    fi

    git add src/OopsBannerApp.java
    git commit -m "fix(UC2): add spacing between letter columns to prevent merging" 2>/dev/null || echo "  (no changes to commit)"
    echo -e "${GREEN}  UC2 fixed.${NC}"
}

# ============================================================
# FIX: feature/UC3
# No critical bugs. Uses String.join(" ", ...) which adds a
# space delimiter - this is acceptable and produces readable output.
# Keeping as-is since it works correctly.
# ============================================================
fix_uc3() {
    echo -e "${GREEN}--- Fixing feature/UC3 ---${NC}"
    git checkout feature/UC3 2>/dev/null || git checkout -b feature/UC3 origin/feature/UC3 2>/dev/null

    # UC3 code is correct, no changes needed
    echo -e "${GREEN}  UC3 is correct - no fixes needed.${NC}"
}

# ============================================================
# FIX: feature/UC4
# No critical bugs. Same pattern as UC3 but stored in array.
# ============================================================
fix_uc4() {
    echo -e "${GREEN}--- Fixing feature/UC4 ---${NC}"
    git checkout feature/UC4 2>/dev/null || git checkout -b feature/UC4 origin/feature/UC4 2>/dev/null

    # UC4 code is correct, no changes needed
    echo -e "${GREEN}  UC4 is correct - no fixes needed.${NC}"
}

# ============================================================
# FIX: feature/UC5
# No critical bugs. Inline array initialization variant of UC4.
# ============================================================
fix_uc5() {
    echo -e "${GREEN}--- Fixing feature/UC5 ---${NC}"
    git checkout feature/UC5 2>/dev/null || git checkout -b feature/UC5 origin/feature/UC5 2>/dev/null

    # UC5 code is correct, no changes needed
    echo -e "${GREEN}  UC5 is correct - no fixes needed.${NC}"
}

# ============================================================
# FIX: feature/UC6
# CRITICAL BUG: Class name is 'OOPSBannerApp' but file is
# 'OopsBannerApp.java'. Java requires public class name to
# match the filename exactly. This causes a compilation error:
#   error: class OOPSBannerApp is public, should be declared
#          in a file named OOPSBannerApp.java
#
# Also fixed: removed pointless String.join(" ", singleArg)
# calls — String.join with one element just returns the element.
# ============================================================
fix_uc6() {
    echo -e "${GREEN}--- Fixing feature/UC6 ---${NC}"
    git checkout feature/UC6 2>/dev/null || git checkout -b feature/UC6 origin/feature/UC6 2>/dev/null

    cat > src/OopsBannerApp.java << 'JAVAEOF'
public class OopsBannerApp {

    // Pattern for letter O
    public static String[] getOPattern() {
        return new String[]{
            " ***** ",
            "*     *",
            "*     *",
            "*     *",
            "*     *",
            "*     *",
            " ***** "
        };
    }

    // Pattern for letter P
    public static String[] getPPattern() {
        return new String[]{
            "****** ",
            "*     *",
            "*     *",
            "****** ",
            "*      ",
            "*      ",
            "*      "
        };
    }

    // Pattern for letter S
    public static String[] getSPattern() {
        return new String[]{
            " ***** ",
            "*      ",
            "*      ",
            " ***** ",
            "      *",
            "      *",
            " ***** "
        };
    }

    public static void main(String[] args) {

        // Get patterns for letters
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

    git add src/OopsBannerApp.java
    git commit -m "fix(UC6): rename class OOPSBannerApp -> OopsBannerApp to match filename; remove redundant String.join" 2>/dev/null || echo "  (no changes to commit)"
    echo -e "${GREEN}  UC6 fixed.${NC}"
}

# ============================================================
# FIX: feature/UC7
# No critical bugs. Inner class approach works correctly.
# ============================================================
fix_uc7() {
    echo -e "${GREEN}--- Fixing feature/UC7 ---${NC}"
    git checkout feature/UC7 2>/dev/null || git checkout -b feature/UC7 origin/feature/UC7 2>/dev/null

    # UC7 code is correct, no changes needed
    echo -e "${GREEN}  UC7 is correct - no fixes needed.${NC}"
}

# ============================================================
# FIX: feature/UC8
# No critical bugs. HashMap approach works correctly.
# ============================================================
fix_uc8() {
    echo -e "${GREEN}--- Fixing feature/UC8 ---${NC}"
    git checkout feature/UC8 2>/dev/null || git checkout -b feature/UC8 origin/feature/UC8 2>/dev/null

    # UC8 code is correct, no changes needed
    echo -e "${GREEN}  UC8 is correct - no fixes needed.${NC}"
}

# ============================================================
# FIX: dev branch
# Same code as UC8 - no bugs.
# ============================================================
fix_dev() {
    echo -e "${GREEN}--- Fixing dev ---${NC}"
    git checkout dev 2>/dev/null || git checkout -b dev origin/dev 2>/dev/null

    # dev code is correct (same as UC8), no changes needed
    echo -e "${GREEN}  dev is correct - no fixes needed.${NC}"
}

# ============================================================
# Run all fixes
# ============================================================

# Save current branch to return to it later
ORIGINAL_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "main")

echo ""
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

# Return to original branch
echo ""
echo -e "${YELLOW}Returning to original branch: ${ORIGINAL_BRANCH}${NC}"
git checkout "$ORIGINAL_BRANCH" 2>/dev/null || git checkout main 2>/dev/null

echo ""
echo -e "${GREEN}=== All fixes applied! ===${NC}"
echo ""
echo "Summary of bugs fixed:"
echo "  UC1: Moved OopsBannerApp.java from root into src/ directory"
echo "  UC2: Added '  ' spacing between letter columns (they were merging)"
echo "  UC6: Renamed class OOPSBannerApp -> OopsBannerApp to match filename"
echo "  UC6: Removed redundant String.join(\", \", singleArg) calls"
echo ""
echo "Branches with no bugs found: UC3, UC4, UC5, UC7, UC8, dev"
echo ""
echo -e "${YELLOW}NOTE: Changes are local only. Use 'git push --all' to push to remote.${NC}"
