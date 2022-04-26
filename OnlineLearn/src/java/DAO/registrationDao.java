/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.accountDetails;
import Entity.accounts;
import Entity.course;
import Entity.registration;
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
public class registrationDao {
    public List<registration> getAllRegistration() {

        List<registration> list = new ArrayList<>();
        String sql = "SELECT r.[id] ,r.[account_id] ,a.email ,r.[course_id] ,c.name ,r.[registration_time] ,r.[total_cost] ,r.[status] ,r.[valid_from] ,r.[valid_to] FROM [dbo].[registration] as r INNER JOIN accounts as a on r.account_id= a.id inner join courses as c on r.course_id=c.id";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                registration regis = new registration(
                        rs.getInt("id"),
                        new accounts(rs.getInt("account_id"), rs.getString("email")),
                        new course(rs.getInt("course_id"),rs.getString("name")),
                        rs.getDate("registration_time"),
                        rs.getDouble("total_cost"),
                        rs.getInt("status"),
                        rs.getDate("valid_from"),
                        rs.getDate("valid_to"));
                list.add(regis);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public int countTotalRegistration() {
        return getAllRegistration().size();
    }
    public List<registration> getRegistrationPerPage(int pageIndex, int numberProduct) {
        List<registration> list = new ArrayList<>();
        String sql = "SELECT r.[id] ,r.[account_id] ,a.email ,r.[course_id] ,c.name ,r.[registration_time] ,r.[total_cost] ,r.[status] ,r.[valid_from] ,r.[valid_to] FROM [dbo].[registration] as r INNER JOIN accounts as a on r.account_id= a.id inner join courses as c on r.course_id=c.id ORDER BY r.registration_time desc, id OFFSET ? ROWS FETCH NEXT ? ROW ONLY";

        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, pageIndex);
            ps.setObject(2, numberProduct);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                registration regis = new registration(
                        rs.getInt("id"),
                        new accounts(rs.getInt("account_id"), rs.getString("email")),
                        new course(rs.getInt("course_id"),rs.getString("name")),
                        rs.getDate("registration_time"),
                        rs.getDouble("total_cost"),
                        rs.getInt("status"),
                        rs.getDate("valid_from"),
                        rs.getDate("valid_to"));
                list.add(regis);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    public static void main(String[] args) {
        ArrayList<registration> listAccount = (ArrayList<registration>) new registrationDao().getRegistrationPerPage(0, 6);
        for (registration object : listAccount) {
            System.out.println(object);
            System.out.print(object.getAccount().getId());
            System.out.println(object.getCourse().getId());
        }
    }
}
