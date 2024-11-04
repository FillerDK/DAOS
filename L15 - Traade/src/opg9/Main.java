package opg9;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Common common = new Common();

        threadClass t1 = new threadClass("Philip", common);
        threadClass t2 = new threadClass("Nils", common);

        t1.start();
        t2.start();

        t2.join();

        System.out.println(common.getGlobal());
    }
}
