  
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;


import com.thdap.vaccine.dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/SignUpServlet"})
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet signUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signUp at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String fullName = request.getParameter("fullName");
        String username = request.getParameter("userName");
        String email = request.getParameter("email");
        String doBString = request.getParameter("doB");
        LocalDate dob = null;
//        try {
//            dob = LocalDate.parse(doBString);
//        } catch (DateTimeParseException e) {
//            request.setAttribute("kq", "Ngày sinh không hợp lệ");
//            setRequestAttributes(request, fullName, username, email, null, request.getParameter("phoneNumber"), request.getParameter("gender"), request.getParameter("address"), request.getParameter("pass"), request.getParameter("re_pass"));
//            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
//            return;
//        }
//        LocalDate dob = LocalDate.parse(request.getParameter("doB"));
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String password = request.getParameter("pass");
        String rePass = request.getParameter("re_pass");

        // Validate the password
        
        if (fullName.isEmpty()
                || username.isEmpty()
                || email.isEmpty()
//                || dob == null
                || phoneNumber.isEmpty()
                || gender == null
                || address.isEmpty()
                || password.isEmpty()
                || rePass.isEmpty()) {
            request.setAttribute("kq", "Vui lòng nhập đầy đủ thông tin");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
        }

        AccountDAO dao = new AccountDAO();
        try {

            // Check if the username or email already exists
            if (dao.usernameExists(username)) {
                setRequestAttributes(request, fullName, username, email, dob, phoneNumber, gender, address, password, rePass);
                request.setAttribute("kq", "Đăng kí tài khoản thất bại: Tên người dùng đã tồn tại");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                return;
            }

            if (dao.emailExists(email)) {
                setRequestAttributes(request, fullName, username, email, dob, phoneNumber, gender, address, password, rePass);
                request.setAttribute("kq", "Đăng kí tài khoản thất bại: Email đã tồn tại");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                return;
            }
            // Save user details in session
            request.getSession().setAttribute("fullName", fullName);
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("email", email);
            request.getSession().setAttribute("dob", dob);
            request.getSession().setAttribute("phoneNumber", phoneNumber);
            request.getSession().setAttribute("gender", gender);
            request.getSession().setAttribute("address", address);
            request.getSession().setAttribute("password", password);
            // Generate verification code
            String verificationCode = SendMail.generateRandomFourDigits();
            // Save verification code in session
            request.getSession().setAttribute("verificationCode", verificationCode);
            // Send verification email
            SendMail.sendVerificationEmail(email, verificationCode);
            // Redirect to the confirmation page
            response.sendRedirect("ConfirmCode.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Database error during registration", e);
        }
    }

    private void setRequestAttributes(HttpServletRequest request, String fullName, String username, String email, LocalDate dob, String phoneNumber, String gender, String address, String password, String rePass) {
        request.setAttribute("fullName", fullName);
        request.setAttribute("userName", username);
        request.setAttribute("email", email);
        request.setAttribute("dob", dob);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("gender", gender);
        request.setAttribute("address", address);
        request.setAttribute("pass", password);
        request.setAttribute("re_pass", rePass);
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
