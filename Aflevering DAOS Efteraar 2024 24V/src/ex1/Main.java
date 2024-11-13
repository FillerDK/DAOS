package ex1;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Common x = new Common();

        ankomstThread indgangA = new ankomstThread("A", x, 0);
        ankomstThread indgangB = new ankomstThread("B", x, 1);

        bagerdameThread brit = new bagerdameThread("Brit", x);

        indgangA.start();
        indgangB.start();
        brit.start();
    }
}
