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
public class accountDetails {
    
    private int id;
    private String name;
    private String mobile;
    private String address;
    private boolean gender;

    public accountDetails() {
    }

    public accountDetails(int id, String name, String mobile, String address, boolean gender) {
        this.id = id;
        this.name = name;
        this.mobile = mobile;
        this.address = address;
        this.gender = gender;
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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "accountDetails{" + "id=" + id + ", name=" + name + ", mobile=" + mobile + ", address=" + address + ", gender=" + gender + '}';
    }
    
}
