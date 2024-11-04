public class bagerdameThread extends Thread {
    String navn;
    Common x;

    public bagerdameThread(String navn, Common x) {
        super();
        this.navn = navn;
        this.x = x;
    }

    public void run() {
        while (x.getEkspeditionsNummer() != x.getBilletnummer()){
            try {
                sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            x.opdaterEkspeditionsNummer();
            System.out.printf("Kunde %d er blevet ekspederet.\n", x.getEkspeditionsNummer());
        }
    }
}
