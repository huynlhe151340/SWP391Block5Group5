/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.registrationDao;
import Entity.accounts;
import Entity.registration;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CourseRegisterController", urlPatterns = {"/user/course-register"})
public class CourseRegisterController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        accounts currentAccount = (accounts) request.getSession().getAttribute("currentAccount");

        String id = request.getParameter("id");
        String total_cost = request.getParameter("total_cost");
        registrationDao registrationDao = new registrationDao();

//      Đăng nhập rồi mới thực hiện mua  
        if (currentAccount != null) {
            if (id != null && total_cost != null) {
                registration currentCourseRegistration = new registration(-1,
                        currentAccount.getId(), Integer.parseInt(id),
                        new java.sql.Date(System.currentTimeMillis()),
                        Double.parseDouble(total_cost), 1,
                        new java.sql.Date(System.currentTimeMillis()),
                        new java.sql.Date(System.currentTimeMillis() + TimeUnit.DAYS.toMillis(30 * 6)));
                try {
                    boolean buyMess = registrationDao.createCourseRegister(currentCourseRegistration);
                    request.setAttribute("buyMess", buyMess);
                    request.setAttribute("id", id);
                    request.getRequestDispatcher("/user/courseDetail").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(CourseRegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        } else {
            request.setAttribute("buyMess", false);
            request.getRequestDispatcher("/user/courseDetail").forward(request, response);
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
