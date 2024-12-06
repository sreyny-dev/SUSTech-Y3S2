import java.util.Scanner;

public class Decipher {
    private static int decipher(char ogChar, char newChar) {
        int offset;
        if ((int) ogChar >= (int) newChar)
            offset = (int) newChar - (int) ogChar + 26;
        else
            offset = (int) newChar - (int) ogChar;
        if (offset == 26)
            return 0;
        else
            return offset;
    }

    public static void main(String[] args) {
        String str = new Scanner(System.in).nextLine();
        char[] strArr = str.toCharArray();
        boolean minusOne = true;

        if (strArr.length == 1) {
            System.out.println(decipher('I', strArr[0]));
            minusOne = false;
        } else {
            for (int i = 1; i <= strArr.length - 1; i++) {
                char left = strArr[i - 1];
                char mid = strArr[i];
                char right = 0;
                if (i < strArr.length - 1)
                    right = strArr[i + 1];

                if (i == 1 && mid == ' ') {
                    System.out.println(decipher('I', left));
                    minusOne = false;
                    break;
                } else if (i < strArr.length - 1 && left == ' ' && right == ' ') {
                    System.out.println(decipher('A', mid));
                    minusOne = false;
                    break;
                } else if (i == strArr.length - 1 && left == ' ') {
                    System.out.println(decipher('A', mid));
                    minusOne = false;
                    break;
                }
            }
        }

        if (minusOne)
            System.out.println(-1);
    }
}
