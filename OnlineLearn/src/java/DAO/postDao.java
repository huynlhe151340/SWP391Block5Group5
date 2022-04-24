package DAO;

import Entity.category;
import Entity.post;
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
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
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
                        rs.getInt("status"),
                        rs.getInt("account_id")));
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

//  Get tất cả post có status = 0
    public ArrayList<post> getListPost(int rowStart, int rowEnd, int status) throws SQLException {
        ArrayList<post> listPost = new ArrayList<>();
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
//              Lấy số lượng dòng từ rowStart đến rowEnd
                String sql = "SELECT * FROM\n"
                        + "  (SELECT ROW_NUMBER() OVER (ORDER BY id) AS rownum, *\n"
                        + "  FROM post "
                        + "where status = ?) tbl\n"
                        + "WHERE rownum BETWEEN ? AND ?";
                if (status == -1) {
                    sql = "SELECT * FROM\n"
                            + "  (SELECT ROW_NUMBER() OVER (ORDER BY id) AS rownum, *\n"
                            + "  FROM post) tbl\n"
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
                    listPost.add(new post(rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("author"),
                            rs.getDate("update_date"),
                            rs.getInt("category_id"),
                            rs.getString("post_detail"),
                            rs.getString("image"),
                            rs.getInt("status"),
                            rs.getInt("account_id")));
                }
                return listPost;
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
    //  Đếm số lượng các post trong db với status = 0

    public int countPosts(int status) throws SQLException {
        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                String sql = "select count(*) as 'numberOfPost' from post where status = ?";
                if (status == -1) {
                    sql = "select count(*) as 'numberOfPost' from post";
                }
                ps = con.prepareStatement(sql);
                if (status != -1) {
                    ps.setInt(1, status);
                }
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("numberOfPost");
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

    public boolean createPost(post currentPost) throws SQLException {
//    public boolean createPost(String title, String author, int categoryID, String postDetail, int accountID, String image) throws SQLException {

        try {
            con = SQLServerConnection.getConnection();

            if (con != null) {
                String sql = "insert into post(title, author, update_date, category_id, post_detail, account_id, image, status) values (?,?,?,?,?,?,?,?)";

                ps = con.prepareStatement(sql);
                ps.setString(1, currentPost.getTitle());
                ps.setString(2, currentPost.getAuthor());
                ps.setDate(3, currentPost.getUpdateDate());
                ps.setInt(4, currentPost.getCategoryID());
                ps.setString(5, currentPost.getPostDetail());
                ps.setInt(6, currentPost.getAccountID());
                ps.setString(7, currentPost.getImage());
                ps.setInt(8, currentPost.getStatus());
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

    // Post Detail
    public int getStatusById(int id) {
        int Status = 0;
        try {
            con = SQLServerConnection.getConnection();
            String sql = "Select status FROM post Where id=?";
            ps = con.prepareStatement(sql);
            ps.setObject(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                Status = rs.getInt(1);
            }
            return Status;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return 3;
    }

    ;
        public int getAcIDByIdpost(int id_post) {
        int id_ac = 0;
        try {
            con = SQLServerConnection.getConnection();
            String sql = "Select account_id FROM post Where id=?";
            ps = con.prepareStatement(sql);
            ps.setObject(1, id_post);
            rs = ps.executeQuery();

            if (rs.next()) {
                id_ac = rs.getInt(1);
            }
            return id_ac;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public int getIDDetailByIdAc(int id) {
        int id_detail = 0;
        try {
            con = SQLServerConnection.getConnection();
            String sql = "Select accounts.account_detailID "
                    + "FROM accounts Where id=?";
            ps = con.prepareStatement(sql);
            ps.setObject(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                id_detail = rs.getInt(1);
            }
            return id_detail;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public post getPostByStatus(int status, int id) {
        try {
            con = SQLServerConnection.getConnection();
            String sql = "SELECT * FROM post Where status=? and id=?";
            ps = con.prepareStatement(sql);
            ps.setObject(1, status);
            ps.setObject(2, id);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id_post = rs.getInt("id");
                String title = (String) rs.getObject("title");
                String author = rs.getString("author");
                Date date = rs.getDate("update_date");
                int CategoryID = rs.getInt("category_id");
                String post_detail = (String) rs.getObject("post_detail");
                int Status = rs.getInt("status");
                int ac_id = rs.getInt("account_id");
                String image = rs.getString("image");

                post p = new post(id, title, author, date, CategoryID, post_detail, Status, ac_id, image);

                return p;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;

    }

    public String getNameByIdAcDetail(int id) {
        String name = "";
        try {
            con = SQLServerConnection.getConnection();
            String sql = "Select name FROM accountDetail Where accountDetail.id= ?";
            ps = con.prepareStatement(sql);
            ps.setObject(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString(1);
            }
            return name;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public boolean UpdateStatusPost(int Status, int IdPost) {
        String name = "";
        try {
            con = SQLServerConnection.getConnection();
            String sql = "Update post"
                    + " set status=? "
                    + "WHERE id=?";
            ps = con.prepareStatement(sql);
            ps.setObject(1, Status);
            ps.setObject(2, IdPost);

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        postDao d = new postDao();
//        List<post> list = d.getAllPosts(0, 5);
//        System.out.println(d.getPostById(1));
//        for (post b : list) {
//            System.out.println(b);
//        }
        System.out.println(d.UpdateStatusPost(0, 4));
    }
}
