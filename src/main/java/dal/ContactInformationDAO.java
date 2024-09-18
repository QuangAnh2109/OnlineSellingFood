package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.ContactInformation;

public class ContactInformationDAO extends DBContext{

    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new ContactInformation(rs.getInt("ContactInformationID"), rs.getString("Address"), rs.getString("PhoneNumber"));
    }

    // Add a new contact and return the generated ContactInformationID
    public int addContact(ContactInformation ci) {
        try {
            String sql = "INSERT INTO ContactInformation (Address, PhoneNumber) OUTPUT INSERTED.ContactInformationID VALUES (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            insertStatement(ci.getAddress(), ps, 1, false); // nvarchar
            insertStatement(ci.getPhoneNumber(), ps, 2, true); // varchar
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("ContactInformationID");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public ContactInformation getContactInformationByContactID(Integer contactInformationID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from ContactInformation where ContactInformationID=?");
            insertStatement(contactInformationID,ps,1);
            return (ContactInformation)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public String getContactInformationIDbyAddressAndPhone(String address, String phoneNumber) {
        try {
            String sql = "SELECT ContactInformationID FROM ContactInformation WHERE Address = ? AND PhoneNumber = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            insertStatement(address, ps, 1, false);
            insertStatement(phoneNumber, ps, 2, true);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return String.valueOf(rs.getInt("ContactInformationID"));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public boolean deleteContact(int contactInfoID) {
        String sql = "DELETE FROM ContactInformation WHERE ContactInformationID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, contactInfoID);
            int rowsAffected = executeUpdate(ps);
            return rowsAffected > 0;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

}