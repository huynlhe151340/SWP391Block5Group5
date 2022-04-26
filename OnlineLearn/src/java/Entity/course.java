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
public class course {

    private int id;
    private String name;
    private String thumbnail;
    private category category;
    private int feature;
    private String owner;
    private String description;
    private float price;
    private float salePrice;
    private String duration;
    private String skillLevel;
    private String language;
    private int status;

    public course() {
    }

    public course(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public course(int id, String name, String thumbnail, category category, int feature, String owner, String description, float price, float salePrice, String duration, String skillLevel, String language, int status) {
        this.id = id;
        this.name = name;
        this.thumbnail = thumbnail;
        this.category = category;
        this.feature = feature;
        this.owner = owner;
        this.description = description;
        this.price = price;
        this.salePrice = salePrice;
        this.duration = duration;
        this.skillLevel = skillLevel;
        this.language = language;
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

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public category getCategory() {
        return category;
    }

    public void setCategory(category category) {
        this.category = category;
    }

    public int getFeature() {
        return feature;
    }

    public void setFeature(int feature) {
        this.feature = feature;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getSkillLevel() {
        return skillLevel;
    }

    public void setSkillLevel(String skillLevel) {
        this.skillLevel = skillLevel;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "course{" + "id=" + id + ", name=" + name + ", thumbnail=" + thumbnail + ", category=" + category + ", feature=" + feature + ", owner=" + owner + ", description=" + description + ", price=" + price + ", salePrice=" + salePrice + ", duration=" + duration + ", skillLevel=" + skillLevel + ", language=" + language + ", status=" + status + '}';
    }
}
