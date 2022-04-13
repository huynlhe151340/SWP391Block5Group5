/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import Entity.accounts;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import JDBC.SQLServerConnection;
/**
 *
 * @author khait
 */
public class accountDao {
    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    public List<accounts> getAllaccounts() {
        
        List<accounts> list = new ArrayList<>();
        try {

            String sql = "SELECT * FROM [onlinelearn].[dbo].[accounts]";
            PreparedStatement statement = SQLServerConnection.getConnection().prepareStatement(sql);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new accounts(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getInt(4),rs.getInt(5), rs.getInt(6), rs.getDate(7)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public static void main(String[] args) {
        
        accountDao db = new accountDao();
        List<accounts> list = db.getAllaccounts();
        System.err.println("/n");
        for (accounts object : list) {
            System.out.println(object);
        }
    }
}

    

