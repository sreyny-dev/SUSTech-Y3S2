import java.util.Arrays;
import java.util.HashMap;
import java.util.Scanner;

public class fluffyT {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int [] checkpoints=new int[n+1];
        int [] destinations=new int[n+1];
        for(int i=1;i<=n;i++){
            checkpoints[i]=sc.nextInt();
        }
        for(int i=1;i<=n;i++){
            destinations[i]=sc.nextInt();
        }
        HashMap<Integer, Integer> portals=new HashMap<>();
        for(int i=1;i<=n;i++){
            portals.put(checkpoints[i], destinations[i]);
        }
        int [] minTime=minimunTime(n, checkpoints, destinations, portals);
        for(int i=1;i<=n;i++){
            System.out.print(minTime[i]+" ");
        }
    }

    private static int[] minimunTime(int n, int[] checkpoints, int[] destinations,HashMap<Integer, Integer> portals) {
        int[] minTime=new int[n+1];
        Arrays.fill(minTime, Integer.MAX_VALUE);
        minTime[1]=0;

        for(int i=1;i<=n;i++){
            if(portals.containsKey(i)){
                int dest=portals.get(i);
                minTime[dest]=Math.min(minTime[dest], minTime[i]+1);
            }
            if(i+1<=n){
                minTime[i+1]=Math.min(minTime[i+1], minTime[i]+1);
        }
            if(i-1>=1){
                minTime[i-1]=Math.min(minTime[i-1], minTime[i]+1);
            }
        }
        return minTime;
    }
}
