/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import Entity.lessons;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author khait
 */
public class lessonDao {
      Connection con = null;
   PreparedStatement ps = null;
     ResultSet rs = null;
    public lessonDao(){
        }
     public ArrayList<lessons> listAllLesson() {
          ArrayList<lessons> list = new ArrayList<lessons>();
         String query="select * from lesson";
//          String query="select lesson.id,lesson.title,lesson.belonging_topic,courses.[name],lesson.status  from lesson inner join courses on lesson.course_id=courses.id";
          try {
             con = JDBC.SQLServerConnection.getConnection();
             ps =con.prepareStatement(query);
             rs=ps.executeQuery();
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
        String query="select lesson.id,lesson.title,lesson.belonging_topic,courses.[name],lesson.[status]  from lesson inner join courses on lesson.course_id=courses.id";
      //  String query="select lesson.id,lesson.title,lesson.belonging_topic,courses.[name],lesson.status  from lesson inner join courses on lesson.course_id=courses.id";
          try {
             con = JDBC.SQLServerConnection.getConnection();
             ps =con.prepareStatement(query);
             rs=ps.executeQuery();
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
             ps =con.prepareStatement(query);
            
           ps.setString(1, les.getTitle());
            ps.setString(2, les.getBelongingTopic());
            ps.setString(3, les.getContent());
            ps.setString(4, les.getVideoLink());
            ps.setString(5, les.getType());
            ps.setInt(6, les.getStatus());
           ps.setInt(7, les.getCourseID());
           ps.setInt(8, les.getId());
            // run
           rs=ps.executeQuery();
        } catch (SQLException ex) {
          
        }
      
    }
      public void deleteLesson(int id) {
       
        String sql = "DELETE FROM lesson where id = ? ";
        try {
            con = JDBC.SQLServerConnection.getConnection();
             ps =con.prepareStatement(sql);
             ps.setInt(1, id);
             rs=ps.executeQuery();
        } catch (SQLException ex) {
           
        }
        
    }
        public lessons getAllLessonById(int id) {
             int n = 0;
        String sql = "SELECT * FROM lesson WHERE id= ?";
        try  {
             con = JDBC.SQLServerConnection.getConnection();
             ps =con.prepareStatement(sql);
             ps.setInt(1, id);
             rs=ps.executeQuery();
            if (rs.next()) {
               return new lessons(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
           
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
               rs.getInt(8) );
               
            }
        } catch (SQLException e) {
         
        }
        return null;
    }
        public void insertLesson(lessons les){
            String sql="insert into lesson values(?,?,?,?,?,?,?)";
            try{
             con = JDBC.SQLServerConnection.getConnection();
             ps =con.prepareStatement(sql);
             ps.setString(1, les.getTitle());
             ps.setString(2, les.getBelongingTopic());
             ps.setString(3, les.getContent());
             ps.setString(4, les.getVideoLink());
             ps.setString(5, les.getType());
             ps.setInt(6, les.getStatus());
             ps.setInt(7, les.getCourseID());
             rs=ps.executeQuery();
            }catch(Exception e){}
            
        }
     public static void main(String[] args) {
        lessonDao dao=new lessonDao();
        ArrayList<lessons> a = dao.listAllLesson();
         System.out.println(a.size());
       
    }
}