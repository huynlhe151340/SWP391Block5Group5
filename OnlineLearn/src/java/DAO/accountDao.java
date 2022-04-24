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
import java.util.ArrayList;
import java.util.List;

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

    public boolean changePassword(String newPassword, int id) {

        int check = 0;
        String sql = "UPDATE accounts SET password= ? WHERE id= ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, newPassword);
            ps.setObject(2, id);

            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check > 0;
    }

    // update
    public boolean update_code_status(String code, int status, String email) {

        String sql = "UPDATE accounts SET active_code=?,status=? WHERE email=?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, code);
            ps.setObject(2, status);
            ps.setObject(3, email);

            int check = ps.executeUpdate();
            if (check > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean update_pass(String pass, String email) {

        String sql = "UPDATE accounts SET password=? WHERE email=?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, pass);
            ps.setObject(2, email);

            int check = ps.executeUpdate();
            if (check > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<accounts> getAllAccount() {

        List<accounts> list = new ArrayList<>();
        accountDetailDao accountDetailDao = new accountDetailDao();
        String sql = "SELECT * FROM accounts";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                accounts ac = new accounts(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("account_detailID"),
                        rs.getInt("role_id"),
                        rs.getInt("status"),
                        rs.getDate("create_date"),
                        rs.getString("active_code"));
                accountDetails accountDetail = accountDetailDao.getOne(ac.getAccountDetailID());
                if(accountDetail != null){
                    ac.setAccountDetail(accountDetail);
                }
                list.add(ac);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int countTotalAccount() {
        return getAllAccount().size();
    }

    public List<accounts> getAccountPerPage(int pageIndex, int numberProduct) {
        List<accounts> ls = new ArrayList<>();
        String sql = "SELECT * FROM accounts ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROW ONLY";

        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, pageIndex);
            ps.setObject(2, numberProduct);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                accounts ac = new accounts(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("account_detailID"),
                        rs.getInt("role_id"),
                        rs.getInt("status"),
                        rs.getDate("create_date"),
                        rs.getString("active_code"));
                ls.add(ac);
            }
            return ls;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean updateStatus(int status, int id) {
        int check = 0;
        String sql = "UPDATE accounts SET status= ? WHERE id= ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, status);
            ps.setObject(2, id);

            check = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public static void main(String[] args) {
        ArrayList<accounts> listAccount = (ArrayList<accounts>) new accountDao().getAllAccount();
        for (accounts object : listAccount) {
            System.out.println(object.getAccountDetail());
        }
    }
}
