/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.lessonDao;
import Entity.lessons;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author VIP
 */
@WebServlet(name = "LessonController", urlPatterns = {"/LessonController"})
public class LessonController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        lessonDao dao=new lessonDao();
             String action = request.getParameter("action");
        try (PrintWriter out = response.getWriter()) {
             
            if (action == null) {
                action = "listAll";
            }
            if (action.equals("listAll")) {
           
        List<lessons>list=dao.listLesson();
        request.setAttribute("ListLesson", list);
        request.getRequestDispatcher("Lesson.jsp").forward(request, response);
            }
        
        if(action.equals("listDetail")){
            int lid =Integer.parseInt(request.getParameter("lid"));
            
            lessons l=dao.getAllLessonById(lid);
            request.setAttribute("l", l);
           request.getRequestDispatcher("LessonDetail.jsp").forward(request, response);
           
        }
        if(action.equals("delete")){
            int lid =Integer.parseInt(request.getParameter("lid"));
            dao.deleteLesson(lid);
            response.sendRedirect("LessonController");
        }
        if(action.equals("insert")){
             String submit = request.getParameter("submit");
                if (submit == null) {
            out.print(" <form action=\"LessonController?action=insert\" method=\"POST\">"
                    + "<table border=\"0\">\n" +
           
"            <tr>\n" +
"                <td>Title</td>\n" +
"                <td><input type=\"text\" name=\"Title\"  ></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Topic</td>\n" +
"                <td><input type=\"text\" name=\"belongingTopic\"  ></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Content</td>\n" +
"                <td><input type=\"text\" name=\"content\" ></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Link Video</td>\n" +
"                <td><input type=\"text\" name=\"videoLink\" ></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Type</td>\n" +
"                <td><input type=\"text\" name=\"type\"  ></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Status</td>\n" +
"                <td><input type=\"text\" name=\"status\"  ></td>\n" +
"            </tr>\n" +
"           \n" +
"            <tr>\n" +
"                <td>CourseId</td>\n" +
"                <td><input type=\"text\" name=\"courseID\" ></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"            <td><input type=\"submit\" value=\"ADD\" name=\"submit\"></td>\n" +
"            </tr>\n" +
"\n" +
"        </table>"
                    + " </form>");}else{
                    String Title=request.getParameter("Title");
            String belongingTopic=request.getParameter("belongingTopic");
            String content=request.getParameter("content");
            String videoLink=request.getParameter("videoLink");
            String type=request.getParameter("type");
            int status=Integer.parseInt(request.getParameter("status"));
            int courseID=Integer.parseInt(request.getParameter("courseID"));
            lessons les=new lessons(Title, belongingTopic, content, videoLink, type, status, courseID);
            dao.insertLesson(les);
            response.sendRedirect("LessonController");
                }
        }
        if(action.equals("update")){
           String submit=request.getParameter("submit");
          if(submit!=null){
            int id=Integer.parseInt(request.getParameter("lid"));
            String Title=request.getParameter("Title");
            String belongingTopic=request.getParameter("belongingTopic");
            String content=request.getParameter("content");
            String videoLink=request.getParameter("videoLink");
            String type=request.getParameter("type");
            int status=Integer.parseInt(request.getParameter("status"));
            int courseID=Integer.parseInt(request.getParameter("courseID"));
            lessons les=new lessons(id, Title, belongingTopic, content, videoLink, type, status, courseID);
            dao.UpdateLesson(les);
          response.sendRedirect("LessonController");
          }
            
        }
        
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
