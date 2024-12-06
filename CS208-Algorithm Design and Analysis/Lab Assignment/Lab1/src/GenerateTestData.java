// GenerateTestData.java
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class GenerateTestData {
    public static void main(String[] args) {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(args[0]));
            int n = 10; // Number of elements in the array
            writer.write(n + "\n");

            Random random = new Random();
            for (int i = 0; i < n; i++) {
                writer.write(random.nextInt(100) + " ");
            }

            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}