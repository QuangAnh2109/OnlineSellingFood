package dal;

import model.AccountContact;
import model.ContactInformation;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collections;
import java.util.List;

public class AccountContactDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new AccountContact(rs.getObject("AccountID",Integer.class),rs.getObject("ContactInformationID",Integer.class),rs.getObject("IsDefault",Integer.class));
    }

    public boolean addAccountContact(AccountContact accountContact){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into AccountContact (AccountID, ContactInformationID, IsDefault) values (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, accountContact.getAccountID());
            ps.setInt(2, accountContact.getContactInformationID());
            ps.setInt(3, accountContact.getIsDefault());
            ResultSet rs = executeUpdate(ps);
            if(rs!=null) return rs.next();
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return false;
    }

    public boolean deleteAccountContact(AccountContact accountContact){
        try{
            PreparedStatement ps = connection.prepareStatement("delete from AccountContact where AccountID=? and ContactInformationID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, accountContact.getAccountID());
            ps.setInt(2, accountContact.getContactInformationID());
            ResultSet rs = executeUpdate(ps);
            if(rs!=null) return rs.next();
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return false;
    }

    public boolean updateAccountContact(int contactID, int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("update AccountContact set ContactInformationID=? where AccountID=? and IsDeFault=1", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, contactID);
            ps.setInt(2, accountID);
            ResultSet rs = executeUpdate(ps);
            if(rs!=null) return rs.next();
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return false;
    }

    public boolean updateDefaultAccountContact(int isDefault, int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("update AccountContact set IsDefault=? where AccountID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, isDefault);
            ps.setInt(2, accountID);
            ResultSet rs = executeUpdate(ps);
            if(rs!=null) return rs.next();
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return false;
    }

    public AccountContact getAccountContact(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select AccountID,ContactInformationID,IsDefault from AccountContact where AccountID=? and IsDefault=1");
            ps.setInt(1, accountID);
            return (AccountContact)getObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return null;
    }

    public List<AccountContact> getAllAccountContact(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from AccountContact where AccountID=?");
            ps.setInt(1,accountID);
            return (List<AccountContact>) (Object) getListObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return Collections.emptyList();
    }
}