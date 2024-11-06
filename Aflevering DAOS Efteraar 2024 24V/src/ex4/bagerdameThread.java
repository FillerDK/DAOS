package ex4;

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
        System.out.printf("%s:%s:%02d : %s er mødt ind på arbejde!\n",
                LocalTime.now().getHour(), LocalTime.now().getMinute(),
                LocalTime.now().getSecond(), navn);
        Random r = new Random();
        boolean work = true;
        while (work) {
            try {
                sleep(r.nextInt(1000, 6000));
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            String str;
            try {
                str = x.take();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            System.out.printf("""
                    %s:%s:%02d : %s ekspederede %s
                               Der er nu %d tilbage i køen!
                    """, LocalTime.now().getHour(), LocalTime.now().getMinute(),
                    LocalTime.now().getSecond(), navn, str, x.getCount());
            if (x.getCount() == 0) {
                System.out.println("\t---- Køen er tom! ----");
            }

            if (x.getAntalEkspedierede() >= 20) {
                work = false;
            }
        }
        System.out.printf("%s:%s:%02d : %s har fået fri!\n",
                LocalTime.now().getHour(), LocalTime.now().getMinute(),
                LocalTime.now().getSecond(), navn);
    }
}
