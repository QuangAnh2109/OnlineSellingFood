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

    public int addContact(ContactInformation ci){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into ContactInformation (Address, PhoneNumber) values (?,?)");
            insertStatement(ci.getAddress(), ps, 1, false);
            insertStatement(ci.getPhoneNumber(), ps, 2, true);
            return executeUpdate(ps);
        }catch (SQLException ex){
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
    public String getContactInformationIDbyAdressAndPhone(String Adress, String phoneNumber){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from ContactInformation where PhoneNumber=? and Address=?");
            insertStatement(Adress, ps, 2, false);
            insertStatement(phoneNumber, ps, 1, true);
            return ((ContactInformation)getObjectBySQL(ps)).getContactInformationID().toString();
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}