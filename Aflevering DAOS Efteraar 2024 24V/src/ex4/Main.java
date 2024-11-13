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

        ankomstThread indgangA = new ankomstThread("A", x, navne1, navne1.length);
        ankomstThread indgangB = new ankomstThread("B", x, navne2, navne2.length);

        bagerdameThread brit = new bagerdameThread("Brit", x);
        bagerdameThread hanne = new bagerdameThread("Hanne", x);

        indgangA.start();
        indgangB.start();
        brit.start();
        hanne.start();

        while (x.getAntalEkspedierede() != navne1.length+ navne2.length) Thread.sleep(500);

        brit.setWork(false);
        hanne.setWork(false);
    }
}
