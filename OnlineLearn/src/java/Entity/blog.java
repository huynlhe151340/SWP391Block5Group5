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
public class blog {
    
    private int id;
    private String name;
    private String context;
    private Date createAt;

    public blog() {
    }

    public blog(int id, String name, String context, Date createAt) {
        this.id = id;
        this.name = name;
        this.context = context;
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

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "blogs{" + "id=" + id + ", name=" + name + ", context=" + context + ", createAt=" + createAt + '}';
    }
    
}
