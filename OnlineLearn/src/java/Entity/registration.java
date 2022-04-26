/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author khait
 */
public class registration {
    
    private int id;
    private int accountID;
    private int courseID;
    private Date registrationTime;
    private double totalCost;
    private int status;
    private Date validFrom;
    private Date validTo;
    accounts account;
    course course;

    public registration() {
    }

    public registration(int id, int accountID, int courseID, Date registrationTime, double totalCost, int status, Date validFrom, Date validTo) {
        this.id = id;
        this.accountID = accountID;
        this.courseID = courseID;
        this.registrationTime = registrationTime;
        this.totalCost = totalCost;
        this.status = status;
        this.validFrom = validFrom;
        this.validTo = validTo;
    }
//<<<<<<< HEAD
    
        public registration(int id, accounts account, course course, Date registrationTime, double totalCost, int status, Date validFrom, Date validTo) {
        this.id = id;
        this.account = account;
        this.course = course;
        this.registrationTime = registrationTime;
        this.totalCost = totalCost;
        this.status = status;
        this.validFrom = validFrom;
        this.validTo = validTo;
        }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public Date getRegistrationTime() {
        return registrationTime;
    }

    public void setRegistrationTime(Date registrationTime) {
        this.registrationTime = registrationTime;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getValidFrom() {
        return validFrom;
    }

    public void setValidFrom(Date validFrom) {
        this.validFrom = validFrom;
    }

    public Date getValidTo() {
        return validTo;
    }

    public void setValidTo(Date validTo) {
        this.validTo = validTo;
    }

    public accounts getAccount() {
        return account;
    }

    public course getCourse() {
        return course;
    }
    

    @Override
    public String toString() {
        return "registration{" + "id=" + id + ", accountID=" + accountID + ", courseID=" + courseID + ", registrationTime=" + registrationTime + ", totalCost=" + totalCost + ", status=" + status + ", validFrom=" + validFrom + ", validTo=" + validTo + '}';
    }

}
