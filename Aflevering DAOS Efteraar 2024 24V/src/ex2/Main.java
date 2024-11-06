package ex2;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Common x = new Common();

        ankomstThread aT1 = new ankomstThread("Sted1", x, 0);
        ankomstThread aT2 = new ankomstThread("Sted2", x, 1);

        bagerdameThread bdT1 = new bagerdameThread("Brit", x);

        System.out.println("Start");

        aT1.start();
        aT2.start();
        bdT1.start();

    }
}
