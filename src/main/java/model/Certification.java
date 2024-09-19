package model;

import java.time.LocalDateTime;

public class Certification {
    private int certificationID, certificateIssuerID;
    private String name, detail;
    private LocalDateTime time;

    public Certification() {
    }

    public Certification(int certificationID, int certificateIssuerID, String name, String detail, LocalDateTime time) {
        this.certificationID = certificationID;
        this.certificateIssuerID = certificateIssuerID;
        this.name = name;
        this.detail = detail;
        this.time = time;
    }

    public int getCertificationID() {
        return certificationID;
    }

    public void setCertificationID(int certificationID) {
        this.certificationID = certificationID;
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

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }
}
