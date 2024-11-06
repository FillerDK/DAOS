package ex4;

import java.time.LocalTime;
import java.util.Random;

public class ankomstThread extends Thread {
    String navn;
    Common x;
    String[] navne;
    int count = 0;

    public ankomstThread(String navn, Common x, String[] navneliste) {
        this.navn = navn;
        this.x = x;
        navne = navneliste;
    }

    public void run() {
        Random r = new Random();
        for (int i = 0; i < 10; i++) {
            try {
                sleep(r.nextInt(1000, 3000));
            } catch (InterruptedException ex) {
                throw new RuntimeException(ex);
            }
            try {
                x.append(navne[count]);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            System.out.printf("""
                    %s:%s:%02d : %s benyttede indgang %s og er nummer %d i køen!
                    """, LocalTime.now().getHour(), LocalTime.now().getMinute(),
                    LocalTime.now().getSecond(), navne[count], navn, x.getCount());
            if (x.getCount() == x.getBuffer().length)
                System.out.println("\t---- Køen er fuld! ----");
            count++;
            x.TagerRanTid(1000);
        }
    }
}
