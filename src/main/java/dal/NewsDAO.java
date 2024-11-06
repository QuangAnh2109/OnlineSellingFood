package dal;

import model.News;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO extends DBContext {

    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new News(
                rs.getInt("NewsID"),
                rs.getInt("StaffID"),
                rs.getInt("ImgID"),
                rs.getString("Title"),
                rs.getString("Content"),
                rs.getDate("Time"),
                rs.getBoolean("Active")  // Retrieving active status
        );
    }

    // insert
    public boolean insert(News news) {
        String sql = "INSERT INTO News (StaffID, ImgID, Title, Content, Active) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, news.getStaffID());
            st.setInt(2, news.getImgID());
            st.setString(3, news.getTitle());
            st.setString(4, news.getContent());
            st.setBoolean(5, news.isActive()); // Setting active status
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error inserting news: " + e.getMessage());
            return false;
        }
    }

    // get all news
    public List<News> getAll() {
        List<News> list = new ArrayList<>();
        String sql = "SELECT * FROM News";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                list.add((News)getObjectByRs(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error getting all news: " + e.getMessage());
        }
        return list;
    }

    public News getById(int newsID) {
        String sql = "SELECT * FROM News WHERE NewsID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, newsID);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                return (News)getObjectByRs(rs);
            }
        } catch (SQLException e) {
            System.out.println("Error getting news by ID: " + e.getMessage());
        }
        return null;
    }

    // update news
    public boolean update(News news) {
        String sql = "UPDATE News SET StaffID=?, ImgID=?, Title=?, Content=?, Active=? WHERE NewsID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, news.getStaffID());
            st.setInt(2, news.getImgID());
            st.setString(3, news.getTitle());
            st.setString(4, news.getContent());
            st.setBoolean(5, news.isActive()); // Setting active status
            st.setInt(6, news.getNewsID());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error updating news: " + e.getMessage());
            return false;
        }
    }

    // delete news
    public boolean delete(int newsID) {
        String sql = "DELETE FROM News WHERE NewsID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, newsID);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error deleting news: " + e.getMessage());
            return false;
        }
    }

    // get news by staff ID
    public List<News> getByStaffId(int staffID) {
        List<News> list = new ArrayList<>();
        String sql = "SELECT * FROM News WHERE StaffID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, staffID);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                list.add((News)getObjectByRs(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error getting news by staff ID: " + e.getMessage());
        }
        return list;
    }

    // search by title
    public List<News> searchByTitle(String title) {
        List<News> list = new ArrayList<>();
        String sql = "SELECT * FROM News WHERE Title LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + title + "%"); // Use '%' for partial matches
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add((News) getObjectByRs(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error searching news by title: " + e.getMessage());
        }
        return list;
    }

}
