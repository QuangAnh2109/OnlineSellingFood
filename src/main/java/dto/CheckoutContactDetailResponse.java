package dto;

public class CheckoutContactDetailResponse {
    private String name,phone,address;
    private int isDefault;

    public CheckoutContactDetailResponse(String phone, String name, String address, int isDefault) {
        this.phone = phone;
        this.name = name;
        this.address = address;
        this.isDefault = isDefault;
    }

    public CheckoutContactDetailResponse() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(int isDefault) {
        this.isDefault = isDefault;
    }
}
