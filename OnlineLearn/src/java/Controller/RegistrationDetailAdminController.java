/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.accountDao;
import DAO.accountDetailDao;
import DAO.courseDao;
import DAO.registrationDao;
import Entity.accountDetails;
import Entity.accounts;
import Entity.course;
import Entity.registration;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RegistrationDetailAdminController", urlPatterns = {"/admin/RegistrationDetailAdminController"})
public class RegistrationDetailAdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id_Regis = request.getParameter("id");
            int id = Integer.parseInt(id_Regis);

            registrationDao d = new registrationDao();
            courseDao c = new courseDao();
            accountDao a = new accountDao();
            accountDetailDao ad = new accountDetailDao();

            registration r = d.getRegisById(id);
            int id_ac = r.getAccountID();
            int id_c = r.getCourseID();

            course course = c.getCourseById(id_c);
            accounts acount = a.getOne(id_ac);
            accountDetails ac_d = ad.getOne(acount.getAccountDetailID());

            request.setAttribute("Customer", ac_d.getName());
            request.setAttribute("CourseName", course.getName());
            request.setAttribute("RegistrationTime", r.getRegistrationTime());
            request.setAttribute("TotalCost", r.getTotalCost());
            request.setAttribute("status", r.getStatus());
            request.setAttribute("ValidFrom", r.getValidFrom());
            request.setAttribute("ValidTo", r.getValidTo());
            
            request.getRequestDispatcher("/admin/DetailRegistration.jsp").forward(request, response);

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDetailAdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDetailAdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
