package dal;



import model.Img;


import java.security.NoSuchAlgorithmException;
import java.sql.*;

public class ImgDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Img(rs.getInt("ImgID"),rs.getString("Imglink"));


    }
    public ResultSet addImg(Img img) {
        try{
            PreparedStatement ps = connection.prepareStatement("insert into Img (ImgID, Imglink) values (?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, img.getImgID());
            ps.setString(2, img.getImglink());

            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
