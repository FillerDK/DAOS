package ex3;

import java.util.concurrent.Semaphore;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Common x = new Common();

        ankomstThread aT1 = new ankomstThread("A", x, 0);
        ankomstThread aT2 = new ankomstThread("B", x, 1);

        bagerdameThread bdT1 = new bagerdameThread("Brit", x);

        aT1.start();
        aT2.start();
        bdT1.start();
    }
}
