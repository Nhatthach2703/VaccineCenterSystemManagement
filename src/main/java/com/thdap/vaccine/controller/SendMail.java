/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.controller;
import java.time.LocalTime;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;
import javax.activation.DataSource;
/**
 *
 * @author ADMIN
 */
public class SendMail {
    public static String generateRandomFourDigits() {
    Random random = new Random();
    StringBuilder sb = new StringBuilder();

    for (int i = 0; i < 4; i++) {
        int digit = random.nextInt(10); // Sinh ra một số nguyên ngẫu nhiên từ 0 đến 9
        sb.append(digit); // Thêm số này vào StringBuilder
    }

    return sb.toString(); // Chuyển đổi StringBuilder thành chuỗi và trả về
}

    public static void sendVerificationEmail(String to, String code) {
        final String from = "hethongtrungtamtiemchungthdap@gmail.com";
        final String password = "sdlrilkbzljylemz";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(from);

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject("Code xác nhận");

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Nội dung email với mã xác nhận
            String emailContent = "<h3>Xin chào!</h3>" +
                                  "<p>Mã xác nhận của bạn là: <b>" + code + ".</b></p>" +
                                  "<p>Vui lòng nhập mã này để hoàn tất đăng ký.</p>";
            msg.setContent(emailContent, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");

        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
        }
    }
    
    
      public static void sendCongratulationEmail(String to) {
        final String from = "hethongtrungtamtiemchungthdap@gmail.com";
        final String password = "sdlrilkbzljylemz";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(from);

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
//            msg.setSubject("Code xác nhận");
             msg.setSubject("Thông báo tạo tài khoản thành công");
            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Nội dung email với mã xác nhận
            String emailContent = "<h3>Xin chào!</h3>" +
                                  "<p>Chúc mừng bạn đã đăng kí tài khoản thành công.</p>" +
                                  "<p>Hi vọng bạn sẽ có những trải nghiệm tốt khi sử dụng dịch vụ của hệ thống THDAP.</p>";
            msg.setContent(emailContent, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");

        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
        }
    }
      
    public static void sendConsultationScheduleEmail(String userName, String to, Date date, LocalTime startTime, LocalTime endTime, String wName, String wAdress) {
        final String from = "hethongtrungtamtiemchungthdap@gmail.com";
        final String password = "sdlrilkbzljylemz";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(from);

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject("Thông báo đặt lịch tư vấn thành công!");
            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Nội dung email với mã xác nhận
            String emailContent = "<h3>Xin chào "+ userName +"!</h3>"
                    + "<p>Chúc mừng bạn đã đặt lịch tư vấn thành công!</p>"
                    + "<p>Bạn vui lòng đến " + wName + " vào lúc: " + startTime + " - " + endTime + ", ngày " + date + ", địa điểm: " + wAdress + " để buổi tư vấn cỏ thể diễn ra suông sẻ.</p>"
                    + "<p>Hi vọng bạn sẽ có những trải nghiệm tốt khi sử dụng dịch vụ của hệ thống THDAP.</p>"
                    + "<p>Một lần nữa xin cảm ơn bạn đã tin tưởng chọn dịch vụ của chúng tôi.</p>"
                    + "<p>Chúc bạn một ngày tốt lành!</p>";
            msg.setContent(emailContent, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");

        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
        }
    }
    
    public static void sendInjectionScheduleEmail(String userName, String to, Date date, LocalTime startTime, LocalTime endTime, String wName, String wAdress) {
        final String from = "hethongtrungtamtiemchungthdap@gmail.com";
        final String password = "sdlrilkbzljylemz";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(from);

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject("Thông báo đặt lịch tiêm thành công!");
            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Nội dung email với mã xác nhận
            String emailContent = "<h3>Xin chào " + userName + "!</h3>"
                    + "<p>Chúc mừng bạn đã đặt lịch tiêm thành công!</p>"
                    + "<p>Bạn vui lòng đến " + wName + " vào lúc: " + startTime + " - " + endTime + ", ngày " + date + ", địa điểm: " + wAdress + " để việc khám sáng lọc trước tiêm, tiêm và quan sát hậu tiêm chủng thể diễn ra suông sẻ.</p>"
                    + "<p>Hi vọng bạn sẽ có những trải nghiệm tốt khi sử dụng dịch vụ của hệ thống THDAP.</p>"
                    + "<p>Một lần nữa xin cảm ơn bạn đã tin tưởng chọn dịch vụ của chúng tôi.</p>"
                    + "<p>Chúc bạn một ngày tốt lành!</p>";
            msg.setContent(emailContent, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");

        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String to = "hethongtrungtamtiemchungthdap@gmail.com";
        String code = generateRandomFourDigits();
        sendVerificationEmail(to, code);
        sendCongratulationEmail(to);
    }
}
