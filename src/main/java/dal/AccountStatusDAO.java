package dal;

import model.Status;

public class AccountStatusDAO extends StatusDAO{
    private final String table = "AccountStatus";
    public int addStatus(Status status){
        return super.addStatus(status,table);
    }

    public Status getStatusByStatusID(Integer statusID){
        return super.getStatusByStatusID(statusID, table);
    }
}
