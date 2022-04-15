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
    private int categoryID;
    private int feature;
    private int ownerID;
    private int status;
    private String description;
    private int packageID;

    public course() {
    }

    public course(int id, String name, String thumbnail, int categoryID, int feature, int ownerID, int status, String description, int packageID) {
        this.id = id;
        this.name = name;
        this.thumbnail = thumbnail;
        this.categoryID = categoryID;
        this.feature = feature;
        this.ownerID = ownerID;
        this.status = status;
        this.description = description;
        this.packageID = packageID;
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

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getFeature() {
        return feature;
    }

    public void setFeature(int feature) {
        this.feature = feature;
    }

    public int getOwnerID() {
        return ownerID;
    }

    public void setOwnerID(int ownerID) {
        this.ownerID = ownerID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPackageID() {
        return packageID;
    }

    public void setPackageID(int packageID) {
        this.packageID = packageID;
    }

    @Override
    public String toString() {
        return "subject{" + "id=" + id + ", name=" + name + ", thumbnail=" + thumbnail + ", categoryID=" + categoryID + ", feature=" + feature + ", ownerID=" + ownerID + ", status=" + status + ", description=" + description + ", packageID=" + packageID + '}';
    }
    
}
