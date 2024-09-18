package controller;
import java.io.IOException;
import dal.ContactInformationDAO;
import model.ContactInformation;
public class test {
    public static void main(String[] args) {
        // Create an instance of ContactInformationDAO
        ContactInformationDAO contactinfoDAO = new ContactInformationDAO();

        // Insert a test record (make sure this record exists in the database)
        String testAddress = "Test Address";
        String testPhoneNumber = "1234567890";

        // Retrieve ContactInformationID using the test record
        String contactInfoID = contactinfoDAO.getContactInformationIDbyAddressAndPhone(testAddress, testPhoneNumber);
        System.out.println("Retrieved ContactInformationID: " + contactInfoID);
    }
}
