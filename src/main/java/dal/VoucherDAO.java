package dal;

import dto.VoucherResponse;
import model.Voucher;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Vector;

public class VoucherDAO extends DBContext {
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
//        return new Discount(rs.getObject("DiscountID",Integer.class),rs.getObject("DiscountPercent",Integer.class),rs.getObject("St"))
        return null;
    }

    public int checkExistPercent(int discountPercent, LocalDateTime startTime, LocalDateTime endTime) {
        String sql = "select * from Discount where DiscountPercent=? and StartTime=? and EndTime=?";
        int exist = -1;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, discountPercent);
            ps.setTimestamp(2, Timestamp.valueOf(startTime));
            ps.setTimestamp(3, Timestamp.valueOf(endTime));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                exist = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exist;
    }


    public void addVoucher(Voucher voucher) {
        String sql = "INSERT INTO [dbo].[Voucher]\n" +
                "           ([DiscountID]\n" +
                "           ,[Quantity]\n" +
                "           ,[Inventory])\n" +
                "     VALUES\n" +
                "           (?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, voucher.getDiscountID());
            st.setInt(2, voucher.getQuantity());
            st.setInt(3, voucher.getInventory());
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public void updateQuantityVoucher(int voucherID, int quantity) {
        String sql = "UPDATE [dbo].[Voucher]\n" +
                "   SET\n" +
                "      [Quantity] =?\n" +
                "      \n" +
                " WHERE VoucherID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, voucherID);
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<VoucherResponse> getListVoucher() {
        List<VoucherResponse> res = new Vector<VoucherResponse>();
        String sql = "select v.VoucherID,d.DiscountID,d.[DiscountPercent],d.StartTime,d.EndTime,v.Quantity,v.Inventory\n" +
                "from Voucher v left join Discount d on v.DiscountID = d.DiscountID";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Lấy các giá trị thời gian bằng Timestamp và chuyển sang LocalDateTime
                Timestamp startTimestamp = rs.getTimestamp(4); // Lấy giá trị StartTime
                LocalDateTime startTime = startTimestamp != null ? startTimestamp.toLocalDateTime() : null;

                Timestamp endTimestamp = rs.getTimestamp(5); // Lấy giá trị EndTime
                LocalDateTime endTime = endTimestamp != null ? endTimestamp.toLocalDateTime() : null;
                res.add(new VoucherResponse(rs.getInt(1)
                        , rs.getInt(2)
                        , rs.getInt(3)
                        , startTime
                        , endTime
                        , rs.getInt(6)
                        , rs.getInt(7)));
            }
            return res;
        } catch (Exception e) {
            e.printStackTrace();
        }


        return null;
    }

    public VoucherResponse getVoucher(int voucherID) {
        String sql = "select v.VoucherID,d.DiscountID,d.[DiscountPercent],d.StartTime,d.EndTime,v.Quantity,v.Inventory \n" +
                "                from Voucher v left join Discount d on v.DiscountID = d.DiscountID where v.VoucherID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, voucherID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                VoucherResponse voucherResponse = new VoucherResponse();
                Timestamp startTimestamp = rs.getTimestamp(4);
                LocalDateTime startTime = startTimestamp != null ? startTimestamp.toLocalDateTime() : null;

                Timestamp endTimestamp = rs.getTimestamp(5);
                LocalDateTime endTime = endTimestamp != null ? endTimestamp.toLocalDateTime() : null;


                voucherResponse.setVoucherID(rs.getInt(1));
                voucherResponse.setDiscountID(rs.getInt(2));
                voucherResponse.setDiscountPercent(rs.getInt(3));
                voucherResponse.setStartTime(startTime);
                voucherResponse.setEndTime(endTime);
                voucherResponse.setQuantity(rs.getInt(6));
                voucherResponse.setInventory(rs.getInt(7));


                return voucherResponse;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }


    public static void main(String[] args) {
        VoucherDAO dao = new VoucherDAO();
        VoucherResponse voucher = dao.getVoucher(1);
        System.out.println(voucher);

    }
}
