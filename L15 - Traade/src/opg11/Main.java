package opg11;

import java.util.concurrent.Semaphore;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Common common = new Common();
        Semaphore s = new Semaphore(1);

        threadClass t1 = new threadClass("Philip", common, s);
        threadClass t2 = new threadClass("Nils", common, s);

        t1.start();
        t2.start();

        t2.join();

        System.out.println(common.getGlobal());
    }
}
