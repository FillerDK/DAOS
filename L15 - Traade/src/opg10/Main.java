package opg10;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Common common = new Common();

        threadClass t1 = new threadClass("Philip", common, 0);
        threadClass t2 = new threadClass("Nils", common, 1);

        t1.start();
        t2.start();

        t2.join();

        System.out.println(common.getGlobal());
    }
}
