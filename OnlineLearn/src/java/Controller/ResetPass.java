/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.accountDao;
import DAO.accountDetailDao;
import Entity.accounts;
import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.JavaMail;
import utils.RandomString;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ResetPass", urlPatterns = {"/user/ResetPass"})
public class ResetPass extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        String email = request.getParameter("email");
        accountDao dao = new accountDao();
        accounts check_Ac = new accounts();
        HttpSession session = request.getSession();
        check_Ac = dao.getAccountByEmail(email);

        if (check_Ac == null) {
            request.setAttribute("mess", "Email k đã tồn tại");
            request.getRequestDispatcher("/user/ForgotPass.jsp").forward(request, response);
        } else {
            RandomString rd = new RandomString();
            String code = rd.generateRandomString();

            session.setAttribute("authcode", code);
            String subject = "Code to ResetPass";
            new JavaMail().sentEmail(email, subject, code);
            session.setAttribute("code", code);
            request.setAttribute("email", email);
            request.getRequestDispatcher("/user/Confirm_ForgotPass.jsp").forward(request, response);

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
