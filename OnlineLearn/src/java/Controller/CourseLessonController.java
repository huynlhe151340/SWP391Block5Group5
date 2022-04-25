/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.courseDao;
import DAO.lessonDao;
import Entity.course;
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
@WebServlet(name = "CourseLessonController", urlPatterns = {"/admin/CourseLessonController"})
public class CourseLessonController extends HttpServlet {

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
        lessonDao dao = new lessonDao();
         courseDao daoc = new courseDao();
        String action = request.getParameter("action");
        try (PrintWriter out = response.getWriter()) {

            if (action == null) {
                action = "listAllCourse";
            }
           if(action.equals("listAllCourse")){
               List<course> listCourse=daoc.listCourse();
               request.setAttribute("listCourse", listCourse);
               request.getRequestDispatcher("/admin/CourseLesson.jsp").forward(request, response);
           }
           if(action.equals("listLesson")){
               int courseid=Integer.parseInt(request.getParameter("courseid"));
               List<lessons> listLesson=dao.listLessonByCourse(courseid);
               request.setAttribute("ListLesson", listLesson);
               request.getRequestDispatcher("/admin/Lesson.jsp").forward(request, response);
           }

            if (action.equals("listDetail")) {
                int lid = Integer.parseInt(request.getParameter("lid"));
                lessons l = dao.getAllLessonById(lid);
                request.setAttribute("l", l);
                request.getRequestDispatcher("/admin/LessonDetail.jsp").forward(request, response);
            }
            if (action.equals("delete")) {
                int lid = Integer.parseInt(request.getParameter("lid"));
                dao.deleteLesson(lid);

                response.sendRedirect("/admin/CourseLessonController");
            }
            if (action.equals("insert")) {
                String submit = request.getParameter("submit");

                if (submit != null) {

                    String Title = request.getParameter("Title");
                    String belongingTopic = request.getParameter("belongingTopic");
                    String content = request.getParameter("content");
                    String videoLink = request.getParameter("videoLink");
                    String type = request.getParameter("type");
                    int status = Integer.parseInt(request.getParameter("status"));
                    int courseID = Integer.parseInt(request.getParameter("courseID"));
                    lessons les = new lessons(Title, belongingTopic, content, videoLink, type, status, courseID);
                    dao.insertLesson(les);
                    response.sendRedirect("/admin/CourseLessonController");
                }
            }
            if (action.equals("update")) {
                String submit = request.getParameter("submit");
                if (submit != null) {
                    int id = Integer.parseInt(request.getParameter("lid"));
                    String Title = request.getParameter("Title");
                    String belongingTopic = request.getParameter("belongingTopic");
                    String content = request.getParameter("content");
                    String videoLink = request.getParameter("videoLink");
                    String type = request.getParameter("type");
                    int status = Integer.parseInt(request.getParameter("status"));
                    int courseID = Integer.parseInt(request.getParameter("courseID"));
                    lessons les = new lessons(id, Title, belongingTopic, content, videoLink, type, status, courseID);
                    dao.UpdateLesson(les);               
                    response.sendRedirect("/admin/CourseLessonController?action=listDetail&lid=" + id);

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
