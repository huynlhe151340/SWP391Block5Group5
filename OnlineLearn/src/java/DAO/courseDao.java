/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.category;
import Entity.course;
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
public class courseDao {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<course> getAllCourses(int pageIndex, int pageSize) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT *,ct.name as category_name,ct.status as category_status "
                    + "FROM courses c JOIN category ct ON c.category_id = ct.id"
                    + " ORDER BY c.id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            ps = con.prepareStatement(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            List<course> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("thumbnail"),
                        new category(rs.getInt("category_id"),
                                rs.getString("category_name"),
                                rs.getInt("category_status")),
                        rs.getInt("fearture"),
                        rs.getString("owner"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getFloat("sale_price"),
                        rs.getString("duration"),
                        rs.getString("skill_level"),
                        rs.getString("language"),
                        rs.getInt("status")));
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        } finally {
            ps.close();
        }
    }

    public course getCourseById(int id) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT *,ct.name as category_name,ct.status as category_status "
                    + "FROM courses c JOIN category ct ON c.category_id = ct.id "
                    + "WHERE c.id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("thumbnail"),
                        new category(rs.getInt("category_id"),
                                rs.getString("category_name"),
                                rs.getInt("category_status")),
                        rs.getInt("fearture"),
                        rs.getString("owner"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getFloat("sale_price"),
                        rs.getString("duration"),
                        rs.getString("skill_level"),
                        rs.getString("language"),
                        rs.getInt("status"));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            ps.close();
        }
        return null;
    }

    public List<course> getTopCourse() throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT TOP 3 *,ct.name as category_name,ct.status as category_status "
                    + "FROM courses c JOIN category ct ON c.category_id = ct.id"
                    + " ORDER BY c.id DESC";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            List<course> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("thumbnail"),
                        new category(rs.getInt("category_id"),
                                rs.getString("category_name"),
                                rs.getInt("category_status")),
                        rs.getInt("fearture"),
                        rs.getString("owner"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getFloat("sale_price"),
                        rs.getString("duration"),
                        rs.getString("skill_level"),
                        rs.getString("language"),
                        rs.getInt("status")));
            }
            return list;
        } catch (SQLException ex) {
            return null;
        } finally {
            ps.close();
        }
    }
    
    public List<course> getCoursesByPage(int pageIndex, int pageSize) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT *,ct.name as category_name,ct.status as category_status "
                    + "FROM courses c JOIN category ct ON c.category_id = ct.id "
                    + "WHERE c.status = 1 ORDER BY c.id DESC "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            ps = con.prepareStatement(sql);
            ps.setInt(1, pageIndex * pageSize);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            List<course> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("thumbnail"),
                        new category(rs.getInt("category_id"),
                                rs.getString("category_name"),
                                rs.getInt("category_status")),
                        rs.getInt("fearture"),
                        rs.getString("owner"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getFloat("sale_price"),
                        rs.getString("duration"),
                        rs.getString("skill_level"),
                        rs.getString("language"),
                        rs.getInt("status")));
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return null;
        } finally {
            ps.close();
        }
    }
    
    public int getNumberOfCourse() throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT COUNT(*) AS number_courses FROM courses "
                    + "WHERE status = 1";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("number_courses");
            }
        } catch (SQLException ex) {
            return 0;
        } finally {
            ps.close();
        }
        return 0;
    }

    public static void main(String[] args) throws SQLException {
        courseDao d = new courseDao();
        List<course> list = d.getAllCourses(0, 3);
       // System.out.println(d.getCourseById(1));
        for (course b : list) {
            System.out.println(b.toString());
        }
    }
}