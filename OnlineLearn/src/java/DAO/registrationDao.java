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
                String sql = "insert into registration(course_id, name, email, phone, [registration_time], [total_cost], [status]) values (?,?,?,?,?,?,?)";

                ps = con.prepareStatement(sql);
                ps.setInt(1, currentCourseRegistration.getCourse_id());
                ps.setString(2, currentCourseRegistration.getName());
                ps.setString(3, currentCourseRegistration.getEmail());
                ps.setString(4, currentCourseRegistration.getPhone());
                ps.setDate(5, currentCourseRegistration.getRegistration_time());
                ps.setFloat(6, currentCourseRegistration.getTotal_cost());
                ps.setInt(7, currentCourseRegistration.getStatus());
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
    
    public boolean isBuyThisCourse(int course_id, String email) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                String sql = "select * from registration where course_id = ? and email = ?";

                ps = con.prepareStatement(sql);
                ps.setInt(1, course_id);
                ps.setString(2, email);
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
        
//        System.out.println(dao.createCourseRegister(currentCourseRegistration));
    }
}
