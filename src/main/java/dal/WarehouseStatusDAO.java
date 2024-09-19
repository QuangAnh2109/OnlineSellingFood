package dal;

public class WarehouseStatusDAO extends StatusDAO{
    private final String table = "WarehouseStatus";
    public int addStatus(Status status){
        return super.addStatus(status,table);
    }

    public Status getStatusByStatusID(Integer statusID){
        return super.getStatusByStatusID(statusID, table);
    }
}
