package dal;

import model.AccountStatus;
import model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new AccountStatus(rs.getInt("StatusID"),rs.getString("Detail"));
    }
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT CategoryID, Name FROM Category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            for (Object obj : rs) {
                categories.add((Category) obj);
            }
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
        }
        return categories;
    }


}
