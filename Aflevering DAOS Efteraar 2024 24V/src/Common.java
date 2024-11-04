import java.util.Random;

public class Common {

    int turn;
    boolean[] flag;

    private volatile static int billetNummer = 0;
    private volatile static int ekspeditionsNummer = 0;

    public Common() {
        flag = new boolean[] {false, false};
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

    public int getBilletnummer() {
        return billetNummer;
    }

    public int getEkspeditionsNummer() {
        return ekspeditionsNummer;
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

    public static void opdaterBillet() {
        int temp;
        temp = billetNummer;
        TagerRanTid(1000);
        billetNummer = temp +1;
    }

    public static void opdaterEkspeditionsNummer() {
        int temp;
        temp = ekspeditionsNummer;
        TagerRanTid(1000);
        ekspeditionsNummer = temp +1;
    }
}
