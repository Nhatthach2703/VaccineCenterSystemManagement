package com.thdap.vaccine.controller;

import com.thdap.vaccine.model.Account;
import com.thdap.vaccine.dao.AccountDAO;
import com.thdap.vaccine.model.GoogleAccount;
import com.thdap.vaccine.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/login-gg"})
public class LoginGoogleServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AccountDAO dao = new AccountDAO();
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");

        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        GoogleAccount googleAccount = gg.getUserInfo(accessToken);

        Account account = googleLogin(googleAccount);
        if (account.isStatus()) {
            String roleID = account.getRoleID();
            if ("Admin".equals(roleID)  || "Doctor".equals(roleID)){
                request.setAttribute("errorMessage", "Tài khoản nội bộ không được đăng nhập với Google!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                User user = dao.getUserByAccountID(account.getAccountID());
                session.setAttribute("account", account);
                session.setAttribute("user", user);
                response.sendRedirect("index.jsp");
            }   
        } else {
            request.setAttribute("errorMessage", "Tài khoản của bạn bị khóa vì một lý do nào đó!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public Account googleLogin(GoogleAccount googleAccount) {
        AccountDAO dao = new AccountDAO();
        Account account = dao.getAccountByEmail(googleAccount.getEmail());
        if (account == null) {
            // Create new account if it doesn't exist
            String username = googleAccount.getName();
            String password = "1234"; // Consider generating a random password and storing securely
            dao.createAccount(username, password, googleAccount.getEmail());
            account = dao.login(username, password);
            int accountID = dao.getAccountID(username);
            dao.createUser(username, accountID, googleAccount.getEmail(), null, null, null, null);
        }
        return account;
    }
}
