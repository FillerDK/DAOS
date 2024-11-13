package ex2;

import java.time.LocalTime;
import java.util.Random;
import java.util.concurrent.Semaphore;

public class ankomstThread extends Thread {
    String navn;
    Common x;
    Semaphore s;

    public ankomstThread(String navn, Common x, Semaphore s) {
        this.navn = navn;
        this.x = x;
        this.s = s;
    }

    public void run() {
        System.out.printf("""
                %02d:%02d:%02d : Indgang %s er åben!
                """, LocalTime.now().getHour(), LocalTime.now().getMinute(),
                LocalTime.now().getSecond(), navn);
        Random r = new Random();
        for (int i = 0; i < 10; i++) {
            try {
                sleep(r.nextInt(1000, 3000));
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            try {
                s.acquire();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            Common.opdaterBillet();
            Common.TagerRanTid(1000);

            System.out.printf("""
                    %02d:%02d:%02d : Indgang %s benyttet, %d mennesker i køen!
                    """, LocalTime.now().getHour(), LocalTime.now().getMinute(),
                    LocalTime.now().getSecond(), navn, x.getKøStørrelse());
            s.release();
        }

    }
}
