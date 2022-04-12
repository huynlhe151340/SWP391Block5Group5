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
public class teachers {
    
    private int id;
    private String name;
    private int universityID;
    private int status;

    public teachers() {
    }

    public teachers(int id, String name, int universityID, int status) {
        this.id = id;
        this.name = name;
        this.universityID = universityID;
        this.status = status;
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

    public int getUniversityID() {
        return universityID;
    }

    public void setUniversityID(int universityID) {
        this.universityID = universityID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "teachers{" + "id=" + id + ", name=" + name + ", universityID=" + universityID + ", status=" + status + '}';
    }
    
}
