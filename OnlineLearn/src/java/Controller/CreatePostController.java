/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.postDao;
import Entity.accounts;
import Entity.post;
import java.io.IOException;
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
 * @author ADMIN
 */
@WebServlet(name = "CreatePostController", urlPatterns = {"/admin/create-post"})
public class CreatePostController extends HttpServlet {

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
        accounts currentAccount = (accounts) request.getSession().getAttribute("currentAccount");
//      đã đăng nhập và account là admin mới được request create post
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String postDetail = request.getParameter("detail");
        String categoryID = request.getParameter("category");
        String image = request.getParameter("image");
        System.out.println(image);
        if (currentAccount != null && currentAccount.getRoleID() == 1) {
            try {
                postDao postDao = new postDao();
                post currentPost = new post(-1, title, author, new java.sql.Date(System.currentTimeMillis()),Integer.parseInt(categoryID), postDetail, image, 0,currentAccount.getId());
                if(currentAccount.getRoleID() == 1){
                    currentPost.setStatus(1);
                }
                boolean createMess = postDao.createPost(currentPost);
//              Nếu tạo bị lỗi, thì đẩy dữ liệu báo lỗi
                if (!createMess) {
                    request.setAttribute("createMess", false);
                    request.setAttribute("lastInputTitle", title);
                    request.setAttribute("lastInputAuthor", author);
                    request.setAttribute("lastInputPostDetail", postDetail);
                    request.setAttribute("lastInputCategoryID", categoryID);
                } else {
                    //Không bị lỗi thì đẩy dữ liệu thành công
                    request.setAttribute("createMess", true);
                }
                request.getRequestDispatcher("/admin/list-posts").forward(request, response);

            } catch (SQLException ex) {
                Logger.getLogger(CreatePostController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NumberFormatException e) {
                request.getRequestDispatcher("/user/error-404.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("/user/login.jsp").forward(request, response);
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
