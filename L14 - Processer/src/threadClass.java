import java.util.ArrayList;

public class threadClass extends Thread {

    Lottoraek[] lottoraekker;
    Lottoraek lottoraekTrækning;
    int[] rigtigeTalPrRække;
    int low;
    int high;

    public threadClass(Lottoraek[] lottoraekker, Lottoraek lottoraekTrækning,
                       int[] rigtigeTalPrRække, int low, int high) {
        super();
        this.lottoraekker = lottoraekker;
        this.lottoraekTrækning = lottoraekTrækning;
        this.rigtigeTalPrRække = rigtigeTalPrRække;
        this.low = low;
        this.high = high;
    }

    public void run() {
        for (int i = low; i < high; i++) {
            int y = lottoraekker[i].antalrigtige(lottoraekTrækning);
            rigtigeTalPrRække[y]++;
        }
    }
}
