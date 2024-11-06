package ex4;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Common x = new Common();
        String[] navne1 = {
                "Jonathan", "Jakob", "Nils", "Jens", "Christian",
                "Lucas", "Philip", "Torben", "Mads", "Josephine"};
        String[] navne2 = {
                "Peter", "Mikael", "Martin", "Hanne", "Susanne",
                "Søren", "Karsten", "Esben", "Simon", "Oliver"};

        ankomstThread aT1 = new ankomstThread("A", x, navne1);
        ankomstThread aT2 = new ankomstThread("B", x, navne2);

        bagerdameThread bdT1 = new bagerdameThread("Brit", x);
        bagerdameThread bdT2 = new bagerdameThread("Hanne", x);

        System.out.println("Start");

        bdT1.start();
        bdT2.start();
        aT1.start();
        aT2.start();
    }
}
