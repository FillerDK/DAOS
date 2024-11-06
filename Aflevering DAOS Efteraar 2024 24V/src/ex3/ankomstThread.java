package ex3;

import java.util.Random;
import java.util.concurrent.Semaphore;

public class ankomstThread extends Thread {
    String navn;
    Common x;
    Semaphore s;
    private int thisId;

    public ankomstThread(String navn, Common x, int id, Semaphore s) {
        this.navn = navn;
        this.x = x;
        thisId = id;
        this.s = s;
    }

    public void run() {
        Random r = new Random();
        for (int i = 0; i < 10; i++) {
            try {
                s.acquire();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            x.opdaterBillet();
            System.out.printf("""
                    Indgang %d benyttet | nr: %d | kø størrelse: %d
                    """, thisId, x.getBilletnummer(), x.getKøStørrelse());
            x.TagerRanTid(1000);
            s.release();
        }
    }
}
