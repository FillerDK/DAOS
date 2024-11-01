package dyrelyd;

public class threadClass extends Thread {

    String dyrelyd;

    public threadClass(String dyrelyd) {
        super();
        this.dyrelyd = dyrelyd;
    }

    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(dyrelyd);
            try {
                threadClass.sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
