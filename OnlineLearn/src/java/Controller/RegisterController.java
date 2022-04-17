/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.accountDao;
import DAO.accountDetailDao;
import Entity.accountDetails;
import Entity.accounts;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.JavaMail;
import utils.RandomString;

/**
 *
 * @author khait
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/user/register"})
public class RegisterController extends HttpServlet {

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
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("rePassword");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            boolean gender = true;
            if (Integer.parseInt(request.getParameter("gender")) == 1) {
                gender = false;
            } else {
                gender = true;
            }
            int idAccD = 0;
            accountDao acDao = new accountDao();
            if (acDao.isCheckDuplicateEmail(email)) {
                request.setAttribute("mess", "Email đã tồn tại");
                request.getRequestDispatcher("/user/register.jsp").forward(request, response);
            } else {
                if (password.equalsIgnoreCase(rePassword)) {
                    accountDetails accDetails = new accountDetails(0, name, mobile, address, gender);
                    idAccD = new accountDetailDao().insert(accDetails);
                    if (idAccD > 0) {
                        RandomString rd = new RandomString();
                        String code = rd.generateRandomString();
                        accounts ac = new accounts(email, password, idAccD, 2, 1, code);
                        String subject = "Code to create new password";
                        boolean check = acDao.insert(ac);
                        if (check) {
                            new JavaMail().sentEmail(email, subject, code);
                            request.setAttribute("email", email);
                            request.getRequestDispatcher("/user/active-account.jsp").forward(request, response);
                        } else {
                            new accountDetailDao().remove(idAccD);
                            request.setAttribute("mess", "Tạo tài khoản không thành công!!");
                            request.getRequestDispatcher("/user/register.jsp").forward(request, response);
                        }
                    } else {
                        request.setAttribute("mess", "Tạo tài khoản không thành công!!");
                        request.getRequestDispatcher("/user/register.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("mess", "Mật khẩu không khớp!!");
                    request.getRequestDispatcher("/user/register.jsp").forward(request, response);
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
