package dyrelyd;

public class Traadaftestning {

    /**
     * @param args
     */
    public static void main(String[] args) throws InterruptedException {
        // TODO Auto-generated method stub
        System.out.println("Vi er igang");
        threadClass t1 = new threadClass("MUUH");
        threadClass t2 = new threadClass("ØF");
        threadClass t3 = new threadClass("Mææh");
        t1.setPriority(1);
        t2.setPriority(10);
        t1.start();
        t2.start();
        t3.start();

        t1.join();
        t2.join();
        t3.join();

        System.out.println("Nu er det slut");
    }
}
