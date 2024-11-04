package opg9;

public class threadClass extends Thread {

    String navn;
    Common x;

    public threadClass(String navn, Common x) {
        this.navn = navn;
        this.x = x;
    }

    public void run() {
        for (int i = 0; i < 100; i++) {
            x.opdaterGlobal();
            x.TagerRanTid(1000);
        }
    }
}
