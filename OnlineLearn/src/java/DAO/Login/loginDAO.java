/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Login;

import Entity.accountDetails;
import Entity.accounts;
import JDBC.SQLServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author ADMIN
 */
public class loginDAO {
     private static Connection con = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;
    
    public static boolean isHaveEmail(String email) throws SQLException {

        String query = "select email from accounts where email = ?";
        String user = null;
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                stm = con.prepareStatement(query);
                stm.setString(1, email);

                rs = stm.executeQuery();
                if (rs.next()) {
                    user = rs.getString(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return user != null;
    }

    public static boolean checkPassword(String email, String password) throws SQLException {
        String query = "select password from accounts where email = ?";
        String pass = null;
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                stm = con.prepareStatement(query);
                stm.setString(1, email);

                rs = stm.executeQuery();
                if (rs.next()) {
                    pass = rs.getString(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return BCrypt.checkpw(password, pass);
    }
    
    public static accounts getAccountByEmail(String email) throws SQLException {

        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                String sql = "select * from accounts where email = ?";
                accounts account = new accounts();
                stm = con.prepareStatement(sql);
                stm.setString(1, email);

                rs = stm.executeQuery();
                while (rs.next()) {
                    account = new accounts(rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getInt("account_detailID"),
                            rs.getInt("role_id"),
                            rs.getInt("status"),
                            rs.getDate("create_date"),
                            rs.getString("active_code"));
                }
                accountDetails accountDetail = getAccountDetailsByID(account.getAccountDetailID());
                if(accountDetail != null){
                    account.setAccountDetail(accountDetail);
                }
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return null;
    }
     public static accountDetails getAccountDetailsByID(int account_detailID) throws SQLException {

        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                String sql = "select * from accountDetail where id = ?";

                stm = con.prepareStatement(sql);
                stm.setInt(1, account_detailID);

                rs = stm.executeQuery();
                while (rs.next()) {
                    return new accountDetails(rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("mobile"),
                            rs.getString("address"),
                            rs.getBoolean("gender"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return null;
    }
    
    public static void main(String[] args) throws SQLException {
//        System.out.println(isHaveEmail("a"));
<<<<<<< HEAD
System.out.println(checkPassword("khaitqhe141672@fpt.edu.v", "123456789"));
=======

//System.out.println(checkPassword("khaitqhe141672@fpt.edu.v", "123456789"));

//System.out.println(checkPassword("admin", "admin"));

>>>>>>> 31596ee034fa9abceae66eb82faa8a264a7798d1
//System.out.println(getAccountByEmail("huynlhe151340@fpt.edu.vn"));
//System.out.println(getAccountDetailsByID(1));
    }
}
