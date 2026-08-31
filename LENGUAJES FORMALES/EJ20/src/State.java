import java.util.ArrayList;

public class State {

    private String name;
    public record Par(String symbol, State nextState) {}
    private ArrayList<Par> states;
    private boolean isAccepting;
    private boolean isInitial;
    private boolean isFinal;

    public State() {
    }

    public State(String name, ArrayList<Par> states, boolean isAccepting, boolean isInitial, boolean isFinal) {
        this.name = name;
        this.states = states;
        this.isAccepting = isAccepting;
        this.isInitial = isInitial;
        this.isFinal = isFinal;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Par> getStates() {
        return states;
    }

    public void setStates(ArrayList<Par> states) {
        this.states = states;
    }

    public boolean isAccepting() {
        return isAccepting;
    }

    public void setAccepting(boolean accepting) {
        isAccepting = accepting;
    }

    public boolean isInitial() {
        return isInitial;
    }

    public void setInitial(boolean initial) {
        isInitial = initial;
    }

    public boolean isFinal() {
        return isFinal;
    }

    public void setFinal(boolean aFinal) {
        isFinal = aFinal;
    }

    @Override
    public String toString() {
        return "State{" +
                "name='" + name + '\'' +
                ", states=" + states +
                ", isAccepting=" + isAccepting +
                ", isInitial=" + isInitial +
                ", isFinal=" + isFinal +
                '}';
    }
}


