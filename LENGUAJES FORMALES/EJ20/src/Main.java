import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;


public class Main {
    public static void main(String[] args) {
        String ruta = "/home/laika/Documents/Uncuyo/LENGUAJES FORMALES/EJ20/src/palabras.txt";

        // try-with-resources cierra el archivo automáticamente
        try (BufferedReader br = new BufferedReader(new FileReader(ruta))) {
            String linea;

            // Lee línea por línea hasta llegar al final (null)
            while ((linea = br.readLine()) != null) {
                if (automataFunction(linea)) {
                    System.out.println("La palabra " + linea + " es aceptada por el autómata.");
                } else {
                    System.out.println("La palabra " + linea + " no es aceptada por el autómata.");
                }
            }

        } catch (IOException e) {
            System.out.println("Ocurrió un error al leer el archivo: " + e.getMessage());
        }
    }


    public static boolean automataFunction(String palabra) {

        boolean accepted = false;

        State state0 = new State("S0", new ArrayList<>(), false, true, false);
        State state1 = new State("S1", new ArrayList<>(), false, false, false);
        State state2 = new State("S2", new ArrayList<>(), false, false, false);
        State state3 = new State("S3", new ArrayList<>(), false, false, true);
        State state4 = new State("S4", new ArrayList<>(), false, false, false);
        State state5 = new State("S5", new ArrayList<>(), true, false, true);
        State state6 = new State("S6", new ArrayList<>(), false, false, false);
        State state7 = new State("S7", new ArrayList<>(), false, false, false);
        State state8 = new State("S8", new ArrayList<>(), false, false, false);
        State state9 = new State("S9", new ArrayList<>(), true, false, true);
        State state10 = new State("S10", new ArrayList<>(), false, false, false);
        State state11 = new State("S11", new ArrayList<>(), false, false, false);
        State state12 = new State("S12", new ArrayList<>(), true, false, true);

        ArrayList<State.Par> trS0 = new ArrayList<>();
        trS0.add(new State.Par("i", state1));
        trS0.add(new State.Par("e", state2));
        ArrayList<State.Par> trS1 = new ArrayList<>();
        trS1.add(new State.Par("m", state4));
        trS1.add(new State.Par("f", state5));
        ArrayList<State.Par> trS2 = new ArrayList<>();
        trS2.add(new State.Par("l", state10));
        ArrayList<State.Par> trS3 = new ArrayList<>();
        ArrayList<State.Par> trS4 = new ArrayList<>();
        trS4.add(new State.Par("p", state6));
        ArrayList<State.Par> trS5 = new ArrayList<>();
        ArrayList<State.Par> trS6 = new ArrayList<>();
        trS6.add(new State.Par("o", state7));
        ArrayList<State.Par> trS7 = new ArrayList<>();
        trS7.add(new State.Par("r", state8));
        ArrayList<State.Par> trS8 = new ArrayList<>();
        trS8.add(new State.Par("t", state9));
        ArrayList<State.Par> trS9 = new ArrayList<>();
        ArrayList<State.Par> trS10 = new ArrayList<>();
        trS10.add(new State.Par("s", state11));
        ArrayList<State.Par> trS11 = new ArrayList<>();
        trS11.add(new State.Par("e", state12));
        ArrayList<State.Par> trS12 = new ArrayList<>();


        state0.setStates(trS0);
        state1.setStates(trS1);
        state2.setStates(trS2);
        state3.setStates(trS3);
        state4.setStates(trS4);
        state5.setStates(trS5);
        state6.setStates(trS6);
        state7.setStates(trS7);
        state8.setStates(trS8);
        state9.setStates(trS9);
        state10.setStates(trS10);
        state11.setStates(trS11);
        state12.setStates(trS12);

        State actualState = state0;
        int counter = 0;


        for (int i = 0; i < palabra.length(); i++) {
            counter = 0;
            String letra = String.valueOf(palabra.charAt(i));

            for (int j = 0; j < actualState.getStates().size(); j++) {

                if (Objects.equals(letra, actualState.getStates().get(j).symbol())) {
                    actualState = actualState.getStates().get(j).nextState();
                    counter++;
                    break;
                }
            }
            if (counter == 0) {
                actualState = state3;
                break;
            }
        }

        if (actualState.isFinal() && actualState.isAccepting()) {
            accepted = true;
        }

        return accepted;
    }
}

