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
public class question {
    
    private int id;
    private int courseID;
    private int lessonID;
    private int status;
    private String content;
    private String media;
    private String answerOption;
    private String explanation;

    public question() {
    }

    public question(int id, int courseID, int lessonID, int status, String content, String media, String answerOption, String explanation) {
        this.id = id;
        this.courseID = courseID;
        this.lessonID = lessonID;
        this.status = status;
        this.content = content;
        this.media = media;
        this.answerOption = answerOption;
        this.explanation = explanation;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public int getLessonID() {
        return lessonID;
    }

    public void setLessonID(int lessonID) {
        this.lessonID = lessonID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }

    public String getAnswerOption() {
        return answerOption;
    }

    public void setAnswerOption(String answerOption) {
        this.answerOption = answerOption;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    @Override
    public String toString() {
        return "question{" + "id=" + id + ", courseID=" + courseID + ", lessonID=" + lessonID + ", status=" + status + ", content=" + content + ", media=" + media + ", answerOption=" + answerOption + ", explanation=" + explanation + '}';
    }

}
