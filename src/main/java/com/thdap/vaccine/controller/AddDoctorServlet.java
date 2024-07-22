package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.AccountDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.model.WorkLocation;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
        String username = null;
        String password = null;
        String email = null;
        String fullName = null;
        java.sql.Date doB = null;
        String phoneNumber = null;
        String address = null;
        String gender = null;
        int workLocationID = 0;
        String degreeType = null;
        int yearsOfExperience = 0;
        String filename = null;
        String jobTitle = null;

        try {
            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

            // Configure a repository (to ensure a secure temp location is used)
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            List<FileItem> items = upload.parseRequest(request);
            HashMap<String, String> fields = new HashMap<>();

            for (FileItem item : items) {
                if (item.isFormField()) {
                    fields.put(item.getFieldName(), item.getString("UTF-8"));
                } else {
                    filename = item.getName();
                    if (filename != null && !filename.isEmpty()) {
                        Path path = Paths.get(filename);
                        String storePath = servletContext.getRealPath("/uploads");
                        File uploadFile = new File(storePath, path.getFileName().toString());
                        item.write(uploadFile);
                    }
                }
            }

            // Extract and validate form fields
            username = fields.get("username");
            password = fields.get("password");
            email = fields.get("email");
            fullName = fields.get("fullName");
            phoneNumber = fields.get("phoneNumber");
            address = fields.get("address");
            gender = fields.get("gender");
            degreeType = fields.get("degreeType");
            jobTitle = fields.get("jobTitle");

            if (username == null || password == null || email == null || fullName == null
                    || fields.get("doB") == null || phoneNumber == null
                    || address == null || gender == null || fields.get("workLocationID") == null
                    || degreeType == null || fields.get("yearsOfExperience") == null || fields.get("jobTitle") == null) {
                request.setAttribute("errorMessage", "Invalid input parameters.");
                request.getRequestDispatcher("addDoctor.jsp").forward(request, response);
                return;
            }

            try {
                doB = java.sql.Date.valueOf(fields.get("doB"));
                workLocationID = Integer.parseInt(fields.get("workLocationID"));
                yearsOfExperience = Integer.parseInt(fields.get("yearsOfExperience"));
            } catch (IllegalArgumentException e) {
                request.setAttribute("errorMessage", "Ngày hoặc số không hợp lệ.");
                request.getRequestDispatcher("addDoctor.jsp").forward(request, response);
                return;
            }

            DoctorDAO doctorDAO = new DoctorDAO();
            AccountDAO accountDAO = new AccountDAO();

            try {
                // Check if email already exists
                if (accountDAO.emailExists(email)) {
                    request.setAttribute("errorMessage", "Email Đã tồn tại! Vui lòng thử lại.");
                    request.getRequestDispatcher("addDoctor.jsp").forward(request, response);
                    return;
                }
                
                if (accountDAO.usernameExists(username)) {
                    request.setAttribute("errorMessage", "Username Đã tồn tại! Vui lòng thử lại.");
                    request.getRequestDispatcher("addDoctor.jsp").forward(request, response);
                    return;
                }

                accountDAO.addAccount(roleID, username, password, email);
                int accountID = accountDAO.getAccountID(username);
                doctorDAO.addDoctor(fullName, accountID, filename, email, doB, phoneNumber, address, gender, workLocationID, degreeType, yearsOfExperience, jobTitle);
                response.sendRedirect("ListAccountServlet");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Thêm bác sĩ bị lỗi: " + e.getMessage());
                request.getRequestDispatcher("addDoctor.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error saving file: " + e.getMessage());
            request.getRequestDispatcher("addDoctor.jsp").forward(request, response);
            return;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
