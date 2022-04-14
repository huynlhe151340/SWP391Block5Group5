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
public class quiz {
    
    private int id;
    private String name;
    private int subjectID;
    private int typeID;
    private int level;
    private String duration;
    private int status;

    public quiz() {
    }

    public quiz(int id, String name, int subjectID, int typeID, int level, String duration, int status) {
        this.id = id;
        this.name = name;
        this.subjectID = subjectID;
        this.typeID = typeID;
        this.level = level;
        this.duration = duration;
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

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "quiz{" + "id=" + id + ", name=" + name + ", subjectID=" + subjectID + ", typeID=" + typeID + ", level=" + level + ", duration=" + duration + ", status=" + status + '}';
    }
    
}
