/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.category;
import JDBC.SQLServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author khait
 */
public class categoryDao {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
//  Get tất cả post có status = 1

    public ArrayList<category> getListCategory() throws SQLException {
        ArrayList<category> listCategory = new ArrayList<>();
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                String sql = "select * from category where status = 1";

                ps = con.prepareStatement(sql);

                rs = ps.executeQuery();
                while (rs.next()) {
                    listCategory.add(new category(rs.getInt("id"),
                            rs.getString("name"),
                            rs.getInt("status")));
                }
                return listCategory;
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

        return null;
    }
}
