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
public class lessons {
    
    private int id;
    private String title;
    private String belongingTopic;
    private String content;
    private String videoLink;
    private String type;
    private int status;
    private int subjectID;

    public lessons() {
    }

    public lessons(int id, String title, String belongingTopic, String content, String videoLink, String type, int status, int subjectID) {
        this.id = id;
        this.title = title;
        this.belongingTopic = belongingTopic;
        this.content = content;
        this.videoLink = videoLink;
        this.type = type;
        this.status = status;
        this.subjectID = subjectID;
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

    public String getBelongingTopic() {
        return belongingTopic;
    }

    public void setBelongingTopic(String belongingTopic) {
        this.belongingTopic = belongingTopic;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getVideoLink() {
        return videoLink;
    }

    public void setVideoLink(String videoLink) {
        this.videoLink = videoLink;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    @Override
    public String toString() {
        return "lessons{" + "id=" + id + ", title=" + title + ", belongingTopic=" + belongingTopic + ", content=" + content + ", videoLink=" + videoLink + ", type=" + type + ", status=" + status + ", subjectID=" + subjectID + '}';
    }
    
}
