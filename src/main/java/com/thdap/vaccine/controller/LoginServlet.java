/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.thdap.vaccine.dao.AccountDAO;
import com.thdap.vaccine.dao.AdminDAO;
import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.model.Account;
import com.thdap.vaccine.model.Admin;
import com.thdap.vaccine.model.Doctor;
import com.thdap.vaccine.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Retrieve username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String r = request.getParameter("rem");

        // tao 3 cái cookie là user pass với rem
        Cookie cu = new Cookie("cuser", username);
        Cookie cp = new Cookie("cpass", password);
        Cookie cr = new Cookie("crem", r);
        if (r != null) { // nguoi dung chon remember 
            cu.setMaxAge(10 * 365 * 24 * 60 * 60);//10 nam đi cho đỡ nhớ;
            cp.setMaxAge(10 * 365 * 24 * 60 * 60);
            cr.setMaxAge(10 * 365 * 24 * 60 * 60);
        } else {// nguoi dung khong chon remember 
            cu.setMaxAge(0);
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }

        AccountDAO dao = new AccountDAO();
        AdminDAO adminDao = new AdminDAO();
        DoctorDAO doctorDao = new DoctorDAO();

        Account account = dao.login(username, password);

        if (account != null) {
            if (account.isStatus()) {
                session.setAttribute("account", account);

                // Check the role of the user and redirect accordingly
                String roleID = account.getRoleID();
                if ("Admin".equals(roleID)) {
                    Admin admin = adminDao.getAdminByAccountID(account.getAccountID());
                    session.setAttribute("admin", admin);
                    response.sendRedirect("AdminIndexServlet");
                } else if ("User".equals(roleID)) {
                    User user = dao.getUserByAccountID(account.getAccountID());
                    session.setAttribute("user", user);
                    response.sendRedirect("homeIndex");
                } else {
                    Doctor doctor2 = doctorDao.getDoctorByAccountID(account.getAccountID());
                    ObjectMapper objectMapper = new ObjectMapper();
                    objectMapper.registerModule(new JavaTimeModule());

                    List<Doctor> doctor = new ArrayList<>();
                    doctor.add(doctorDao.getDoctorByAccountID(account.getAccountID()));

                    String doctorI = objectMapper.writeValueAsString(doctor);
                    session.setAttribute("doctorI", doctorI);
                    
                    session.setAttribute("doctor", doctor2);
                    response.sendRedirect("doctorIndexServlet");
                }
            } else {
                // Account is locked, set error message and forward to login page
                request.setAttribute("errorMessage", "Tài khoản của bạn bị khóa vì một lý do nào đó!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            // Set error message in the request
            request.setAttribute("errorMessage", "Sai username hoặc password");

            // Forward the request back to the login page
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the login page
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
