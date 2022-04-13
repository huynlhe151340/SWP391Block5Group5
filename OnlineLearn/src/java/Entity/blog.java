/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author AD
 */
public class blog {
    private int id;
    private String name;
    private String content;
    private Date createAt;

    public blog() {
    }

    public blog(int id, String name, String content, Date createAt) {
        this.id = id;
        this.name = name;
        this.content = content;
        this.createAt = createAt;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "blog{" + "id=" + id + ", name=" + name + ", content=" + content + ", createAt=" + createAt + '}';
    }
}
