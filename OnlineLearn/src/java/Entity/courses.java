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
    private int lectures;
    private int duration;
    private int skillLevel;
    private String language;
    private int teacerID;

    public courses() {
    }

    public courses(int id, String name, double price, String description, String image, String note, int status, int lectures, int duration, int skillLevel, String language, int teacerID) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
        this.note = note;
        this.status = status;
        this.lectures = lectures;
        this.duration = duration;
        this.skillLevel = skillLevel;
        this.language = language;
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

    public int getLectures() {
        return lectures;
    }

    public void setLectures(int lectures) {
        this.lectures = lectures;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getSkillLevel() {
        return skillLevel;
    }

    public void setSkillLevel(int skillLevel) {
        this.skillLevel = skillLevel;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getTeacerID() {
        return teacerID;
    }

    public void setTeacerID(int teacerID) {
        this.teacerID = teacerID;
    }
    
}
