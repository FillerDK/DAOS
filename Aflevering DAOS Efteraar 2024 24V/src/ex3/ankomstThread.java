package ex3;

import java.util.Random;
import java.util.concurrent.Semaphore;

public class ankomstThread extends Thread {
    String navn;
    Common x;
    private int thisId;

    public ankomstThread(String navn, Common x, int id) {
        this.navn = navn;
        this.x = x;
        thisId = id;
    }

    public void run() {
        Random r = new Random();
        for (int i = 0; i < 10; i++) {
            try {
                sleep(r.nextInt(1000, 3000));
            } catch (InterruptedException ex) {
                throw new RuntimeException(ex);
            }
            x.opdaterBillet();
            System.out.printf("""
                    Indgang %d benyttet | nr: %d | kø størrelse: %d
                    """, thisId, x.getBilletnummer(), x.getKøStørrelse());
            x.TagerRanTid(1000);
        }
    }
}
