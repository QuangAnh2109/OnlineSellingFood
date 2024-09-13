
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

public abstract class DBContext {

    protected Connection connection;

    protected DBContext() {
        // Edit URL , username, password to authenticate with your MS SQL Server
        String username = "sa", password = "123456", port="1433", dataBaseName="SalesManagement", url = "jdbc:sqlserver://localhost:"+port+";databaseName= "+dataBaseName;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    
    protected int executeUpdate(String sql){
        try {
            return connection.prepareStatement(sql).executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return 0;
        }
    }

    protected Object getSQL(String sql){
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            if(rs.next()) return getRs(rs);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    protected ArrayList<Object> getListSQL(String sql){
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            ArrayList<Object> objects = new ArrayList<>();
            while(rs.next()){
                objects.add(getRs(rs));
            }
            return objects;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    protected abstract Object getRs(ResultSet rs) throws SQLException;
}