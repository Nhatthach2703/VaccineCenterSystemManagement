/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.model.OrderVaccineInfo;
import com.thdap.vaccine.model.Vaccine;
import com.thdap.vaccine.model.WorkLocation;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
            String emailContent = "<h3>Xin chào!</h3>"
                    + "<p>Mã xác nhận của bạn là: <b>" + code + ".</b></p>"
                    + "<p>Vui lòng nhập mã này để hoàn tất đăng ký.</p>";
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
            String emailContent = "<h3>Xin chào!</h3>"
                    + "<p>Chúc mừng bạn đã đăng kí tài khoản thành công.</p>"
                    + "<p>Hi vọng bạn sẽ có những trải nghiệm tốt khi sử dụng dịch vụ của hệ thống THDAP.</p>";
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
            String emailContent = "<h3>Xin chào " + userName + "!</h3>"
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

    public static void sendOrderConfirmationEmail(String to, String userName, OrderVaccineInfo orderInfo, WorkLocation workLocation, Vaccine vaccine) {
        final String from = "hethongtrungtamtiemchungthdap@gmail.com";
        final String password = "sdlrilkbzljylemz"; // Remember to keep this secure

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
            msg.setSubject("Xác nhận Đơn hàng Tiêm chủng Vaccine", "UTF-8");

            // Quy định ngày gửi
            msg.setSentDate(new Date());

            // Nội dung email với mã xác nhận
            String emailContent = "<h3>Kính gửi quý khách " + userName + ",</h3>"
                    + "<p>Trung tâm tiêm chủng THDAP xin thông báo đến quý khách rằng đơn hàng của quý khách đã được xác nhận như sau:</p>"
                    + "<p><strong>Người đặt:</strong> " + userName + "</p>"
                    + "<p><strong>Sản phẩm:</strong> Vaccine " + vaccine.getName() + "</p>"
                    + "<p><strong>Ngày tiêm dự kiến:</strong> " + orderInfo.getDateWantToGetVaccinated() + "</p>"
                    + "<p><strong>Địa điểm tiêm:</strong> " + workLocation.getName() + " - " + workLocation.getAddress() + " </p>"
                    + "<p><strong>Đã thanh toán với tổng số tiền là:</strong> " + orderInfo.getTotalPrice() + " VNĐ</p>"
                    + "<p>Trân trọng thông báo và chúc quý khách sức khỏe!</p>"
                    + "<br>"
                    + "<p>Trân trọng,</p>"
                    + "<p>THDAP</p>";
            msg.setContent(emailContent, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email xác nhận đơn hàng thành công đến " + to);

        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email xác nhận đơn hàng");
            e.printStackTrace();
        }
    }

    public static void sendInjectionScheduleReminder(String to, String username, LocalDate dateOfNextInjection) {
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

        Session session = Session.getInstance(props, auth);

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject("Thông báo nhắc nhở lịch tiêm vaccine");

            String formattedDate = dateOfNextInjection.toString();

            String emailContent = "<h3>Kính gửi quý khách" + username + "</h3>"
                    + "<p>Thông báo nhắc nhở về lịch hẹn tiêm vaccine của bạn.</p>"
                    + "<p>Lịch hẹn tiêm của bạn là vào ngày " + formattedDate + ".</p>"
                    + "<p>Đề nghị bạn sắp xếp thời gian và đến đúng giờ.</p>"
                    + "<p>Trân trọng,</p>"
                    + "<p>THDAP</p>";

            msg.setContent(emailContent, "text/html; charset=UTF-8");
            Transport.send(msg);
            System.out.println("Gửi email thành công");

        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
        }
    }

 
    
    // New functions for sending review emails
    public static void sendReviewConsultationEmail(String to, int userID) {
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
            msg.setSubject("Cảm ơn quý khách đã sử dụng dịch vụ tư vấn tại THDAP!");

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Nội dung email
            String emailContent = "<h3>Kính gửi quý khách hàng,</h3>" +
                                  "<p>Trung tâm dịch vụ tiêm chủng THDAP xin gửi lời cảm ơn chân thành tới quý khách vì đã tin tưởng và sử dụng dịch vụ tư vấn của chúng tôi. Chúng tôi hy vọng rằng những thông tin và sự tư vấn từ đội ngũ của chúng tôi đã giúp quý khách có được những kiến thức bổ ích và an tâm hơn về sức khỏe.</p>" +
                                  "<p>Để giúp chúng tôi cải thiện và nâng cao chất lượng dịch vụ, xin quý khách vui lòng dành chút thời gian để đánh giá về dịch vụ của chúng tôi theo đường link sau: <a href='http://localhost:8080/Vaccine/RateServiceServlet?userID=" + userID + "&type=Tư vấn'>link đánh giá dịch vụ tư vấn</a></p>" +
                                  "<p>Chúng tôi rất mong được lắng nghe ý kiến đóng góp từ quý khách để phục vụ tốt hơn trong tương lai.</p>" +
                                  "<p>Trân trọng,<br>THDAP</p>";
            msg.setContent(emailContent, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email mời đánh giá buổi tư vấn thành công");

        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email mời đánh giá buổi tư vấn");
            e.printStackTrace();
        }
    }

    public static void sendReviewInjectionEmail(String to, int userID) {
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
            msg.setSubject("Cảm ơn quý khách đã sử dụng dịch vụ tiêm chủng tại THDAP!");

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Nội dung email
            String emailContent = "<h3>Kính gửi quý khách hàng,</h3>" +
                                  "<p>Trung tâm dịch vụ tiêm chủng THDAP xin gửi lời cảm ơn chân thành tới quý khách vì đã tin tưởng và sử dụng dịch vụ tiêm chủng của chúng tôi. Chúng tôi hy vọng rằng trải nghiệm của quý khách tại trung tâm đã mang lại sự hài lòng và an tâm.</p>" +
                                  "<p>Để giúp chúng tôi ngày càng hoàn thiện hơn và mang đến chất lượng dịch vụ tốt nhất, xin quý khách vui lòng dành chút thời gian để đánh giá về dịch vụ của chúng tôi theo đường link sau: <a href='http://localhost:8080/Vaccine/RateServiceServlet?userID=" + userID + "&type=Tiêm'>link đánh giá dịch vụ tiêm</a></p>" +
                                  "<p>Một lần nữa, chúng tôi xin chân thành cảm ơn và rất mong được tiếp tục phục vụ quý khách trong tương lai.</p>" +
                                  "<p>Trân trọng,<br>THDAP</p>";
            msg.setContent(emailContent, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email mời đánh giá buổi tiêm thành công");

        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email mời đánh giá buổi tiêm");
            e.printStackTrace();
        }
    }

    
    public static void main(String[] args) {
        String to = "duyentttde170176@fpt.edu.vn";
        String code = generateRandomFourDigits();
        sendVerificationEmail(to, code);
        sendCongratulationEmail(to);
      
    }

}
