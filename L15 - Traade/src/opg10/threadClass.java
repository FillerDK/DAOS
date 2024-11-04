package opg10;

public class threadClass extends Thread {

    String navn;
    Common x;
    private int thisId;
    private int otherId;

    public threadClass(String navn, Common x, int id) {
        this.navn = navn;
        this.x = x;
        thisId = id;
    }

    public void run() {
        for (int i = 0; i < 100; i++) {
            otherId = (thisId + 1) % 2;
            x.setFlag(true, thisId);
            x.setTurn(otherId);
            while (x.getFlag(otherId) && x.getTurn() == otherId);
            x.opdaterGlobal();
            x.TagerRanTid(1000);
            x.setFlag(false, thisId);
        }
    }
}
