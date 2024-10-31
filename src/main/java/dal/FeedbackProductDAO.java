package dal;

import dto.FeedbackResponse;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class FeedbackProductDAO extends DBContext {
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return null;
    }

    public boolean existOrderProduct(int productID, int customerID) {
        String sql = "select * from FeedbackProduct where ProductID=? and CustomerID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, customerID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public void updateFeedbackProduct(int productID, int customerID, int star, String comment, LocalDateTime time) {
        String sql = "UPDATE [dbo].[FeedbackProduct]\n" +
                "   SET Star=?,Feedback=?,Time=?\n" +
                " WHERE ProductID=? and CustomerID=?\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, star);
            st.setString(2, comment);
            st.setTimestamp(3, Timestamp.valueOf(time));
            st.setInt(4, productID);
            st.setInt(5, customerID);
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addFeedbackProduct(int productID, int customerID, Integer star, String comment, LocalDateTime time, Integer replyID) {
        String sql = "INSERT INTO [dbo].[FeedbackProduct]\n" +
                "           ([ProductID],\n" +
                "           [CustomerID],\n" +
                "           [Star],\n" +
                "           [Feedback],\n" +
                "           [Time],\n" +
                "           [ReplyID])\n" +
                "     VALUES\n" +
                "           (?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, customerID);
            if (star != null) {
                st.setInt(3, star);
            } else {
                st.setNull(3, java.sql.Types.INTEGER);
            }
            st.setString(4, comment);
            st.setTimestamp(5, Timestamp.valueOf(time));
            if (replyID != null) {
                st.setInt(6, replyID);
            } else {
                st.setNull(6, java.sql.Types.INTEGER);
            }
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<FeedbackResponse> getAllFeedbackProduct(int productID) {
        List<FeedbackResponse> list = new ArrayList<>();
        String sql = "SELECT f.CustomerID,a.[Name], f.Star, f.Feedback, FORMAT(f.[Time], 'yyyy-MM-dd HH:mm') AS FormattedTime, f.ReplyID, f.FeedbackID \n" +
                "                 FROM FeedbackProduct f \n" +
                "                 JOIN Customer c ON f.CustomerID = c.CustomerID\n" +
                "                 JOIN Account a ON c.AccountID = a.AccountID\n" +
                "                 WHERE f.ProductID = ?\n" +
                "                 AND f.Star IS NOT NULL \n" +
                "                 AND f.Feedback IS NOT NULL \n" +
                "                 AND f.[Time] IS NOT NULL \n" +
                "                 ORDER BY f.ReplyID, f.FeedbackID";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                FeedbackResponse r = new FeedbackResponse();
                r.setCustomerID(rs.getInt("CustomerID"));
                r.setCustomerName(rs.getString("Name"));
                r.setStar(rs.getInt("Star"));
                r.setFeedback(rs.getString("Feedback"));
                r.setTime(rs.getString("FormattedTime"));
                r.setReplyID(rs.getInt("replyID"));
                r.setFeedbackID(rs.getInt("feedbackID"));
                list.add(r);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    public List<FeedbackResponse> getReplyComment(int replyID) {
        List<FeedbackResponse> list = new ArrayList<>();
        String sql = "SELECT f.CustomerID,a.[Name], f.Star, f.Feedback, FORMAT(f.[Time], 'yyyy-MM-dd HH:mm') AS FormattedTime, f.ReplyID, f.FeedbackID \n" +
                "FROM FeedbackProduct f \n" +
                "JOIN Customer c ON f.CustomerID = c.CustomerID\n" +
                "JOIN Account a ON c.AccountID = a.AccountID\n" +
                "WHERE f.ReplyID= ?               \n" +
                "AND f.Feedback IS NOT NULL \n" +
                " AND f.[Time] IS NOT NULL \n" +
                "ORDER BY f.ReplyID, f.FeedbackID";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, replyID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                FeedbackResponse r = new FeedbackResponse();
                r.setCustomerID(rs.getInt("CustomerID"));
                r.setCustomerName(rs.getString("Name"));
                r.setStar(rs.getInt("Star"));
                r.setFeedback(rs.getString("Feedback"));
                r.setTime(rs.getString("FormattedTime"));
                r.setReplyID(rs.getInt("replyID"));
                r.setFeedbackID(rs.getInt("feedbackID"));
                list.add(r);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }



    public static void main(String[] args) {
        FeedbackProductDAO dao = new FeedbackProductDAO();
        List<FeedbackResponse> list=dao.getAllFeedbackProduct(2);
        System.out.println(list);

        }
    }



