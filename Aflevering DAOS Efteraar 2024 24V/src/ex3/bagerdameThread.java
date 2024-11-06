package ex3;

import java.util.Random;

public class bagerdameThread extends Thread {
    String navn;
    Common x;

    public bagerdameThread(String navn, Common x) {
        super();
        this.navn = navn;
        this.x = x;
    }

    public void run() {
        Random r = new Random();
        boolean work = true;
        while (work) {
            // busy waiting
            while (x.getEkspeditionsNummer() == x.getBilletnummer());

            try {
                sleep(r.nextInt(1000, 2000));
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            x.opdaterEkspeditionsNummer();
            System.out.printf("""
                    Kunde ekspederet: %d | kø: %d
                    """, x.getEkspeditionsNummer(), x.getKøStørrelse());
            if (x.getEkspeditionsNummer() == 20) {
                work = false;
            }
        }
    }
}
