package dal;

import common.Encrypt;
import model.Otp;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.time.LocalDateTime;

public class OtpDAO extends  DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Otp(rs.getInt("AccountID"), rs.getString("Code"), rs.getObject("ExpiryDateTime", LocalDateTime.class));
    }

    public boolean checkOtp(int accountID, String otp) {
        try{
            PreparedStatement ps = connection.prepareStatement("select * from OTP where Code=? and AccountID=?");
            ps.setString(1, Encrypt.toHexString(Encrypt.getSHA(otp)));
            if(getObject(ps)!=null) return true;
        }catch (SQLException | NoSuchAlgorithmException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public ResultSet addOtp(Otp otp) {
        try{
            PreparedStatement ps = connection.prepareStatement("insert into OTP (AccountID, Code, ExpiryDateTime) values (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, otp.getAccountID());
            ps.setString(2, Encrypt.toHexString(Encrypt.getSHA(otp.getCode())));
            ps.setTimestamp(3, Timestamp.valueOf(otp.getExpiryDateTime()));
            return executeUpdate(ps);
        }catch (SQLException | NoSuchAlgorithmException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet deleteOtp(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("DELETE FROM OTP WHERE AccountID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, accountID);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet updateOtp(Otp otp) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE OTP SET Code = ?, ExpiryDateTime = ? WHERE AccountID = ?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(3, otp.getAccountID());
            ps.setString(1, Encrypt.toHexString(Encrypt.getSHA(otp.getCode())));
            ps.setTimestamp(2, Timestamp.valueOf(otp.getExpiryDateTime()));
            return executeUpdate(ps);
        } catch (SQLException | NoSuchAlgorithmException e) {
            System.out.println(e);
        }
        return null;
    }
}
