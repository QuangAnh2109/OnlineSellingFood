package dal;

import dto.ProductDiscountResponse;
import model.Discount;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Vector;

public class DiscountDAO extends DBContext{

    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
//        return new Discount(rs.getObject("DiscountID",Integer.class),rs.getObject("DiscountPercent",Integer.class),rs.getObject("St"))
    return null;

    }
    public List<ProductDiscountResponse> getProductDiscount(String search) {
        List<ProductDiscountResponse> res = new Vector<ProductDiscountResponse>();
        String sql = "select p.ProductID,d.DiscountID,p.[Name],c.[Name],p.Price,d.DiscountPercent,d.StartTime,d.EndTime\n" +
                "from Product p left join Discount d on p.DiscountID = d.DiscountID\n" +
                "join Category c on p.CategoryID = c.CategoryID where p.[Name] like ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" +search+ "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Lấy các giá trị thời gian bằng Timestamp và chuyển sang LocalDateTime
                Timestamp startTimestamp = rs.getTimestamp(7); // Lấy giá trị StartTime
                LocalDateTime startTime = startTimestamp != null ? startTimestamp.toLocalDateTime() : null;

                Timestamp endTimestamp = rs.getTimestamp(8); // Lấy giá trị EndTime
                LocalDateTime endTime = endTimestamp != null ? endTimestamp.toLocalDateTime() : null;
                res.add(new ProductDiscountResponse(rs.getInt(1)
                        , rs.getInt(2)
                        ,rs.getString(3)
                        , rs.getString(4)
                        , rs.getInt(5)
                        , rs.getInt(6)
                        , startTime
                        , endTime));
            }
        return res;
        } catch (Exception e) {
            e.printStackTrace();
        }


        return null;
    }
public int checkExistPercent(int discountPercent, LocalDateTime startTime, LocalDateTime endTime) {
    String sql = "select * from Discount where DiscountPercent=? and StartTime=? and EndTime=?";
    int exist = -1;
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, discountPercent);
        ps.setTimestamp(2,Timestamp.valueOf(startTime));
        ps.setTimestamp(3,Timestamp.valueOf(endTime));
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            exist = rs.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return exist;
}
    public void  modifyDiscount(int discountPercent, int productID, LocalDateTime startTime, LocalDateTime endTime){
        int discountID = checkExistPercent(discountPercent, startTime, endTime);

        int insertedKey = 0;
        String sql ="";
        if (discountID >=0){
            sql = "update Product set DiscountID=? where ProductID=?";
            try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, discountID);
                ps.setInt(2, productID);
                ps.executeUpdate();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        else {
            sql = "insert into Discount values(?,?,?)";
            try {

                PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, discountPercent);

                // Chuyển LocalDateTime thành Timestamp để lưu vào cơ sở dữ liệu
                Timestamp startTimestamp = Timestamp.valueOf(startTime);
                Timestamp endTimestamp = Timestamp.valueOf(endTime);

                ps.setTimestamp(2, startTimestamp);
                ps.setTimestamp(3, endTimestamp);
                ps.executeUpdate();
                if (ps.getGeneratedKeys().next()){
                    insertedKey = ps.getGeneratedKeys().getInt(1);
                }
            }catch (Exception e) {
                e.printStackTrace();
            }

            sql = "update Product set DiscountID=? where ProductID=?";
            try {
                PreparedStatement   ps = connection.prepareStatement(sql);
                ps.setInt(1, insertedKey);
                ps.setInt(2, productID);
                ps.executeUpdate();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteDiscount(int discountID){
        String sql = "delete from Discount where DiscountID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, discountID);
            ps.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
       DiscountDAO dd=new DiscountDAO();
       dd.deleteDiscount(12);
    }
}
