package ex4;

import java.time.LocalTime;
import java.util.Random;

public class ankomstThread extends Thread {
    String navn;
    Common x;
    String[] navne;
    int count = 0;
    private int antalKunder;

    public ankomstThread(String navn, Common x, String[] navneliste, int kunder) {
        this.navn = navn;
        this.x = x;
        navne = navneliste;
        antalKunder = kunder;
    }

    public void run() {
        System.out.printf("""
                %02d:%02d:%02d : Indgang %s er åben!
                """, LocalTime.now().getHour(), LocalTime.now().getMinute(),
                LocalTime.now().getSecond(), navn);
        Random r = new Random();
        for (int i = 0; i < antalKunder; i++) {
            try {
                sleep(r.nextInt(2000, 8000));
            } catch (InterruptedException ex) {
                throw new RuntimeException(ex);
            }
            try {
                x.append(navne[count]);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            System.out.printf("""
                    %02d:%02d:%02d : %s benyttede indgang %s og er nummer %d i køen!
                    """, LocalTime.now().getHour(), LocalTime.now().getMinute(),
                    LocalTime.now().getSecond(), navne[count], navn, x.getCount());
            if (x.getCount() == x.getBuffer().length)
                System.out.println("\t---- Køen er fuld! ----");
            count++;
        }
    }
}
