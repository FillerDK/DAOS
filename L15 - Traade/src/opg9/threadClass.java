package opg9;

public class threadClass extends Thread {

    String navn;
    Common x;
    private int thisId;
    private int concurrentId;

    public threadClass(String navn, Common x, int id) {
        this.navn = navn;
        this.x = x;
        thisId = id;
    }

    public void run() {
        for (int i = 0; i < 100; i++) {
            concurrentId = (thisId + 1) % 2;
            x.setFlag(true, thisId);
            x.setTurn(concurrentId);
            while (x.getFlag(concurrentId) && x.getTurn() == concurrentId);
            x.opdaterGlobal();
            x.TagerRanTid(1000);
            x.setFlag(false, thisId);
        }
    }
}
