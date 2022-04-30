/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import Entity.post;
import Entity.registration;
import JDBC.SQLServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author khait
 */
public class registrationDao {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean createCourseRegister(registration currentCourseRegistration) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                String sql = "insert into registration(course_id, account_id, [registration_time], [total_cost], [status], valid_from, valid_to) values (?,?,?,?,?,?,?)";

                ps = con.prepareStatement(sql);
                ps.setInt(1, currentCourseRegistration.getCourseID());
                ps.setInt(2, currentCourseRegistration.getAccountID());
                ps.setDate(3, currentCourseRegistration.getRegistrationTime());
                ps.setDouble(4, currentCourseRegistration.getTotalCost());
                ps.setInt(5, currentCourseRegistration.getStatus());
                ps.setDate(6, currentCourseRegistration.getValidFrom());
                ps.setDate(7, currentCourseRegistration.getValidTo());
                int row = ps.executeUpdate();
                return row > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return false;
    }
    
    public boolean isBuyThisCourse(int course_id, int accountID) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                String sql = "select * from registration where course_id = ? and account_id = ?";

                ps = con.prepareStatement(sql);
                ps.setInt(1, course_id);
                ps.setInt(2, accountID);
                rs = ps.executeQuery();
                while(rs.next()){
                    return true;
                }
                return false;     
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    public static void main(String[] args) {
        registrationDao dao = new registrationDao();
        System.out.println( new java.sql.Date(System.currentTimeMillis()+ TimeUnit.DAYS.toMillis(30*6)));
//        System.out.println(System.currentTimeMillis()+TimeUnit.DAYS.toMillis(30*6));
//        System.out.println(TimeUnit.DAYS.toMillis(30*6));
//        System.out.println(dao.createCourseRegister(currentCourseRegistration));
    }
}
