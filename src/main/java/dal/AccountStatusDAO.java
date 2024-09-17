package dal;

import model.ContactInformation;
import model.Status;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountStatusDAO extends StatusDAO{
    private final String table = "AccountStatus";
    public int addStatus(Status status){
        return super.addStatus(status,table);
    }

    public Status getStatusByStatusID(Integer statusID){
        return super.getStatusByStatusID(statusID, table);
    }
}
