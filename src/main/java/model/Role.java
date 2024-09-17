package model;

import controller.Validate;

public class Role {
    private Integer roleID;
    private String name;

    public Role() {
    }

    public Role(Integer roleID, String name) {
        this.roleID = roleID;
        this.name = name;
    }

    public Integer getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) throws Exception {
        Validate.checkString(roleID);
        int number = Integer.parseInt(roleID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.roleID = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) throws Exception {
        Validate.checkString(name,1,100);
        this.name = name;
    }
}
