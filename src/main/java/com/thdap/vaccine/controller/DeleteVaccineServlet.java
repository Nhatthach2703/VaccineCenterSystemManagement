package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.model.Vaccine;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "DeleteVaccineServlet", urlPatterns = {"/DeleteVaccineServlet"})
@MultipartConfig
public class DeleteVaccineServlet extends HttpServlet {

    private VaccineDAO vaccineDAO = new VaccineDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        int vaccineID = Integer.parseInt(request.getParameter("id"));
        if ("delete".equals(action)) {
            try {
                vaccineDAO.deleteVaccine(vaccineID);
            } catch (Exception ex) {
                response.sendRedirect("error.jsp");
            }
            response.sendRedirect("ListVaccineServlet");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
