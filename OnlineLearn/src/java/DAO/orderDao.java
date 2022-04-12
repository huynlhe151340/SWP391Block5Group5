/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.orders;
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
public class orderDao {
    
    public List<orders> getAll(int accountId){
        
        List<orders> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE accountID = ?";
        try(Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, accountId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                orders o = new orders(rs.getInt("id"), 
                        rs.getInt("courseID"), 
                        rs.getInt("accountID"), 
                        rs.getDouble("total_price"), 
                        rs.getDate("create_date"), 
                        rs.getInt("status"));
                list.add(o);
            }
           return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
