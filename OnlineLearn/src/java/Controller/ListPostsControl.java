/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.accountDao;
import DAO.categoryDao;
import DAO.postDao;
import Entity.accounts;
import Entity.category;
import Entity.post;
import java.io.IOException;
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
@WebServlet(name = "ListPostsControl", urlPatterns = {"/admin/list-posts"})
public class ListPostsControl extends HttpServlet {

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

        accounts currentAccount = (accounts) request.getSession().getAttribute("currentAccount");
        System.out.println(currentAccount);
        String page = request.getParameter("page");
        String status = request.getParameter("status");
//      đã đăng nhập và account là admin mới được request hiện post
//      Mặc định hiển thị tất cả các post
        if (currentAccount != null && currentAccount.getRoleID() == 1) {
            try {
                accountDao accountDao = new accountDao();
                postDao postDao = new postDao();
                categoryDao categoryDao = new categoryDao();
                ArrayList<post> listPost = new ArrayList<>();
//              Mặc định đếm những post chưa active  
                int numberOfPost = postDao.countPosts(-1);
//              Nếu có biến request tới thì hiển thị post theo request                
                if (status != null) {
                    numberOfPost = postDao.countPosts(Integer.parseInt(status));
                }
//              Số lượng page hiển thị (mỗi page max 6 posts)
                int numberOfPage = (int) numberOfPost / 6 + ((numberOfPost % 6 == 0) ? 0 : 1);

                if (page == null) {
                    //Chưa thực hiện chuyển trang thì lấy 6 post đầu tiên với status bất kỳ
                    listPost = postDao.getListPost(1, 6, -1);
//                  Nếu có status thì lấy theo status  
                    if (status != null) {
                        listPost = postDao.getListPost(1, 6, Integer.parseInt(status));
                    }
                } else {
                    //Lấy post tương ứng cho page khi thực hiện chuyển trang với status bất kỳ
                    listPost = postDao.getListPost(6 * Integer.parseInt(page) - 5, 6 * Integer.parseInt(page), -1);
                    //Nếu có status thì lấy theo status 
                    if (status != null) {
                        listPost = postDao.getListPost(6 * Integer.parseInt(page) - 5, 6 * Integer.parseInt(page), Integer.parseInt(status));
                    }


                }
                ArrayList<category> listCategory = categoryDao.getListCategory();
                ArrayList<accounts> listAccount = (ArrayList<accounts>) accountDao.getAllAccount();

                System.out.println(numberOfPage);
                System.out.println(listAccount);
                request.setAttribute("numberOfPage", numberOfPage);
//              Nếu page == null thì là trang 1, khác null thì là trang khác
                request.setAttribute("currentPage", page == null ? 1 : page);
                request.setAttribute("currentStatus", status == null ? -1 : status);
                request.setAttribute("listCategory", listCategory);
                request.setAttribute("listPost", listPost);
                request.setAttribute("listAccount", listAccount);

                request.getRequestDispatcher("/admin/post-list.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ListPostsControl.class.getName()).log(Level.SEVERE, null, ex);
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
