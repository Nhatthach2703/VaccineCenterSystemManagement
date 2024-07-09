/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.AccountDAO;
import com.thdap.vaccine.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
@WebServlet(name = "ForgotPassServlet", urlPatterns = {"/ForgotPassServlet"})
public class ForgotPassServlet extends HttpServlet {

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
            out.println("<title>Servlet ForgotPassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        try {
            // lay email tu form ben forgotpassword.jsp
            String email = request.getParameter("email");
            // khoi tao accountDAO
            AccountDAO accountDAO = new AccountDAO();
            // khoi tai accout model
            Account account = new Account();
            // gang gia tri account = ham getaccountemail thong qua accountDAO
            account = accountDAO.getAccountEmail(email);
            if (account != null) {
                if (account.getRoleID().equalsIgnoreCase("Doctor") || account.getRoleID().equalsIgnoreCase("Admin")) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
                    request.setAttribute("message", "Tài khoản nội bộ không thể tự đổi mật khẩu vui lòng liên hệ bộ phận IT!");
                    dispatcher.forward(request, response);
                } else {
                    RequestDispatcher dispatcher = null;
                    int otpvalue = 0;
                    final HttpSession mySession = request.getSession();

                    if (email != null || !email.equals("")) {
                        // sending otp
                        Random rand = new Random();
                        otpvalue = 1000 + rand.nextInt(9000); // Tạo một số ngẫu nhiên từ 1000 đến 9999 (bao gồm cả 1000 và 9999)

                        ;

                        String to = email;// change accordingly

                        Properties props = new Properties();
                        props.put("mail.smtp.auth", "true");
                        props.put("mail.smtp.ssl.enable", "true");
                        props.put("mail.smtp.host", "smtp.gmail.com");
                        props.put("mail.smtp.port", "465");
                        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
                        props.put("mail.debug", "true");
                        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                            @Override
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication("hethongtrungtamtiemchungthdap@gmail.com", "npcm pgme fpuu xgwv");// Put your email
                                // password here
                            }
                        });
                        // compose message
                        try {
                            MimeMessage message = new MimeMessage(session);
                            message.setFrom(new InternetAddress(email));// change accordingly
                            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                            message.setSubject("Thông Tin Mã OTP Cho Quá Trình Thiết Lập Lại Mật Khẩu");
                            message.setText("Chào bạn,\n"
                                    + "\n"
                                    + "Chúng tôi nhận được yêu cầu thiết lập lại mật khẩu từ bạn. Để tiếp tục quá trình này, vui lòng sử dụng mã OTP dưới đây:\n"
                                    + "\n"
                                    + "Mã OTP của bạn là: " + otpvalue + "\n"
                                    + "\n"
                                    + "Vui lòng nhập mã OTP này vào trang thiết lập lại mật khẩu để tiếp tục quá trình thiết lập lại mật khẩu.\n"
                                    + "\n"
                                    + "Nếu bạn không yêu cầu thiết lập lại mật khẩu, vui lòng liên hệ với chúng tôi ngay để bảo vệ tài khoản của bạn.\n"
                            );
                            // send message
                            Transport.send(message);
                            System.out.println("message sent successfully");
                        } catch (MessagingException e) {
                            System.out.println("Fail!");
                            throw new RuntimeException(e);
                        }
                        dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
                        request.setAttribute("message", "OTP is sent to your email");

                        mySession.setAttribute("otp", otpvalue);
                        mySession.setAttribute("email", email);
                        dispatcher.forward(request, response);
                    }
                }
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
                request.setAttribute("message", "No email found!");
                dispatcher.forward(request, response);
            }
        } catch (Exception ex) {
//            Logger.getLogger(ForgotPass.class.getName()).log(Level.SEVERE, null, ex);
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
