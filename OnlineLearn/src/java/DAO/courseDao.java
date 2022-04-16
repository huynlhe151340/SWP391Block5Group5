/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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
            String sql = "SELECT * FROM courses ORDER BY id DESC\n"
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            ps = con.prepareStatement(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            List<course> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("thumbnail"),
                        rs.getInt("category_id"),
                        rs.getInt("fearture"),
                        rs.getString("owner"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getFloat("sale_price"),
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
            String sql = "SELECT * FROM courses WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("thumbnail"),
                        rs.getInt("category_id"),
                        rs.getInt("fearture"),
                        rs.getString("owner"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getFloat("sale_price"),
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
            String sql = "SELECT TOP 3 * FROM courses ORDER BY id DESC";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            List<course> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new course(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("thumbnail"),
                        rs.getInt("category_id"),
                        rs.getInt("fearture"),
                        rs.getString("owner"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getFloat("sale_price"),
                        rs.getInt("status")));
            }
            return list;
        } catch (SQLException ex) {
            return null;
        } finally {
            ps.close();
        }
    }
    
    public static void main(String[] args) throws SQLException {
        courseDao d = new courseDao();
        List<course> list = d.getAllCourses(0, 5);
        System.out.println(d.getCourseById(2));
        for (course b : list) {
            System.out.println(b);
        }
    }
}
