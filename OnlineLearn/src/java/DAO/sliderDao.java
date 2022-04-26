/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.post;
import Entity.slider;
import JDBC.SQLServerConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author khait
 */
public class sliderDao {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<slider> getAllSlider() {
        try {
            List<slider> ls = new ArrayList<>();
            con = SQLServerConnection.getConnection();
            String sql = "SELECT * FROM Slider ";
            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id_slider = rs.getInt("id");
                String title = (String) rs.getObject("title");
                String image = rs.getString("image");
                String backlink = (String) rs.getObject("backlink");
                int course_id = rs.getInt("course_id");
                int Status = rs.getInt("status");
                slider s = new slider(id_slider, title, image, backlink, course_id, Status);
                ls.add(s);
            }
            return ls;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;

    }

    public List<slider> getSliderPerPage(int pageIndex, int numberProduct) {
        List<slider> ls = new ArrayList<>();
        String sql = "SELECT * FROM slider ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROW ONLY";

        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, pageIndex);
            ps.setObject(2, numberProduct);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                slider ac = new slider(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("image"),
                        rs.getString("backlink"),
                        rs.getInt("course_id"),
                        rs.getInt("status"));

                ls.add(ac);
            }
            return ls;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
       

    public int countSlider() {
        return getAllSlider().size();
    }
    public static void main(String[] args) {
        sliderDao d = new sliderDao();
        System.out.println(d.countSlider());
    }
}
