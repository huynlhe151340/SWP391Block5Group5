/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.slider;
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
public class sliderDao {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

//  Get tất cả sliders theo status và theo dòng
    public ArrayList<slider> getListSlider(int rowStart, int rowEnd, int status) throws SQLException {
        ArrayList<slider> listSlider = new ArrayList<>();
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
//              Lấy số lượng dòng từ rowStart đến rowEnd
                String sql = "SELECT * FROM\n"
                        + "  (SELECT ROW_NUMBER() OVER (ORDER BY id) AS rownum, *\n"
                        + "  FROM slider "
                        + "where status = ?) tbl\n"
                        + "WHERE rownum BETWEEN ? AND ?";
                if (status == -1) {
                    sql = "SELECT * FROM\n"
                            + "  (SELECT ROW_NUMBER() OVER (ORDER BY id) AS rownum, *\n"
                            + "  FROM slider) tbl\n"
                            + "WHERE rownum BETWEEN ? AND ?";
                }
                ps = con.prepareStatement(sql);
                if (status != -1) {
                    ps.setInt(1, status);
                    ps.setInt(2, rowStart);
                    ps.setInt(3, rowEnd);
                }
                if (status == -1) {
                    ps.setInt(1, rowStart);
                    ps.setInt(2, rowEnd);
                }
                rs = ps.executeQuery();
                while (rs.next()) {
                    listSlider.add(new slider(rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("image"),
                            rs.getString("backlink"),
                            rs.getInt("status"),
                            rs.getInt("course_id")));
                }
                return listSlider;
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

    //  Đếm số lượng các slider trong db theo status
    public int countSliders(int status) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                String sql = "select count(*) as 'numberOfSlider' from slider where status = ?";
                if (status == -1) {
                    sql = "select count(*) as 'numberOfSlider' from slider";
                }
                ps = con.prepareStatement(sql);
                if (status != -1) {
                    ps.setInt(1, status);
                }
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("numberOfSlider");
                }
                return 0;
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

        return -1;
    }

//  Get vài sliders (tùy vào topNumber) theo status, order by id desc để tìm slider mới nhất
    public ArrayList<slider> getRecentSlider(int topNumber, int status) throws SQLException {
        ArrayList<slider> listSlider = new ArrayList<>();
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                String sql = "select top " + topNumber + "* from slider where status = ? order by id desc";
                if (status == -1) {
                    sql = "select top " + topNumber + "* from slider";
                }
                ps = con.prepareStatement(sql);
                if (status != -1) {
                    ps.setInt(1, status);
                }
                rs = ps.executeQuery();
                while (rs.next()) {
                    listSlider.add(new slider(rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("image"),
                            rs.getString("backlink"),
                            rs.getInt("status"),
                            rs.getInt("course_id")));
                }
                return listSlider;
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

//  search slider theo title và backlink(tương đương description) với status
    public ArrayList<slider> searchSlider(String searchWord, int status) throws SQLException {
        ArrayList<slider> listSlider = new ArrayList<>();
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
//              Lấy số lượng dòng từ rowStart đến rowEnd
                String sql = "select * from slider where (title like ? or backlink like ?) and status = ?";
                if (status == -1) {
                    sql = "select * from slider where (title like ? or backlink like ?)";
                }
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + searchWord + "%");
                ps.setString(2, "%" + searchWord + "%");
                if (status != -1) {
                    ps.setInt(3, status);
                }
                rs = ps.executeQuery();
                while (rs.next()) {
                    listSlider.add(new slider(rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("image"),
                            rs.getString("backlink"),
                            rs.getInt("status"),
                            rs.getInt("course_id")));
                }
                return listSlider;
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

    public static void main(String[] args) throws SQLException {
        sliderDao dao = new sliderDao();
//        System.out.println(dao.getListSlider(1, 5, 1));
//        System.out.println(dao.countSliders(1));
//        System.out.println(dao.getRecentSlider(2, 1));
//        System.out.println(dao.searchSlider("a", 1));
    }
}
