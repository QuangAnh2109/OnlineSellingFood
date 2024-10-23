package dal;



import model.Img;
import org.w3c.dom.ls.LSOutput;


import java.sql.*;

public class ImgDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Img(rs.getInt("ImgID"),rs.getString("Imglink"));


    }
    // Phương thức lấy ImgID dựa trên Imglink
    public Integer getImgIdByLink(String imgLink) {
        String sql = "SELECT ImgID FROM Img WHERE Imglink = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, imgLink);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("ImgID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public String getImgLinkByID(Integer imgId) {
        String sql = "SELECT Imglink FROM Img WHERE ImgID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, imgId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("Imglink");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteImg(int imgID) {
        String sql = "DELETE FROM Img WHERE ImgID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, imgID);
            ResultSet rs = executeUpdate(ps);
            if(rs!=null) return rs.next();
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        ImgDAO dao = new ImgDAO();
        System.out.println(dao.deleteImg(35));
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

    public int addImg1(Img img) {
        String sql = "INSERT INTO Img (Imglink) VALUES (?)";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, img.getImglink());
            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    } else {
                        throw new SQLException("Creating Img failed, no ID obtained.");
                    }
                }
            } else {
                throw new SQLException("Creating Img failed, no rows affected.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

}

