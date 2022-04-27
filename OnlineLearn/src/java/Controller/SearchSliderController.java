/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.sliderDao;
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
@WebServlet(name = "SearchSliderController", urlPatterns = {"/user/search-sliders"})
public class SearchSliderController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String searchWord = request.getParameter("searchWord");

        if (searchWord != null) {
            sliderDao sliderDao = new sliderDao();
            ArrayList<slider> listSlider = new ArrayList<>();
            ArrayList<slider> recentSlider = new ArrayList<>();

            try {
                listSlider = sliderDao.searchSlider(searchWord, 1);
                recentSlider = sliderDao.getRecentSlider(2, 1);

                // Số lượng page hiển thị (mỗi page max 6 slider)
                int numberOfPage = (int) listSlider.size() / 6 + ((listSlider.size() % 6 == 0) ? 0 : 1);

                request.setAttribute("lastSearchWord", searchWord);
                request.setAttribute("numberOfPage", numberOfPage);
                request.setAttribute("listSlider", listSlider);
                request.setAttribute("recentSlider", recentSlider);
                request.getRequestDispatcher("/user/slider.jsp").forward(request, response);

            } catch (SQLException ex) {
                Logger.getLogger(SearchSliderController.class.getName()).log(Level.SEVERE, null, ex);
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
