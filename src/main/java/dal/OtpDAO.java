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
            ps.setInt(2, accountID);
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

//    public void saveOtp(int accountId, String code,String expiryDate) {
//        Otp otp = new Otp();
//        try {
//            PreparedStatement ps = connection.prepareStatement("insert into OTP (AccountID, Code, ExpiryDateTime) values (?,?,?)", Statement.RETURN_GENERATED_KEYS);
//
//            ps.setInt(1, accountId);
//            ps.setString(2, code);
//            ps.setString(3, expiryDate);
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }

//    public void updateOtp(int accountId, String code, String expiryDate) {
//        String sql = "UPDATE OTP SET Code = ?, ExpiryDateTime = ? WHERE AccountID = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//            st.setInt(1, accountId);
//            st.setString(2, code);
//            st.setString(3, expiryDate);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }


//    public boolean isUserInOTP(int accountId) {
//        String sql = "SELECT 1 FROM OTP WHERE AccountID = ?";
//        try (PreparedStatement st = connection.prepareStatement(sql)) {
//            st.setInt(1, accountId);
//            try (ResultSet rs = st.executeQuery()) {
//                return rs.next();
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }




}
