/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.postDao;
import Entity.post;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SaveChangePostAdminController", urlPatterns = {"/admin/SaveChangePostAdminController"})
public class SaveChangePostAdminController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String id = request.getParameter("SavePostEdit");
            int id_post = Integer.parseInt(id);
            postDao d = new postDao();
            post a = new post();
            a = d.getPostByID(id_post);

            String Title = request.getParameter("TitlePost");
            String Author = request.getParameter("author");
            String Detail = request.getParameter("Des");
            String Category = request.getParameter("myCheckboxCate").trim();
            int id_ca = Integer.parseInt(Category);

            if (d.UpdateSaveChangePostByID(Title, Detail, Author,id_ca, id_post)) {

                request.setAttribute("Category",id_ca);
                request.setAttribute("title", a.getTitle());
                request.setAttribute("post_detail", a.getPostDetail());
                request.setAttribute("Author", a.getAuthor());

                request.setAttribute("mess", "Sửa đổi thành công !");
                request.getRequestDispatcher("/admin/EditPost.jsp").forward(request, response);
            } else {
                request.setAttribute("Category",id_ca);
                request.setAttribute("title", a.getTitle());
                request.setAttribute("post_detail", a.getPostDetail());
                request.setAttribute("Author", a.getAuthor());
                request.setAttribute("mess1", "Sửa đổi thất bại !");
                request.getRequestDispatcher("/admin/EditPost.jsp").forward(request, response);
            }
            request.getRequestDispatcher("/admin/EditPost.jsp").forward(request, response);
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
