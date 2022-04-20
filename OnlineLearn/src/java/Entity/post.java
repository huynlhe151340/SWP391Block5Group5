/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author khait
 */
public class post {
    
    private int id;
    private String title;
    private String author;
    private Date updateDate;
    private int categoryID;
    private String postDetail;
    private String image;
    private int status;

    public post() {
    }

    public post(int id, String title, String author, Date updateDate, int categoryID, String postDetail, String image, int status) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.updateDate = updateDate;
        this.categoryID = categoryID;
        this.postDetail = postDetail;
        this.image = image;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getPostDetail() {
        return postDetail;
    }

    public void setPostDetail(String postDetail) {
        this.postDetail = postDetail;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "post{" + "id=" + id + ", title=" + title + ", author=" + author + ", updateDate=" + updateDate + ", categoryID=" + categoryID + ", postDetail=" + postDetail + ", image=" + image + ", status=" + status + '}';
    }

}