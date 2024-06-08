package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.AccountDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.model.WorkLocation;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class AddDoctorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddDoctorServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDoctorServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        try {
            List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();
            System.out.println("Work Locations: " + workLocations); // Debug statement
            request.setAttribute("workLocations", workLocations);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading work locations: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("addDoctor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String roleID = "Doctor";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        java.sql.Date doB = null;
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        int workLocationID = 0;
        String degreeType = request.getParameter("degreeType");
        int yearsOfExperience = 0;

        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        // Sử dụng thư mục src/main/webapp/uploads để lưu trữ file
        String uploadDir = "D:\\SWP391\\Code\\VaccineCenterSystemManagement\\src\\main\\webapp\\uploads";

        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }

        File file = new File(uploadDirFile, fileName);
        try {
            filePart.write(file.getAbsolutePath());
            if (file.exists()) {
                System.out.println("File saved successfully: " + file.getAbsolutePath());
            } else {
                throw new IOException("Failed to save file: " + file.getAbsolutePath());
            }
        } catch (IOException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error saving file: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        String image = "uploads/" + fileName;

        // Kiểm tra dữ liệu đầu vào
        if (username == null || password == null || email == null || fullName == null || 
            request.getParameter("doB") == null || phoneNumber == null || 
            address == null || gender == null || request.getParameter("workLocationID") == null || 
            degreeType == null || request.getParameter("yearsOfExperience") == null) {
            request.setAttribute("errorMessage", "Invalid input parameters.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Chuyển đổi dữ liệu đầu vào
        try {
            doB = java.sql.Date.valueOf(request.getParameter("doB"));
            workLocationID = Integer.parseInt(request.getParameter("workLocationID"));
            yearsOfExperience = Integer.parseInt(request.getParameter("yearsOfExperience"));
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", "Invalid date or number format.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        DoctorDAO doctorDAO = new DoctorDAO();
        AccountDAO accountDAO = new AccountDAO();
        
        try {
            // Kiểm tra email đã tồn tại
            if (accountDAO.emailExists(email)) {
                request.setAttribute("errorMessage", "Email already exists.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            accountDAO.addAccount(roleID, username, password, email);
            int accountID = accountDAO.getAccountID(username);
            doctorDAO.addDoctor(fullName, accountID, image, email, doB, phoneNumber, address, gender, workLocationID, degreeType, yearsOfExperience);
            response.sendRedirect("success.jsp");
        } catch (SQLException e) {
            // Log lỗi để dễ dàng debug
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error adding doctor: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
