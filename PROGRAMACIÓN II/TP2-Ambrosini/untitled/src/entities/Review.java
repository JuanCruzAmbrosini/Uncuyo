package entities;

public class Review {

    private int score;
    private String comment;

    public Review() {

    }

    public int score() {
        return score;
    }

    public Review setScore(int score) {
        this.score = score;
        return this;
    }

    public String comment() {
        return comment;
    }

    public Review setComment(String comment) {
        this.comment = comment;
        return this;
    }
}
