/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.accountDetails;
import Entity.accounts;
import JDBC.SQLServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author khait
 */
public class accountDetailDao {

    public accountDetails getOne(int id) {

        String sql = "SELECT * FROM accountDetail WHERE id= ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                accountDetails ac = new accountDetails(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("mobile"),
                        rs.getString("address"),
                        rs.getBoolean("gender"));
                return ac;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int insert(accountDetails acDetails) {

        String sql = "INSERT INTO accountDetail (name, mobile, address, gender) VALUES (?, ?, ?, ?)";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setObject(1, acDetails.getName());
            ps.setObject(2, acDetails.getMobile());
            ps.setObject(3, acDetails.getAddress());
            ps.setObject(4, acDetails.isGender());
            int check = ps.executeUpdate();
            if(check > 0){
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public boolean remove(int id){
        
        int check = 0;
        String sql = "DELETE FROM accountDetail WHERE id= ?";
        try(Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, id);
            
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check > 0;
    }
    
    public boolean editProfile(accountDetails d, int id){
        
        int check = 0;
        String sql = "UPDATE accountDetail SET name= ?, mobile= ?,"
                + " address= ?, gender= ? WHERE id= ?";
        try(Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, d.getName());
            ps.setObject(2, d.getMobile());
            ps.setObject(3, d.getAddress());
            ps.setObject(4, d.isGender());
            ps.setObject(5, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check > 0;
    }
    
    public static void main(String[] args) {
        accounts ac = new accountDao().getOne(3);
        accountDetails acd = new accountDetailDao().getOne(ac.getAccountDetailID());
        System.out.println(acd.toString());
    }
}
