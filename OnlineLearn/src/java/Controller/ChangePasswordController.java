/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.accountDao;
import Entity.accounts;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/user/change-password"})
public class ChangePasswordController extends HttpServlet {

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
//            String email = request.getParameter("email").trim();
            String oldPassword = request.getParameter("oldPassword").trim();
            String newPassword = request.getParameter("newPassword").trim();
            String reNewPassword = request.getParameter("reNewPassword").trim();

            HttpSession session = request.getSession();
            accounts ac = (accounts) session.getAttribute("currentAccount");
            if (!oldPassword.equalsIgnoreCase(ac.getPassword())) {
                response.getWriter().print("Mật khẩu cũ không đúng!!");
            } else {
                if (!newPassword.equalsIgnoreCase(reNewPassword)) {
                    response.getWriter().print("Mật khẩu cũ không không khớp!!");
                } else {
                    boolean changePassword = new accountDao().changePassword(newPassword, ac.getId());
                    if (changePassword) {
                        response.getWriter().print("Thay đổi mật khẩu thành công!!");
                    } else {
                        response.getWriter().print("Thay đổi mật khẩu không thành công!!");
                    }
                }
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
