
package dal;

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
        } catch (Exception ex) {
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
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    protected void insertStatement(Integer ob, PreparedStatement ps, int index) throws SQLException {
        if(ob==null) ps.setNull(index, Types.INTEGER);
        else ps.setInt(index, ob);
    }

    //type true for varchar, false for nvarchar
    protected void insertStatement(String ob, PreparedStatement ps, int index, boolean type) throws SQLException {
        if(ob==null) ps.setNull(index,Types.NVARCHAR);
        else{
            if(type) ps.setString(index, ob);
            else ps.setNString(index, ob);
        }
    }

    protected abstract Object getObjectByRs(ResultSet rs) throws Exception;
}