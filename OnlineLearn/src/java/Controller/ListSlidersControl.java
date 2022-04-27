/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.sliderDao;
import Entity.accounts;
import Entity.slider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "ListSlidersControl", urlPatterns = {"/user/list-sliders"})
public class ListSlidersControl extends HttpServlet {

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
        
        String page = request.getParameter("page");
//      Mặc định hiển thị tất cả các slider với status = 1
            sliderDao sliderDao = new sliderDao();
            ArrayList<slider> listSlider = new ArrayList<>();
            ArrayList<slider> recentSlider = new ArrayList<>();

            try {
                // Mặc định đếm những slider status = 1
                int numberOfSlider = sliderDao.countSliders(1);

                // Số lượng page hiển thị (mỗi page max 6 slider)
                int numberOfPage = (int) numberOfSlider / 6 + ((numberOfSlider % 6 == 0) ? 0 : 1);

                if (page == null) {
                    //Chưa thực hiện chuyển trang thì lấy 6 slider đầu tiên với status 1
                    listSlider = sliderDao.getListSlider(1, 6, 1);
                } else {
                    //Lấy slider tương ứng cho page khi thực hiện chuyển trang với status 1
                    listSlider = sliderDao.getListSlider(6 * Integer.parseInt(page) - 5, 6 * Integer.parseInt(page), 1);
                }
                recentSlider = sliderDao.getRecentSlider(2, 1);
                //Nếu page == null thì là trang 1, khác null thì là trang khác
                request.setAttribute("currentPage", page == null ? 1 : page);
                request.setAttribute("numberOfPage", numberOfPage);
                request.setAttribute("listSlider", listSlider);
                request.setAttribute("recentSlider", recentSlider);

                request.getRequestDispatcher("/user/slider.jsp").forward(request, response);

            } catch (SQLException ex) {
                Logger.getLogger(ListSlidersControl.class.getName()).log(Level.SEVERE, null, ex);
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
