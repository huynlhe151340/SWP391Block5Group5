/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Authentication;

import DAO.Login.loginDAO;
import Entity.accounts;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

         System.out.println("here");
        if (loginDAO.isHaveEmail(email)) {
            if (loginDAO.checkPassword(email, password)) {
                HttpSession session = request.getSession(); //tao session de luu phien dang nhap
                try {
                    accounts currentAccount = loginDAO.getAccountByEmail(email);

                    if (currentAccount.getStatus() == 1) {
                        request.setAttribute("lastInputEmail", email);
                        request.setAttribute("lastInputPassword", password);
                        request.setAttribute("notActiveMess", true);
                        request.getRequestDispatcher("user/login.jsp").forward(request, response);
                        return;
                    }
                    if (currentAccount.getStatus() == 3) {
                        request.setAttribute("lastInputEmail", email);
                        request.setAttribute("lastInputPassword", password);
                        request.setAttribute("blockMess", true);
                        request.getRequestDispatcher("user/login.jsp").forward(request, response);
                        return;
                    }
                    session.setAttribute("currentAccount", currentAccount);
                    if (currentAccount.getRoleID() == 1) {
                        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                    }
                    if (currentAccount.getRoleID() == 2) {
                        request.setAttribute("isIndex", true);
                        request.getRequestDispatcher("user/home").forward(request, response);
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
        request.setAttribute("lastInputEmail", email);
        request.setAttribute("lastInputPassword", password);
        request.setAttribute("loginMess", "The username or password you entered is not matched to any account.");
        request.getRequestDispatcher("user/login.jsp").forward(request, response);
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
            Logger.getLogger(LoginControl.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LoginControl.class.getName()).log(Level.SEVERE, null, ex);
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
