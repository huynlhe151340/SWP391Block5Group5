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
public class category {
    
    private int id;
    private String category;
    private int status;

    public category() {
    }

    public category(int id, String category, int status) {
        this.id = id;
        this.category = category;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "subjectCategory{" + "id=" + id + ", category=" + category + ", status=" + status + '}';
    }
    
}
