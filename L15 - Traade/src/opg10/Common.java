package opg10;

import java.util.Random;

public class Common {
    int turn;
    volatile boolean[] flag;
    private volatile static int global = 0;

    public Common() {
        flag = new boolean[2];
        for (int i = 0; i < flag.length; i++) {
            flag[i] = false;
        }
    }

    public void setFlag(boolean flag, int id) {
        this.flag[id] = flag;
    }

    public boolean getFlag(int id) {
        return flag[id];
    }

    public void setTurn(int turn) {
        this.turn = turn;
    }

    public int getTurn() {
        return turn;
    }

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

    public static void opdaterGlobal() {
        int temp;
        temp = global;
        TagerRanTid(1000);
        global = temp + 1;
    }
}
