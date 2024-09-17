
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.PreparedStatement;

public abstract class DBContext {

    protected Connection connection;

    protected DBContext() {
        // Edit URL , username, password to authenticate with your MS SQL Server
        String username = "sa", password = "123", port="1433", dataBaseName="SalesManagement", url = "jdbc:sqlserver://localhost:"+port+";databaseName= "+dataBaseName;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    
    protected int executeUpdate(PreparedStatement ps){
        try {
            return ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return 0;
        }
    }

    protected Object getObjectBySQL(PreparedStatement ps){
        try {
            ResultSet rs = ps.executeQuery();
            if(rs.next()) return getObjectByRs(rs);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    protected ArrayList<Object> getListObjectBySQL(PreparedStatement ps){
        try {
            ResultSet rs = ps.executeQuery();
            ArrayList<Object> objects = new ArrayList<>();
            while(rs.next()){
                objects.add(getObjectByRs(rs));
            }
            return objects;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    protected abstract Object getObjectByRs(ResultSet rs) throws Exception;
}