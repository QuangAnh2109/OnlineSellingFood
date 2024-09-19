package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TestDBContext extends DBContext {

    public static void main(String[] args) {
        TestDBContext dbTest = new TestDBContext();
        ArrayList<Object> accounts = dbTest.getAllAccounts();
        for (Object account : accounts) {
            System.out.println(account);
        }
    }

    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        // Assuming 'Account' has these fields
        int roleID = rs.getInt("RoleID");
        String email = rs.getString("Email");
        String firstName = rs.getString("FirstName");
        String lastName = rs.getString("LastName");
        int birthYear = rs.getInt("BirthYear");
        int contactInfoID = rs.getInt("ContactInformationID");
        String password = rs.getString("Password");
        String time = rs.getString("Time"); // Convert date to string for simplicity
        int statusID = rs.getInt("StatusID");

        // Return the account as a formatted string (or an Account object if you have a model class)
        return "RoleID: " + roleID + ", Email: " + email + ", FirstName: " + firstName +
                ", LastName: " + lastName + ", BirthYear: " + birthYear + ", ContactInfoID: " + contactInfoID +
                ", Password: " + password + ", Time: " + time + ", StatusID: " + statusID;
    }

    // Method to fetch all accounts from the 'Account' table
    public ArrayList<Object> getAllAccounts() {
        ArrayList<Object> accounts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Account";
            PreparedStatement ps = connection.prepareStatement(sql);
            accounts = getListObjectBySQL(ps);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accounts;
    }
}
