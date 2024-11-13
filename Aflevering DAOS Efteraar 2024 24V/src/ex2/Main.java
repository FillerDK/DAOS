package ex2;

import java.util.concurrent.Semaphore;

public class Main {
    public static void main(String[] args) {
        Common x = new Common();
        Semaphore s = new Semaphore(1);

        ankomstThread indgangA = new ankomstThread("A", x, 0, s);
        ankomstThread indgangB = new ankomstThread("B", x, 1, s);

        bagerdameThread brit = new bagerdameThread("Brit", x);

        indgangA.start();
        indgangB.start();
        brit.start();
    }
}
