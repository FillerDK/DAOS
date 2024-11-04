package opg12;

import java.util.Random;

public class Common {
    private volatile static int global = 0;

    public int getGlobal() {
        return global;
    }

    public static void TagerRanTid (int max) {
        int x, y;
        Random r = new Random(1023);
        int max2 = r.nextInt(1, max + 1);
        for (int j = 0; j < max2; j++) {
            for (int i = 0; i < max2; i++) {
                x = i + j;
                y = i - j;
            }
        }
    }

    public static synchronized void opdaterGlobal() {
        int temp;
        temp = global;
        TagerRanTid(1000);
        global = temp + 1;
    }
}
