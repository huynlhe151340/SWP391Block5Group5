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
    private int subjectID;
    private int lessonID;
    private int status;
    private String content;
    private String media;
    private String answerOption;
    private String explanation;

    public question() {
    }

    public question(int id, int subjectID, int lessonID, int status, String content, String media, String answerOption, String explanation) {
        this.id = id;
        this.subjectID = subjectID;
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

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
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
        return "question{" + "id=" + id + ", subjectID=" + subjectID + ", lessonID=" + lessonID + ", status=" + status + ", content=" + content + ", media=" + media + ", answerOption=" + answerOption + ", explanation=" + explanation + '}';
    }
    
}
