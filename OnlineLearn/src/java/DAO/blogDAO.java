/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.blog;
import JDBC.SQLServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author AD
 */
public class blogDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<blog> getAllBlogs(int pageIndex, int pageSize) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT * FROM blogs ORDER BY create_at DESC\n"
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            ps = con.prepareStatement(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            List<blog> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new blog(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("content"),
                        rs.getDate("create_at")));
            }
            return list;
        } catch (SQLException ex) {
            return null;
        } finally {
            ps.close();
        }
    }

    public blog getBlogById(int id) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT * FROM blogs WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new blog(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("content"),
                        rs.getDate("create_at"));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            ps.close();
        }
        return null;
    }
    
    public List<blog> getTopBlogsRecent() throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT TOP 3 * FROM blogs ORDER BY create_at DESC";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            List<blog> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new blog(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("content"),
                        rs.getDate("create_at")));
            }
            return list;
        } catch (SQLException ex) {
            return null;
        } finally {
            ps.close();
        }
    }

    public static void main(String[] args) throws SQLException {
        blogDAO d = new blogDAO();
        List<blog> list = d.getAllBlogs(0, 5);
        System.out.println(d.getBlogById(1));
        for (blog b : list) {
            System.out.println(b);
        }
    }
}
