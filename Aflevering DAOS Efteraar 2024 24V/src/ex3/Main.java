package ex3;

import java.util.concurrent.Semaphore;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Common x = new Common();
        Semaphore s = new Semaphore(0);

        ankomstThread aT1 = new ankomstThread("Sted1", x, 0, s);
        ankomstThread aT2 = new ankomstThread("Sted2", x, 1, s);

        bagerdameThread bdT1 = new bagerdameThread("Brit", x);

        System.out.println("Start");

        aT1.start();
        aT2.start();
        bdT1.start();

    }
}
