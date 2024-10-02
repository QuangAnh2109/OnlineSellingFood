package dto;

public class StaffDetailRespone {
    private int roleID;
    private String firstName,lastName,email,phoneNumber,address;
    private int yearOfBirth;
    private int salary;
    private int warehouseID;

    public StaffDetailRespone() {}

    public StaffDetailRespone(int roleID, String firstName, String lastName, String email, String phoneNumber, String address, int yearOfBirth, int salary, int warehouseID) {
        this.roleID = roleID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.yearOfBirth = yearOfBirth;
        this.salary = salary;
        this.warehouseID = warehouseID;
    }

   public int getRoleID() {
        return roleID;
   }
   public void setRoleID(int roleID) {
        this.roleID = roleID;
   }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getYearOfBirth() {
        return yearOfBirth;
    }

    public void setYearOfBirth(int yearOfBirth) {
        this.yearOfBirth = yearOfBirth;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

   public int getWarehouseID() {
        return warehouseID;
   }
   public void setWarehouseID(int warehouseID) {
        this.warehouseID = warehouseID;
   }
}
