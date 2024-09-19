package model;

public class Origin {
    private int originID;
    private String name;

    public Origin() {
    }

    public Origin(int originID, String name) {
        this.originID = originID;
        this.name = name;
    }

    public int getOriginID() {
        return originID;
    }

    public void setOriginID(int originID) {
        this.originID = originID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
