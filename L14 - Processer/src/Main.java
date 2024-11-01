import java.util.ArrayList;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        // opg 6.1
        int x = 10_000_000;
        Lottoraek[] lottoraekker = new Lottoraek[x];
        for (int i = 0; i < lottoraekker.length; i++) {
            lottoraekker[i] = new Lottoraek();
        }

        // opg 6.2
        Lottoraek lottoraekTrækning = new Lottoraek();

        // opg 6.3
        long l1 = System.nanoTime();
        int[] rigtigeTalPrRække1 = new int[8];
        int[] rigtigeTalPrRække2 = new int[8];
        // opg 8
        threadClass t1 = new threadClass(lottoraekker, lottoraekTrækning, rigtigeTalPrRække1, 0,
                lottoraekker.length / 2);
        threadClass t2 = new threadClass(lottoraekker, lottoraekTrækning, rigtigeTalPrRække2,
                lottoraekker.length / 2, lottoraekker.length);
        t1.start();
        t2.start();

        t1.join();
        t2.join();
        long l2 = System.nanoTime();

        int[] rigtigeTalPrRækkeTotal = new int[8];
        for (int i = 0; i < rigtigeTalPrRækkeTotal.length; i++) {
            rigtigeTalPrRækkeTotal[i] = rigtigeTalPrRække1[i] + rigtigeTalPrRække2[i];
        }

        // opg 6.4
        System.out.println("Antal rigtige tal i hver række: " + Arrays.toString(rigtigeTalPrRækkeTotal));
        System.out.println("Sum af tal test: " + Arrays.stream(rigtigeTalPrRækkeTotal).sum());
        System.out.println("Tidsmåling i ms: " + (l2 - l1)/1000000.0);
    }
}
