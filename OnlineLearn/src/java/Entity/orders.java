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
public class orders {
    
    private int id;
    private int courseID;
    private int accountID;
    private double totalPrice;
    private Date createDate;
    private int status;

    public orders() {
    }

    public orders(int id, int courseID, int accountID, double totalPrice, Date createDate, int status) {
        this.id = id;
        this.courseID = courseID;
        this.accountID = accountID;
        this.totalPrice = totalPrice;
        this.createDate = createDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "orders{" + "id=" + id + ", courseID=" + courseID + ", accountID=" + accountID + ", totalPrice=" + totalPrice + ", createDate=" + createDate + ", status=" + status + '}';
    }
    
    
}
