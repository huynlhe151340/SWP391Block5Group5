package DAO;

import Entity.post;
import JDBC.SQLServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class postDao {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<post> getAllPosts(int pageIndex, int pageSize) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT * FROM post ORDER BY update_date DESC\n"
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            ps = con.prepareStatement(sql);
            ps.setInt(1, pageIndex * pageSize);
            ps.setInt(2, pageIndex * pageSize + pageSize);
            rs = ps.executeQuery();
            List<post> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new post(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getDate("update_date"),
                        rs.getInt("category_id"),
                        rs.getString("post_detail"),
                        rs.getString("image"),
                        rs.getInt("status")));
            }
            return list;
        } catch (SQLException ex) {
            return null;
        } finally {
            ps.close();
        }
    }

    public post getPostById(int id) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT * FROM post WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new post(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getDate("update_date"),
                        rs.getInt("category_id"),
                        rs.getString("post_detail"),
                        rs.getString("image"),
                        rs.getInt("status"));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            ps.close();
        }
        return null;
    }

    public List<post> getTopPostRecent() throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT TOP 3 * FROM post ORDER BY update_date DESC";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            List<post> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new post(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getDate("update_date"),
                        rs.getInt("category_id"),
                        rs.getString("post_detail"),
                        rs.getString("image"),
                        rs.getInt("status")));
            }
            return list;
        } catch (SQLException ex) {
            return null;
        } finally {
            ps.close();
        }
    }
    
    public int getNumberOfPost() throws SQLException {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT COUNT(*) as number_post from post";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("number_post");
            }
        } catch (SQLException ex) {
            return 0;
        } finally {
            ps.close();
        }
        return 0;
    }

    public static void main(String[] args) throws SQLException {
        postDao d = new postDao();
        List<post> list = d.getAllPosts(0, 5);
        System.out.println(d.getPostById(1));
        for (post b : list) {
            System.out.println(b);
        }
    }
}
