package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.AccountDAO;
import com.thdap.vaccine.dao.ServiceReviewDAO;
import com.thdap.vaccine.dao.UserDAO;
import com.thdap.vaccine.model.Account;
import com.thdap.vaccine.model.ServiceReview;
import com.thdap.vaccine.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServiceReviewServlet", urlPatterns = {"/ServiceReviewServlet"})
public class ServiceReviewServlet extends HttpServlet {

    ServiceReviewDAO serviceReviewDAO = new ServiceReviewDAO();
    UserDAO userDAO = new UserDAO();
    AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        List<User> users = userDAO.getAllUsers();
        request.setAttribute("users", users);
        List<Account> accounts = accountDAO.getAllAccounts();
        request.setAttribute("accounts", accounts);
        
        List<ServiceReview> serviceReviews = serviceReviewDAO.getFiveStarReview();
        request.setAttribute("serviceReviews", serviceReviews);

        try {
            request.getRequestDispatcher("ServiceReview.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error accessing database.", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("UTF-8");
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//
//        if (user == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }
//
//        String content = request.getParameter("content");
//        String ratingStr = request.getParameter("rating");
//        String type = request.getParameter("type");
//
//        if (content == null || content.isEmpty() || ratingStr == null || ratingStr.isEmpty() || type == null || type.isEmpty()) {
//            request.setAttribute("errorMessage", "Vui lòng nhập đầy đủ thông tin đánh giá.");
//            request.getRequestDispatcher("ServiceReview.jsp").forward(request, response);
//            return;
//        }
//
//        int userID = user.getUserID();
//        int rate = Integer.parseInt(ratingStr);
//
//        try {
//            serviceReviewDAO.insertServiceReview(userID, content, rate,date type);
//        } catch (Exception e) {
//            e.printStackTrace();
//            request.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm đánh giá. Vui lòng thử lại.");
//            request.getRequestDispatcher("ServiceReview.jsp").forward(request, response);
//            return;
//        }
//
//        response.sendRedirect("ServiceReviewServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
