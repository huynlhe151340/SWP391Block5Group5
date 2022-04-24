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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "acceptPostController", urlPatterns = {"/acceptPostController"})
public class acceptPostController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String id_1 = request.getParameter("submit2");
            String id_2 = request.getParameter("submit1");
            String id_3 = request.getParameter("submit3");
            String id_4 = request.getParameter("submit4");

            if (id_1 != null && id_2 == null && id_3 == null && id_4 == null) {
                int id_post = Integer.parseInt(id_1);
                postDao d = new postDao();
                post a = new post();
                a = d.getPostByID(id_post);
             
                int ac_id = a.getAccountID();
                int id_detail = d.getIDDetailByIdAc(ac_id);
                String nameAc = d.getNameByIdAcDetail(id_detail);
                     
                request.setAttribute("NameAc", nameAc);        
                request.setAttribute("title", a.getTitle());
                request.setAttribute("post_detail", a.getPostDetail());
                request.setAttribute("date", a.getUpdateDate());
                request.setAttribute("Author", a.getAuthor());
                request.setAttribute("img", a.getImage());
                        
                d.UpdateStatusPost(1, id_post);
                request.setAttribute("mess", "Thêm thành công !");
                request.getRequestDispatcher("/admin/PostDetail.jsp").forward(request, response);
            } else if (id_2 != null && id_1 == null && id_3 == null && id_4 == null) {
                int id_post = Integer.parseInt(id_2);
                postDao d = new postDao();
                post a = new post();
                a = d.getPostByID(id_post);
            
                int ac_id = a.getAccountID();
                int id_detail = d.getIDDetailByIdAc(ac_id);
                String nameAc = d.getNameByIdAcDetail(id_detail);
                
                request.setAttribute("NameAc", nameAc);           
                request.setAttribute("title", a.getTitle());
                request.setAttribute("post_detail", a.getPostDetail());
                request.setAttribute("date", a.getUpdateDate());
                request.setAttribute("Author", a.getAuthor());
                request.setAttribute("img", a.getImage());

                d.UpdateStatusPost(2, id_post);
                request.setAttribute("mess1", "Bài viết đã được add Block !");
                request.getRequestDispatcher("/admin/PostDetail.jsp").forward(request, response);
            } else if (id_3 != null && id_1 == null && id_2 == null && id_4 == null) {
                int id_post = Integer.parseInt(id_3);
                postDao d = new postDao();
                post a = new post();
                a = d.getPostByID(id_post);
          
                int ac_id = a.getAccountID();
                int id_detail = d.getIDDetailByIdAc(ac_id);
                String nameAc = d.getNameByIdAcDetail(id_detail);
             
                request.setAttribute("NameAc", nameAc);          
                request.setAttribute("title", a.getTitle());
                request.setAttribute("post_detail", a.getPostDetail());
                request.setAttribute("date", a.getUpdateDate());
                request.setAttribute("Author", a.getAuthor());
                request.setAttribute("img", a.getImage());

                d.UpdateStatusPost(2, id_post);
                request.setAttribute("mess1", "Bài viết đã được block !");
                request.getRequestDispatcher("/admin/PostDetail.jsp").forward(request, response);

            } else if (id_4 != null && id_1 == null && id_2 == null && id_3 == null) {

                int id_post = Integer.parseInt(id_4);
                postDao d = new postDao();
                post a = new post();
                
                a = d.getPostByID(id_post);
          
                int ac_id = a.getAccountID();
                int id_detail = d.getIDDetailByIdAc(ac_id);
                String nameAc = d.getNameByIdAcDetail(id_detail);
                
           
                request.setAttribute("NameAc", nameAc);         
                request.setAttribute("title", a.getTitle());
                request.setAttribute("post_detail", a.getPostDetail());
                request.setAttribute("date", a.getUpdateDate());
                request.setAttribute("Author", a.getAuthor());
                request.setAttribute("img", a.getImage());

                d.UpdateStatusPost(1, id_post);
                request.setAttribute("mess", "Bài viết đã được unBlock !");
                request.getRequestDispatcher("/admin/PostDetail.jsp").forward(request, response);
            }
            request.getRequestDispatcher("/admin/PostDetail.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(acceptPostController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(acceptPostController.class.getName()).log(Level.SEVERE, null, ex);
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

    public void Get() {

    }
}
