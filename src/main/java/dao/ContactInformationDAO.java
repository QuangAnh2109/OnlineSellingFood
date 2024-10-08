package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Common.InsertPrepareStatement;
import model.ContactInformation;

public class ContactInformationDAO extends DBContext{

    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new ContactInformation(rs.getInt("ContactInformationID"), rs.getString("Address"), rs.getString("PhoneNumber"));
    }

    public ResultSet addContact(ContactInformation ci){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into ContactInformation (Address, PhoneNumber) values (?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setNString(1, ci.getAddress());
            ps.setString(2, ci.getPhoneNumber());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet updateContact(ContactInformation ci){
        try{
            PreparedStatement ps = connection.prepareStatement("update ContactInformation set Address=?, PhoneNumber=? where ContactInformationID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setNString(1, ci.getAddress());
            ps.setString(2, ci.getPhoneNumber());
            ps.setInt(3, ci.getContactInformationID());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ContactInformation getContactInformationByContactID(Integer contactInformationID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from ContactInformation where ContactInformationID=?");
            ps.setInt(1, contactInformationID);
            return (ContactInformation)getObject(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public ContactInformation getContactInformationByAddressAndPhone(String Adress, String phoneNumber){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from ContactInformation where PhoneNumber=? and Address=?");
            ps.setNString(2, Adress);
            ps.setString(1, phoneNumber);
            return (ContactInformation)getObject(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}