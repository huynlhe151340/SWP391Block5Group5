/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import Entity.lessons;
import JDBC.SQLServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author khait
 */
public class lessonDao {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public lessonDao() {
    }

    public ArrayList<lessons> listAllLesson() {
        ArrayList<lessons> list = new ArrayList<lessons>();
        String query = "select * from lesson";
//          String query="select lesson.id,lesson.title,lesson.belonging_topic,courses.[name],lesson.status  from lesson inner join courses on lesson.course_id=courses.id";
        try {
            con = JDBC.SQLServerConnection.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new lessons(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException ex) {

        }
        return list;
    }

    public ArrayList<lessons> listLesson() {
        ArrayList<lessons> list = new ArrayList<lessons>();
        String query = "select lesson.id,lesson.title,lesson.belonging_topic,courses.[name],lesson.[status]  from lesson inner join courses on lesson.course_id=courses.id";
        //  String query="select lesson.id,lesson.title,lesson.belonging_topic,courses.[name],lesson.status  from lesson inner join courses on lesson.course_id=courses.id";
        try {
            con = JDBC.SQLServerConnection.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new lessons(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)));
            }
        } catch (SQLException ex) {

        }
        return list;
    }

    public void UpdateLesson(lessons les) {

        String query = "update lesson set title=?,belonging_topic=?,content=?,video_link=?,type=?,status=? ,course_id=? where id=?";
        try {
            con = JDBC.SQLServerConnection.getConnection();
            ps = con.prepareStatement(query);

            ps.setString(1, les.getTitle());
            ps.setString(2, les.getBelongingTopic());
            ps.setString(3, les.getContent());
            ps.setString(4, les.getVideoLink());
            ps.setString(5, les.getType());
            ps.setInt(6, les.getStatus());
            ps.setInt(7, les.getCourseID());
            ps.setInt(8, les.getId());
            // run
            rs = ps.executeQuery();
        } catch (SQLException ex) {

        }

    }

    public void deleteLesson(int id) {

        String sql = "DELETE FROM lesson where id = ? ";
        try {
            con = JDBC.SQLServerConnection.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
        } catch (SQLException ex) {

        }

    }

    public lessons getAllLessonById(int id) {
        int n = 0;
        String sql = "SELECT * FROM lesson WHERE id= ?";
        try {
            con = JDBC.SQLServerConnection.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new lessons(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));

            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void insertLesson(lessons les) {
        String sql = "insert into lesson values(?,?,?,?,?,?,?)";
        try {
            con = JDBC.SQLServerConnection.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, les.getTitle());
            ps.setString(2, les.getBelongingTopic());
            ps.setString(3, les.getContent());
            ps.setString(4, les.getVideoLink());
            ps.setString(5, les.getType());
            ps.setInt(6, les.getStatus());
            ps.setInt(7, les.getCourseID());
            rs = ps.executeQuery();
        } catch (Exception e) {
        }

    }

    // code vũ
    public List<lessons> getAll() {

        List<lessons> list = new ArrayList<>();
        String sql = "SELECT * FROM lesson";

        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lessons l = new lessons(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("belonging_topic"),
                        rs.getString("content"),
                        rs.getString("video_link"),
                        rs.getString("type"),
                        rs.getInt("status"),
                        rs.getInt("course_id"));
                list.add(l);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public lessons getTopic(int id) {
        String sql = "SELECT *  FROM lesson WHERE id= ?";

        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                lessons l = new lessons(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("belonging_topic"),
                        rs.getString("content"),
                        rs.getString("video_link"),
                        rs.getString("type"),
                        rs.getInt("status"),
                        rs.getInt("course_id"));
                return l;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<lessons> getTitleOfWeek(String week) {

        List<lessons> list = new ArrayList<>();
        String sql = "SELECT * FROM lesson WHERE belonging_topic= ?";

        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, week);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lessons l = new lessons(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("belonging_topic"),
                        rs.getString("content"),
                        rs.getString("video_link"),
                        rs.getString("type"),
                        rs.getInt("status"),
                        rs.getInt("course_id"));
                list.add(l);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getFisrtLessonId(int courseId) {
        String sql = "SELECT top 1 id FROM [dbo].[lesson] WHERE course_id = ?";

        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, courseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    //get lesson info
    public lessons getLesson(int lessonId) {
        String sql = "SELECT *  FROM lesson WHERE id= ?";

        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setObject(1, lessonId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                lessons l = new lessons(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("belonging_topic"),
                        rs.getString("content"),
                        rs.getString("video_link"),
                        rs.getString("type"),
                        rs.getInt("status"),
                        rs.getInt("course_id"));
                return l;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<lessons> listLessonByCourse(int cid) {
        ArrayList<lessons> list = new ArrayList<lessons>();
        String query = "select lesson.id,lesson.title,lesson.belonging_topic,courses.[name],lesson.course_id  "
                + "from lesson inner join courses on lesson.course_id=courses.id where course_id=?";

        try {
            con = JDBC.SQLServerConnection.getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new lessons(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)));
            }
        } catch (SQLException ex) {

        }
        return list;
    }

    public static void main(String[] args) {
        lessonDao a = new lessonDao();
        System.out.println(a.getFisrtLessonId(1));
    }
}
