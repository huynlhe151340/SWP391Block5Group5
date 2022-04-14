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
public class setting {
    
    private int id;
    private String type;
    private String value;
    private String note;
    private int status;
    private int orderID;

    public setting() {
    }

    public setting(int id, String type, String value, String note, int status, int orderID) {
        this.id = id;
        this.type = type;
        this.value = value;
        this.note = note;
        this.status = status;
        this.orderID = orderID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    @Override
    public String toString() {
        return "setting{" + "id=" + id + ", type=" + type + ", value=" + value + ", note=" + note + ", status=" + status + ", orderID=" + orderID + '}';
    }
    
}
