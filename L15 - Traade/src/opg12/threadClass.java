package opg12;

import java.util.concurrent.Semaphore;

public class threadClass extends Thread {

    String navn;
    Common x;
    Semaphore s;

    public threadClass(String navn, Common x, Semaphore s) {
        this.navn = navn;
        this.x = x;
        this.s = s;
    }

    public void run() {
        for (int i = 0; i < 100; i++) {
            x.opdaterGlobal();
            x.TagerRanTid(1000);
        }
    }
}
