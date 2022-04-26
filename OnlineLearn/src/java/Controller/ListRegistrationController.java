/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.accountDao;
import DAO.registrationDao;
import Entity.accounts;
import Entity.registration;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phung
 */
@WebServlet(name = "ListRegistrationController", urlPatterns = {"/admin/list-registrations"})
public class ListRegistrationController extends HttpServlet {

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
            int page = 1;
            String pageStr = request.getParameter("page");

            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            
            registrationDao rDao = new registrationDao();
            int numberItem = 6; // cho nhận mỗi trang hiển thị là 6regis
            int totalRegistretion = rDao.countTotalRegistration(); // tổng số lượng sản phẩm có được trong bảng
            int totalPage = (totalRegistretion % numberItem == 0) ? totalRegistretion / numberItem : totalRegistretion / numberItem + 1;
            // tìm được tổng số lượng page mà mình có được
            List<Integer> lsPage = new ArrayList<>();
            // for này có chức năng hiển thị list page
            for (int i = 1; i <= totalPage; ++i) {
                lsPage.add(i);
            }
            // hiển thị sản phẩm trong 1 trang mà người dùng vừa yêu cầu
            List<registration> listRegis= rDao.getRegistrationPerPage((page * numberItem - numberItem), numberItem);
            System.out.println(listRegis.size());
            request.setAttribute("page", page);
            request.setAttribute("lsPage", lsPage);
            request.setAttribute("listRegis", listRegis);
            request.getRequestDispatcher("/admin/registration-list.jsp").forward(request, response);// cau lenh day du lieu ve trang index.jsp
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/admin/error.jsp");
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
