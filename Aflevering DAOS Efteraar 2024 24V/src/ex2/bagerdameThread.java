package ex2;

import java.time.LocalTime;
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
        System.out.printf("%02d:%02d:%02d : %s er mødt ind på arbejde!\n",
                LocalTime.now().getHour(), LocalTime.now().getMinute(),
                LocalTime.now().getSecond(), navn);
        Random r = new Random();
        boolean work = true;
        while (work) {
            while (x.getEkspeditionsNummer() == x.getBilletnummer());

            try {
                sleep(r.nextInt(1000, 2000));
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            Common.opdaterEkspeditionsNummer();
            System.out.printf("""
                                %02d:%02d:%02d : %s ekspederede en kunde
                                            Der er nu %d tilbage i køen!
                                """, LocalTime.now().getHour(), LocalTime.now().getMinute(),
                    LocalTime.now().getSecond(), navn, x.getKøStørrelse());
            if (x.getEkspeditionsNummer() == 20) {
                work = false;
            }
        }
        System.out.printf("%02d:%02d:%02d : %s har fået fri!\n",
                LocalTime.now().getHour(), LocalTime.now().getMinute(),
                LocalTime.now().getSecond(), navn);
    }
}
