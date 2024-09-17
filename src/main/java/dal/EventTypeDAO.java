package dal;

import model.AccountLog;
import model.EventType;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventTypeDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new EventType(rs.getInt("EventTypeID"), rs.getString("Detail"));
    }

    public ArrayList<EventType> getAllEventType(){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from EventType");
            ArrayList<EventType> list = new ArrayList<EventType>();
            for(Object ob:getListObjectBySQL(ps)){
                list.add((EventType)ob);
            }
            return list;
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public EventType getEventTypeByEventID(int evenTypeID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from EventType where EventTypeID=?");
            ps.setInt(1, evenTypeID);
            return (EventType)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
