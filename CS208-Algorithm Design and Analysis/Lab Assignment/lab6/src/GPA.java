import java.util.*;

public class GPA {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int T = scanner.nextInt();

        for (int t = 0; t < T; t++) {
            int n = scanner.nextInt();
            long initialBrainPower = scanner.nextLong();

            Course[] courses = new Course[n];
            for (int i = 0; i < n; i++) {
                long d = scanner.nextLong();
                long s = scanner.nextLong();
                courses[i] = new Course(d, s);
            }

            // Sort courses by their A+ threshold
            Arrays.sort(courses, Comparator.comparingLong(course -> course.threshold));

            int maxAPlusGrades = getMaxAPlusGrades(courses, initialBrainPower);
            System.out.println(maxAPlusGrades);
        }

        scanner.close();
    }

    private static int getMaxAPlusGrades(Course[] courses, long initialBrainPower) {
        int aPlusCount = 0;
        long currentBrainPower = initialBrainPower;

        for (Course course : courses) {
            if (currentBrainPower >= course.threshold) {
                aPlusCount++;
            }
            currentBrainPower += course.brainPowerGain;
        }

        return aPlusCount;
    }

    static class Course {
        long brainPowerGain;
        long threshold;

        Course(long brainPowerGain, long threshold) {
            this.brainPowerGain = brainPowerGain;
            this.threshold = threshold;
        }
    }
}
