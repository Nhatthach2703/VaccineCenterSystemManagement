package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.AccountDAO;
import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.InjectionInfoDAO;
import com.thdap.vaccine.dao.NewsDAO;
import com.thdap.vaccine.dao.NotificationsDAO;
import com.thdap.vaccine.dao.ServiceReviewDAO;
import com.thdap.vaccine.dao.TypeOfVaccineDAO;
import com.thdap.vaccine.dao.UserDAO;
import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.model.Account;
import com.thdap.vaccine.model.Doctor;
import com.thdap.vaccine.model.InjectionInfo;
import com.thdap.vaccine.model.Notifications;
import com.thdap.vaccine.model.ServiceReview;
import com.thdap.vaccine.model.TypeOfVaccine;
import com.thdap.vaccine.model.User;
import com.thdap.vaccine.model.Vaccine;
import com.thdap.vaccine.model.WorkLocation;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "homeIndex", urlPatterns = {"/homeIndex"})
public class homeIndex extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private VaccineDAO vaccineDao = new VaccineDAO();
    private TypeOfVaccineDAO typeOfVaccineDAO = new TypeOfVaccineDAO();
    private NotificationsDAO notificationsDAO = new NotificationsDAO();
    private InjectionInfoDAO injectionInfoDAO = new InjectionInfoDAO();
    private UserDAO userDAO = new UserDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Vaccine> vaccines = vaccineDao.getAllVaccines();
        List<TypeOfVaccine> typeOfVaccines = typeOfVaccineDAO.getAllTypesOfVaccine();
        request.setAttribute("vaccine", vaccines);
        request.setAttribute("typeOfVaccines", typeOfVaccines);
        DoctorDAO doctorDAO = new DoctorDAO();
        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        List<Doctor> doctors = doctorDAO.getAllDoctors();
        List<Doctor> filteredDoctors = new ArrayList<>();

        for (Doctor doctor : doctors) {
            if ("Giám đốc".equalsIgnoreCase(doctor.getJobTitle()) || "Phó giám đốc".equalsIgnoreCase(doctor.getJobTitle())) {
                filteredDoctors.add(doctor);
            }
        }
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();
        request.setAttribute("workLocations", workLocations);
        request.setAttribute("doctors", filteredDoctors);
        NewsDAO newsDAO = new NewsDAO();
        List<com.thdap.vaccine.model.News> newsList = newsDAO.getAllNews();
        int maxNews = 4; // Giới hạn số lượng mục

// Kiểm tra nếu danh sách có ít hơn hoặc bằng 4 mục
        if (newsList.size() > maxNews) {
            newsList = newsList.subList(0, maxNews);
        }

// Đặt dữ liệu vào thuộc tính yêu cầu để chuyển tới JSP
        request.setAttribute("listNews", newsList);
        ServiceReviewDAO serviceReviewDAO = new ServiceReviewDAO();
        UserDAO userDAO = new UserDAO();
        AccountDAO accountDAO = new AccountDAO();
        List<User> users = userDAO.getAllUsers();
        request.setAttribute("users", users);
        List<Account> accounts = accountDAO.getAllAccounts();
        request.setAttribute("accounts", accounts);
        List<ServiceReview> serviceReviews = serviceReviewDAO.getFiveStarReview();
        request.setAttribute("serviceReviews", serviceReviews);
        sendEmailReminders();

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    public void sendEmailReminders() {
        List<Notifications> notifications = notificationsDAO.getPendingNotifications();

        for (Notifications notification : notifications) {
            int injectionInfoID = notification.getInjectionInfoID();
            InjectionInfo injectionInfo = injectionInfoDAO.getInjectionInfoById(injectionInfoID);
            if (injectionInfo != null) {
                LocalDate dateOfNextInjection = injectionInfo.getDateOfNextInjection().toLocalDate();// biến cái ni về lcalDate
                LocalTime currentTime = LocalTime.now();
                LocalTime startHour = LocalTime.of(9, 0);
                LocalTime endHour = LocalTime.of(23, 0);
                if (isOneDayBefore(dateOfNextInjection) && !notification.isStatus() && currentTime.isAfter(startHour) && currentTime.isBefore(endHour)) { // thêm đk trong khung giờ và đã đc gửi chưa
                    User user = userDAO.getUserByUserFileID(injectionInfo.getUserFileID());
                    if (user != null) {
                        String email = user.getEmail();
                        String username = user.getFullName();
                        SendMail.sendInjectionScheduleReminder(email, username, dateOfNextInjection);
                        notification.setStatus(true); // Cập nhật trạng thái thành 1 (đã gửi)
                        notificationsDAO.updateNotificationStatus(notification);
                    }
                }
            }
        }
    }

    private boolean isOneDayBefore(LocalDate dateOfNextInjection) {
        LocalDate tomorrow = LocalDate.now().plusDays(1);
        return tomorrow.equals(dateOfNextInjection);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
