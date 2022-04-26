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
public class accounts {
    
    private int id;
    private String email;
    private String password;
    private int accountDetailID;
    private int roleID;
    private int status;
    private Date createDate;
    private String activeCode;

    public accounts() {
    }

    public accounts(int id, String email) {
        this.id = id;
        this.email = email;
    }
    
    public accounts(int id, String email, String password, int accountDetailID, int roleID, int status, Date createDate, String activeCode) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.accountDetailID = accountDetailID;
        this.roleID = roleID;
        this.status = status;
        this.createDate = createDate;
        this.activeCode = activeCode;
    }

    public accounts(String email, String password, int accountDetailID, int roleID, int status, String activeCode) {
        this.email = email;
        this.password = password;
        this.accountDetailID = accountDetailID;
        this.roleID = roleID;
        this.status = status;
        this.activeCode = activeCode;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAccountDetailID() {
        return accountDetailID;
    }

    public void setAccountDetailID(int accountDetailID) {
        this.accountDetailID = accountDetailID;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "accounts{" + "id=" + id + ", email=" + email + ", password=" + password + ", accountDetailID=" + accountDetailID + ", roleID=" + roleID + ", status=" + status + ", createDate=" + createDate + ", activeCode=" + activeCode + '}';
    }

    public String getActiveCode() {
        return activeCode;
    }

    public void setActiveCode(String activeCode) {
        this.activeCode = activeCode;
    }
    private accountDetails accountDetail;

    public accounts(int id, String email, String password, int accountDetailID, int roleID, int status, Date createDate, String activeCode, accountDetails accountDetail) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.accountDetailID = accountDetailID;
        this.roleID = roleID;
        this.status = status;
        this.createDate = createDate;
        this.activeCode = activeCode;
        this.accountDetail = accountDetail;
    }

    public accountDetails getAccountDetail() {
        return accountDetail;
    }

    public void setAccountDetail(accountDetails accountDetail) {
        this.accountDetail = accountDetail;
    }

    public accounts(String email, String password, int accountDetailID, int roleID, int status) {
        this.email = email;
        this.password = password;
        this.accountDetailID = accountDetailID;
        this.roleID = roleID;
        this.status = status;
    }
}
