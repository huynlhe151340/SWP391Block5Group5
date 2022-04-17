/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.accountDetailDao;
import Entity.accountDetails;
import Entity.accounts;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author khait
 */
@WebServlet(name = "EditProfileController", urlPatterns = {"/user/edit-profile"})
public class EditProfileController extends HttpServlet {

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
        try {
            String name = request.getParameter("name").trim();
            String mobile = request.getParameter("mobile").trim();
            String email = request.getParameter("email").trim();
            String address = request.getParameter("address").trim();
            boolean gender = true;
            if (Integer.parseInt(request.getParameter("gender").trim()) == 1) {
                gender = false;
            } else {
                gender = true;
            }

            HttpSession session = request.getSession();
            accounts ac = (accounts) session.getAttribute("currentAccount");
            accountDetails details = new accountDetails(ac.getAccountDetailID(), name, mobile, address, gender);
//              response.getWriter().print(details.toString());
            boolean updateProfile = new accountDetailDao().editProfile(details, details.getId());
            if (updateProfile) {
//                request.getRequestDispatcher("/user/user.jsp").forward(request, response);
                response.getWriter().print("Update success");
            } else {
//                request.getRequestDispatcher("/user/user.jsp").forward(request, response);
                response.getWriter().print("Update fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/user/error.jsp");
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
