package dal;



import model.Img;


import java.sql.*;

public class ImgDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Img(rs.getInt("ImgID"),rs.getString("Imglink"));


    }



    public void addImg(Img img) {
        String sql = "INSERT INTO Img (Imglink) VALUES (?)";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, img.getImglink());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    }

