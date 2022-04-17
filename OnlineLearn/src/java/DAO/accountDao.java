/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.accounts;
import JDBC.SQLServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author khait
 */
public class accountDao {

    public boolean insert(accounts ac) {

        int check = 0;
        String sql = "INSERT INTO accounts (email, password, account_detailID, role_id, "
                + "status, active_code) VALUES (?,?,?,?,?,?)";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, ac.getEmail());
            ps.setObject(2, ac.getPassword());
            ps.setObject(3, ac.getAccountDetailID());
            ps.setObject(4, ac.getRoleID());
            ps.setObject(5, ac.getStatus());
            ps.setObject(6, ac.getActiveCode());

            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check > 0;
    }

    public boolean isCheckDuplicateEmail(String email) {

        String sql = "SELECT * FROM accounts WHERE email= ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareCall(sql)) {
            ps.setObject(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean activeAccount(int status, int accountId) {

        int check = 0;
        String sql = "UPDATE accounts SET status= ? WHERE id= ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, status);
            ps.setObject(2, accountId);

            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check > 0;
    }

    public accounts getAccountByEmail(String email) {

        String sql = "SELECT * FROM accounts WHERE email= ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                accounts ac = new accounts(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("account_detailID"),
                        rs.getInt("role_id"),
                        rs.getInt("status"),
                        rs.getDate("create_date"),
                        rs.getString("active_code"));
                return ac;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public accounts getOne(int id) {
        String sql = "SELECT * FROM accounts WHERE id= ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                accounts ac = new accounts(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("account_detailID"),
                        rs.getInt("role_id"),
                        rs.getInt("status"),
                        rs.getDate("create_date"),
                        rs.getString("active_code"));
                return ac;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean changePassword(String newPassword, int id){
        
        int check = 0;
        String sql = "UPDATE accounts SET password= ? WHERE id= ?";
        try(Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, newPassword);
            ps.setObject(2, id);
            
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check >0;
    }
}
