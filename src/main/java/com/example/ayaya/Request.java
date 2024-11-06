package com.example.ayaya;
import javafx.beans.property.*;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class Request {
    private SimpleIntegerProperty requestID;
    private SimpleStringProperty startDate;
    private SimpleStringProperty homeTechType;
    private SimpleStringProperty homeTechModel;
    private SimpleStringProperty problemDescryption;
    private SimpleStringProperty requestStatus;
    private SimpleStringProperty completionDate;
    private SimpleStringProperty repairParts;
    private SimpleIntegerProperty masterID;
    private SimpleIntegerProperty clientID;

    Request(int requestID, String startDate, String homeTechType, String homeTechModel, String problemDescryption, String requestStatus, String completionDate, String repairParts, int masterID, int clientID){
        this.requestID = new SimpleIntegerProperty(requestID);
        this.startDate = new SimpleStringProperty(startDate);
        this.homeTechType = new SimpleStringProperty(homeTechType);
        this.homeTechModel = new SimpleStringProperty(homeTechModel);
        this.problemDescryption = new SimpleStringProperty(problemDescryption);
        this.requestStatus = new SimpleStringProperty(requestStatus);
        this.completionDate = new SimpleStringProperty(completionDate);
        this.repairParts = new SimpleStringProperty(repairParts);
        this.masterID = new SimpleIntegerProperty(masterID);
        this.clientID = new SimpleIntegerProperty(clientID);
    }

    public String getStartDate() {
        return startDate.get();
    }

    public SimpleStringProperty startDateProperty() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate.set(startDate);
    }

    public String getHomeTechType() {
        return homeTechType.get();
    }

    public SimpleStringProperty homeTechTypeProperty() {
        return homeTechType;
    }

    public void setHomeTechType(String homeTechType) {
        this.homeTechType.set(homeTechType);
    }

    public String getHomeTechModel() {
        return homeTechModel.get();
    }

    public SimpleStringProperty homeTechModelProperty() {
        return homeTechModel;
    }

    public void setHomeTechModel(String homeTechModel) {
        this.homeTechModel.set(homeTechModel);
    }

    public String getProblemDescryption() {
        return problemDescryption.get();
    }

    public SimpleStringProperty problemDescryptionProperty() {
        return problemDescryption;
    }

    public void setProblemDescryption(String problemDescryption) {
        this.problemDescryption.set(problemDescryption);
    }

    public String getRequestStatus() {
        return requestStatus.get();
    }

    public SimpleStringProperty requestStatusProperty() {
        return requestStatus;
    }

    public void setRequestStatus(String requestStatus) {
        this.requestStatus.set(requestStatus);
    }

    public String getCompletionDate() {
        return completionDate.get();
    }

    public SimpleStringProperty completionDateProperty() {
        return completionDate;
    }

    public void setCompletionDate(String completionDate) {
        this.completionDate.set(completionDate);
    }

    public String getRepairParts() {
        return repairParts.get();
    }

    public SimpleStringProperty repairPartsProperty() {
        return repairParts;
    }

    public void setRepairParts(String repairParts) {
        this.repairParts.set(repairParts);
    }

    public int getMasterID() {
        return masterID.get();
    }

    public SimpleIntegerProperty masterIDProperty() {
        return masterID;
    }

    public void setMasterID(int masterID) {
        this.masterID.set(masterID);
    }

    public int getClientID() {
        return clientID.get();
    }

    public SimpleIntegerProperty clientIDProperty() {
        return clientID;
    }

    public void setClientID(int clientID) {
        this.clientID.set(clientID);
    }

    public int getRequestID() {
        return requestID.get();
    }

    public SimpleIntegerProperty requestIDProperty() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID.set(requestID);
    }

//    public String getName(){ return name.get();}
//    public void setName(String value){ name.set(value);}
//
//    public int getAge(){ return age.get();}
//    public void setAge(int value){ age.set(value);}
}
