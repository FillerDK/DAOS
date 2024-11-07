package ex4;

import java.time.LocalTime;
import java.util.Random;

public class bagerdameThread extends Thread {
    String navn;
    Common x;
    boolean work = true;

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
        while (work) {
            try {
                sleep(r.nextInt(1000, 6000));
            } catch (InterruptedException e) {
                if (work) {
                    throw new RuntimeException(e);
                }
            }
            if (work) {
                String str;
                try {
                    str = x.take();
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                System.out.printf("""
                                %02d:%02d:%02d : %s ekspederede %s
                                            Der er nu %d tilbage i køen!
                                """, LocalTime.now().getHour(), LocalTime.now().getMinute(),
                        LocalTime.now().getSecond(), navn, str, x.getCount());
                if (x.getCount() == 0) {
                    System.out.println("\t---- Køen er tom! ----");
                }
            }
        }
        System.out.printf("%02d:%02d:%02d : %s har fået fri!\n",
                LocalTime.now().getHour(), LocalTime.now().getMinute(),
                LocalTime.now().getSecond(), navn);
    }

    public void setWork(boolean work) {
        this.work = work;
        if (!work) {
            this.interrupt();
        }
    }
}
