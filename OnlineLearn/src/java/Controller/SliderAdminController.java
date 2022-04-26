/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.accountDao;
import DAO.courseDao;
import DAO.sliderDao;
import Entity.accounts;
import Entity.course;
import Entity.slider;
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
 * @author Admin
 */
@WebServlet(name = "SliderAdminController", urlPatterns = {"/admin/SliderAdminController"})
public class SliderAdminController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String pageStr = request.getParameter("page");
                int page = 1;

                if (pageStr != null) {
                    page = Integer.parseInt(pageStr);
                }
                sliderDao acDao = new sliderDao();
                courseDao d = new courseDao();
                List<course> listc = d.listCourse();
                request.setAttribute("listcourse",listc);
                int numberAccount = 6; // cho nhận mỗi trang hiển thị là 8sp
                int TotalSlider = acDao.countSlider(); // tổng số lượng sản phẩm có được trong bảng
                int totalPage = (TotalSlider % numberAccount == 0) ? TotalSlider / numberAccount : TotalSlider / numberAccount + 1;
                // tìm được tổng số lượng page mà mình có được
                List<Integer> lsPage = new ArrayList<>();
                // for này có chức năng hiển thị list page
                for (int i = 1; i <= totalPage; ++i) {
                    lsPage.add(i);
                }
                // hiển thị sản phẩm trong 1 trang mà người dùng vừa yêu cầu
                List<slider> lsSList = acDao.getSliderPerPage((page * numberAccount - numberAccount), numberAccount);
                request.setAttribute("page", page);
                request.setAttribute("lsPage", lsPage);
                request.setAttribute("lsSlider", lsSList);
                request.getRequestDispatcher("/admin/SliderAdmin.jsp").forward(request, response);// cau lenh day du lieu ve trang index.jsp
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("/admin/error.jsp");
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
