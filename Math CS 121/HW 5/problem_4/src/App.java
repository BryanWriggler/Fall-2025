public class App {
    //factorial n!
    public static int factorial(int n){
        if (n==0) { //for n=0, 0!=1
            return 1;
        }

        int cum = 1; //cummulative product
        for (int i=1; i<= n; i++) { //multiply by 1 through n
            cum *= i;
        }

        return cum;
    }

    //Create n choose r method
    public static int nCr(int n, int r) {//for more precise statement, add try and catch so that n>0 is required
        if (r==0) {//r=0, always return 1
            return 1;
        }

        //

        return factorial(n) / (factorial(n-r) * factorial(r));
    }

    public static void main(String[] args) {
        //create a for loop to see when does n creates the function being at most 0.1
        double prob = 1; //the cumulative probability for k<=4, given n
        int n = 5; // n needs to start from at least 5, for having at least 5 things to be germinated
        while (prob >= 0.1 || n>= 1000000) {//condition: desired probability < 0.1 (and set an upper bound to prevent overrun)
            double temp_prob = 0; //temporary probability fro cumulation

            for (int i=0; i<=4; i++) {
                temp_prob += nCr(n,i) * Math.pow(3,i) * Math.pow(0.25,n);
            }

            prob = temp_prob;
        }

        System.out.println(n); //return the final n such that prob < 0.1
    }
}
