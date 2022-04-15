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
    private int courseID;
    private int type;
    private int level;
    private String duration;
    private int status;

    public quiz() {
    }

    public quiz(int id, String name, int courseID, int type, int level, String duration, int status) {
        this.id = id;
        this.name = name;
        this.courseID = courseID;
        this.type = type;
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

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
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
        return "quiz{" + "id=" + id + ", name=" + name + ", courseID=" + courseID + ", type=" + type + ", level=" + level + ", duration=" + duration + ", status=" + status + '}';
    }

}
