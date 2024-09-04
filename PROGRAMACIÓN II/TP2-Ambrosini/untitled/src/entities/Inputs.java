package entities;

public class Inputs {

    private double productLiters;
    private boolean needsTools;
    private String others;

    public Inputs() {

        this.productLiters = 10;
        this.needsTools = true;
        this.others = "none";

    }

    public double productLiters() {
        return productLiters;
    }

    public void setProductLiters(double productLiters) {
        this.productLiters = productLiters;
    }

    public boolean needsTools(boolean b) {
        return needsTools;
    }

    public void setNeedsTools(boolean needsTools) {
        this.needsTools = needsTools;
    }

    public String others() {
        return others;
    }

    public void setOthers(String others) {
        this.others = others;
    }
}
