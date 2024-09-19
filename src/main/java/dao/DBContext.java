
package dao;

import java.sql.*;
import java.util.ArrayList;

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

    protected ResultSet executeUpdate(PreparedStatement ps){
        try {
            ps.executeUpdate();
            return ps.getGeneratedKeys();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    protected Object getObject(PreparedStatement ps){
        try {
            ResultSet rs = ps.executeQuery();
            if(rs.next()) return getObjectByRs(rs);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    protected ArrayList<Object> getListObject(PreparedStatement ps){
        try {
            ResultSet rs = ps.executeQuery();
            ArrayList<Object> objects = new ArrayList<>();
            while(rs.next()){
                objects.add(getObjectByRs(rs));
            }
            return objects;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    protected abstract Object getObjectByRs(ResultSet rs) throws Exception;
}