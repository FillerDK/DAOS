package ex1;

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
        Random r = new Random();
        for (int i = 0; i < 10; i++) {


            otherId = (thisId + 1) % 2;
            x.setFlag(true, thisId);
            x.setTurn(otherId);


            // busy waiting
            while (x.getFlag(otherId) && x.getTurn() == otherId) {
                try {
                    sleep(r.nextInt(1000, 3000));
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
            // critical section
            x.opdaterBillet();
            System.out.printf("""
                    Indgang %d benyttet | nr: %d | kø størrelse: %d
                    """, thisId, x.getBilletnummer(), x.getKøStørrelse());

            x.setFlag(false, thisId);
        }
    }
}
