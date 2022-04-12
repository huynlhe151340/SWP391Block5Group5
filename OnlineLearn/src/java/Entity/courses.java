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
public class courses {
    
    private int id;
    private String name;
    private double price;
    private String description;
    private String image;
    private String note;
    private int status;
    private int teacerID;

    public courses() {
    }

    public courses(int id, String name, double price, String description, String image, String note, int status, int teacerID) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
        this.note = note;
        this.status = status;
        this.teacerID = teacerID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public int getTeacerID() {
        return teacerID;
    }

    public void setTeacerID(int teacerID) {
        this.teacerID = teacerID;
    }

    @Override
    public String toString() {
        return "courses{" + "id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + ", image=" + image + ", note=" + note + ", status=" + status + ", teacerID=" + teacerID + '}';
    }
    
   
}
