/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author khait
 */
public class lessons {
    
    private int id;
    private int accountID;
    private int orderID;
    private int complete;
    private int status;

    public lessons() {
    }

    public lessons(int id, int accountID, int orderID, int complete, int status) {
        this.id = id;
        this.accountID = accountID;
        this.orderID = orderID;
        this.complete = complete;
        this.status = status;
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

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getComplete() {
        return complete;
    }

    public void setComplete(int complete) {
        this.complete = complete;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "lessons{" + "id=" + id + ", accountID=" + accountID + ", orderID=" + orderID + ", complete=" + complete + ", status=" + status + '}';
    }
    
}
