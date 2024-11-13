package ex4;

import java.util.Random;

public class Common {

    private static int n = 6;
    private int antalEkspedierede;
    private static String[] buffer = new String[n];
    private int nextin = 0;
    private int nextout = 0;
    private int count = 0;

    public int getN() {
        return n;
    }

    public int getNextin() {
        return nextin;
    }

    public int getNextout() {
        return nextout;
    }

    public int getCount() {
        return count;
    }

    public int getAntalEkspedierede() {
        return antalEkspedierede;
    }

    public String[] getBuffer() {
        return buffer;
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

    public synchronized void append(String x) throws InterruptedException {
        while (count == buffer.length) wait();
        buffer[nextin] = x;
        nextin = (nextin + 1) % buffer.length;
        count++;
        notifyAll();
    }

    public synchronized String take() throws InterruptedException {
        String x;
        while (count == 0) wait();
        x = buffer[nextout];
        nextout = (nextout + 1) % buffer.length;
        count--;
        notifyAll();
        antalEkspedierede++;
        return x;
    }
}
