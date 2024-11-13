package ex1;

import java.time.LocalTime;
import java.util.Random;

public class ankomstThread extends Thread {
    String navn;
    Common x;
    private int thisId;
    private int otherId;

    public ankomstThread(String navn, Common x, int id) {
        this.navn = navn;
        this.x = x;
        thisId = id;
    }

    public void run() {
        System.out.printf("""
                %02d:%02d:%02d : Indgang %s er åben!
                """, LocalTime.now().getHour(), LocalTime.now().getMinute(),
                LocalTime.now().getSecond(), navn);
        Random r = new Random();
        for (int i = 0; i < 10; i++) {
            otherId = (thisId + 1) % 2;
            x.setFlag(true, thisId);
            x.setTurn(otherId);
            // busy waiting
            while (x.getFlag(otherId) && x.getTurn() == otherId) {
                // slap af
                try {
                    sleep(r.nextInt(1000, 3000));
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
            // critical section start
            x.opdaterBillet();
            System.out.printf("""
                    %02d:%02d:%02d : Indgang %s benyttet, %d mennesker i køen!
                    """, LocalTime.now().getHour(), LocalTime.now().getMinute(),
                    LocalTime.now().getSecond(), navn, x.getKøStørrelse());
            // critical section end
            x.setFlag(false, thisId);
        }
    }
}
