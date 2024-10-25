import java.util.ArrayList;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        // opg 6.1
        int x = 10000000;
        Lottoraek[] lottoraekker = new Lottoraek[x];
        for (int i = 0; i < lottoraekker.length; i++) {
            lottoraekker[i] = new Lottoraek();
        }

        // opg 6.2
        Lottoraek lottoraekTrækning = new Lottoraek();

        // opg 6.3
        int[] rigtigeTalPrRække = new int[8];
        long l1 = System.nanoTime();
        for (int i = 0; i < x; i++) {
            int y = lottoraekker[i].antalrigtige(lottoraekTrækning);
            rigtigeTalPrRække[y]++;
        }
        long l2 = System.nanoTime();

        // opg 6.4
        System.out.println("Antal rigtige tal i hver række: " + Arrays.toString(rigtigeTalPrRække));
        System.out.println("Sum af tal test: " + Arrays.stream(rigtigeTalPrRække).sum());
        System.out.println("Tidsmåling i ms: " + (l2 - l1)/1000000.0);
    }
}
