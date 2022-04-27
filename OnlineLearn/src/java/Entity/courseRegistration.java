/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class courseRegistration {
    private int id;
    private int course_id;
    private String name;
    private String email;
    private String phone;
    private Date registration_time;
    private float total_cost;
    private int status;

    public courseRegistration() {
    }

    public courseRegistration(int id, int course_id, String name, String email, String phone, Date registration_time, float total_cost, int status) {
        this.id = id;
        this.course_id = course_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.registration_time = registration_time;
        this.total_cost = total_cost;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getRegistration_time() {
        return registration_time;
    }

    public void setRegistration_time(Date registration_time) {
        this.registration_time = registration_time;
    }

    public float getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(float total_cost) {
        this.total_cost = total_cost;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CourseRegistration{" + "id=" + id + ", course_id=" + course_id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", registration_time=" + registration_time + ", total_cost=" + total_cost + ", status=" + status + '}';
    }
    
    
}
