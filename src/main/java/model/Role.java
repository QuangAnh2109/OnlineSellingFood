package model;

import controller.Validate;

public class Role {
    private int roleID;
    private String name;

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) throws Exception {
        Validate.checkString(roleID);
        this.roleID = Integer.parseInt(roleID);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) throws Exception {
        Validate.checkString(name,1,100);
        this.name = name;
    }
}
