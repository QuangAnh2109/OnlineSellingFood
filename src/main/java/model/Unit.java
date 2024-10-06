package model;

public class Unit {
    private Integer unitID;
    private String name;

    public Unit() {
    }

    public Unit(Integer unitID, String name) {
        this.unitID = unitID;
        this.name = name;
    }

    public Integer getUnitID() {
        return unitID;
    }

    public void setUnitID(Integer unitID) {
        this.unitID = unitID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
