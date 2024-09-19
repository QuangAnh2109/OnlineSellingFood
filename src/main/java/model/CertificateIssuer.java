package model;

public class CertificateIssuer {
    private int certificateIssuerID;
    private String name, detail;

    public CertificateIssuer() {
    }

    public CertificateIssuer(int certificateIssuerID, String name, String detail) {
        this.certificateIssuerID = certificateIssuerID;
        this.name = name;
        this.detail = detail;
    }

    public int getCertificateIssuerID() {
        return certificateIssuerID;
    }

    public void setCertificateIssuerID(int certificateIssuerID) {
        this.certificateIssuerID = certificateIssuerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
