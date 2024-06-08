/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ConfirmCodeServlet", urlPatterns = {"/ConfirmCodeServlet"})
public class ConfirmCodeServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet confirmCode</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet confirmCode at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String inputCode = request.getParameter("verificationCode1") + request.getParameter("verificationCode2") + request.getParameter("verificationCode3") + request.getParameter("verificationCode4");
        String sessionCode = (String) request.getSession().getAttribute("verificationCode");

        // Debugging statement to check the codes
        System.out.println("Input Code: " + inputCode);
        System.out.println("Session Code: " + sessionCode);

        if (inputCode.equals(sessionCode)) {
            String fullName = (String) request.getSession().getAttribute("fullName");
            String username = (String) request.getSession().getAttribute("username");
            String email = (String) request.getSession().getAttribute("email");
            Date dob = (Date) request.getSession().getAttribute("dob");
            String phoneNumber = (String) request.getSession().getAttribute("phoneNumber");
            String gender = (String) request.getSession().getAttribute("gender");
            String address = (String) request.getSession().getAttribute("address");
            String password = (String) request.getSession().getAttribute("password");

            AccountDAO dao = new AccountDAO();

            try {
                boolean accountCreated = dao.createAccount(username, password, email);
                // Debugging statement to check account creation
                System.out.println("Account Created: " + accountCreated);

                if (accountCreated) {
                    int accountID = dao.getAccountID(username);
                    boolean userCreated = dao.createUser(fullName, accountID, email, dob, phoneNumber, address, gender);

                    // Debugging statement to check user creation
                    System.out.println("User Created: " + userCreated);

                    if (userCreated) {
                        // Clear session attributes related to registration
                        request.getSession().removeAttribute("verificationCode");
                        request.getSession().removeAttribute("fullName");
                        request.getSession().removeAttribute("username");
                        request.getSession().removeAttribute("email");
                        request.getSession().removeAttribute("dob");
                        request.getSession().removeAttribute("phoneNumber");
                        request.getSession().removeAttribute("gender");
                        request.getSession().removeAttribute("address");
                        request.getSession().removeAttribute("password");

//                        request.setAttribute("successMessage", "Đăng kí tài khoản thành công! Vui lòng đăng nhập.");
//                        request.getRequestDispatcher("login.jsp").forward(request, response);
//                        SendMail.sendCongratulationEmail(email);
                        try {
                            SendMail.sendCongratulationEmail(email);
                        } catch (Exception e) {
                            e.printStackTrace();
                            request.setAttribute("message", "Account created but failed to send email.");
                            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                            return;
                        }

                        request.setAttribute("successMessage", "Đăng kí tài khoản thành công! Vui lòng đăng nhập.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);

                    } else {
                        request.setAttribute("message", "Đăng kí tài khoản thất bại: Lỗi tạo người dùng");
                        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "Đăng kí tài khoản thất bại: Lỗi tạo tài khoản");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                throw new ServletException("Database error during registration", e);
            }
        } else {
            request.setAttribute("kq", "Xác nhận thất bại: Mã xác nhận không đúng");
            request.getRequestDispatcher("ConfirmCode.jsp").forward(request, response);
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

}
