import java.util.Random;

public class Lottoraek {
    public boolean[] raek = new boolean[37];

    public Lottoraek() {
        for (int j=0; j < 37; j++)
            raek[j] = false;
        int ant = 0;
        Random r=new Random();
        while (ant < 7) {
            int tal = r.nextInt(1, 37);
            if (!raek[tal]) {
                raek[tal] = true;
                ant ++;
            }
        }
    };

    public int antalrigtige(Lottoraek rigtig) {
        int x =0;
        for (int j=1; j < 37; j++)
            if (this.raek[j] && rigtig.raek[j])
                x ++;
        return x;
    };
};