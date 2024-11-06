package ex3;

import java.util.Random;

public class Common {

    private volatile static int sidsteNummer = 0;
    private volatile static int ekspeditionsNummer = 0;

    public int getBilletnummer() {
        return sidsteNummer;
    }

    public int getEkspeditionsNummer() {
        return ekspeditionsNummer;
    }

    public int getKøStørrelse() {
        return getBilletnummer() - getEkspeditionsNummer();
    }

    public static void TagerRanTid(int max) {
        int x, y;
        Random r = new Random(1023);
        int max2 = r.nextInt(1, max +1);
        for (int i = 0; i < max2; i++) {
            for (int j = 0; j < max2; j++) {
                x = i + j;
                y = i - j;
            }
        }
    }

    public static synchronized void opdaterBillet() {
        int temp;
        temp = sidsteNummer;
        TagerRanTid(10000);
        sidsteNummer = temp +1;
    }

    public static synchronized void opdaterEkspeditionsNummer() {
        int temp;
        temp = ekspeditionsNummer;
        TagerRanTid(10000);
        ekspeditionsNummer = temp +1;
    }
}
