package model;

public class Unit {
    private int unitID;
    private String name;

    public Unit() {
    }

    public Unit(int unitID, String name) {
        this.unitID = unitID;
        this.name = name;
    }

    public int getUnitID() {
        return unitID;
    }

    public void setUnitID(int unitID) {
        this.unitID = unitID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
