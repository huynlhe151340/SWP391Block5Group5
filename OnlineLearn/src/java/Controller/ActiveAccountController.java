/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.accountDao;
import Entity.accounts;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author khait
 */
@WebServlet(name = "ActiveAccountController", urlPatterns = {"/user/active-account"})
public class ActiveAccountController extends HttpServlet {

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
            String email = request.getParameter("email");
            String code = request.getParameter("code");
            accounts ac = new accountDao().getAccountByEmail(email);
            if(ac.getActiveCode().equalsIgnoreCase(code)){
                boolean updateStatus = new accountDao().activeAccount(2, ac.getId());
                if(updateStatus){
                    request.setAttribute("mess", "Tạo tài khoản thành công");
                    request.getRequestDispatcher("/user/login.jsp").forward(request, response);
                } else {
                    request.setAttribute("email", email);
                    request.setAttribute("mess", "Active account không thành công");
                    request.getRequestDispatcher("/user/active-account.jsp").forward(request, response);
                }
            } else{
                request.setAttribute("email", email);
                request.setAttribute("mess", "Code không khớp");
                request.getRequestDispatcher("/user/active-account.jsp").forward(request, response);
            }
        } catch (Exception e) {
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
