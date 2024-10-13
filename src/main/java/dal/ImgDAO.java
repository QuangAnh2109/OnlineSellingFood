package dal;



import model.Img;


import java.sql.*;

public class ImgDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Img(rs.getInt("ImgID"),rs.getString("Imglink"));


    }

    public boolean addImage(String imgLink) {

        try {
            // Kết nối đến cơ sở dữ liệu

            PreparedStatement ps = connection.prepareStatement("INSERT INTO Img (Imglink) VALUES (?)");
            ps.setString(1, imgLink);
            // Thực thi câu lệnh
            ps.executeQuery();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ResultSet addImg(Img img) {
        try {
            // Kết nối đến cơ sở dữ liệu

            PreparedStatement ps = connection.prepareStatement("INSERT INTO Img (Imglink) VALUES (?)");
            ps.setString(1, img.getImglink());
            // Thực thi câu lệnh
            ps.executeQuery();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    }

