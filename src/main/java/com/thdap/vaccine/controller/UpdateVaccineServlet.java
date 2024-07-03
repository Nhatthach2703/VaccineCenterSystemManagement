/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.TypeOfVaccineDAO;
import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.model.TypeOfVaccine;
import com.thdap.vaccine.model.Vaccine;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UpdateVaccineServlet", urlPatterns = {"/UpdateVaccineServlet"})
public class UpdateVaccineServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("vaccineID"));

        Vaccine v = vaccineDAO.getVaccineById(id);
        request.setAttribute("vaccine", v);
        TypeOfVaccineDAO typeOfVaccineDAO = new TypeOfVaccineDAO();
        List<TypeOfVaccine> typeOfVaccines = typeOfVaccineDAO.getAllTypesOfVaccine();
        request.setAttribute("typeOfVaccines", typeOfVaccines);
        String errorMessage = (String) request.getSession().getAttribute("errorMessage");
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            // Remove the error message from the session
            request.getSession().removeAttribute("errorMessage");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateVaccine.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private VaccineDAO vaccineDAO = new VaccineDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            // Create a factory for disk-based file items
            String id = request.getParameter("vaccineID");
            System.out.println(id);
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
            String filename = null;
            String existingImage = null;

            for (FileItem item : items) {
                if (item.isFormField()) {
                    fields.put(item.getFieldName(), item.getString("UTF-8"));
                    if (item.getFieldName().equals("existingImage")) {
                        existingImage = item.getString("UTF-8");
                    }
                    System.out.println("name: " + item.getFieldName());
                    System.out.println("value: " + item.getString("UTF-8"));
                } else {
                    filename = item.getName();
                    System.out.println("filename: " + filename);

                    if (filename != null && !filename.isEmpty()) {
                        Path path = Paths.get(filename);
                        String storePath = servletContext.getRealPath("/uploads");
                        File uploadFile = new File(storePath, path.getFileName().toString());
                        item.write(uploadFile);
                        System.out.println("Stored file at: " + uploadFile.getAbsolutePath());
                    }
                }
            }

            // Process additional form parameters
            int vaccineID = Integer.parseInt(fields.get("vaccineID"));
            String name = fields.get("name");
            String summary = fields.get("summary");
            String source = fields.get("source");
            int typeID = Integer.parseInt(fields.get("typeID"));
            String injectionRoute = fields.get("injectionRoute");
            String contraindicated = fields.get("contraindicated");
            String usingNote = fields.get("usingNote");
            String drugInteractions = fields.get("drugInteractions");
            String unwantedEffects = fields.get("unwantedEffects");
            String preserve = fields.get("preserve");
            String objectOfUse = fields.get("objectOfUse");
            String injectionRegimen = fields.get("injectionRegimen");
            int price = Integer.parseInt(fields.get("price"));
            boolean haveToOrder = fields.get("haveToOrder") != null;

            // Create and save or update Vaccine object
            Vaccine vaccine = new Vaccine();
            vaccine.setVaccineID(vaccineID);
            vaccine.setName(name);
            vaccine.setSummary(summary);
            vaccine.setSource(source);
            vaccine.setTypeID(typeID);
            vaccine.setInjectionRoute(injectionRoute);
            vaccine.setContraindicated(contraindicated);
            vaccine.setUsingNote(usingNote);
            vaccine.setDrugInteractions(drugInteractions);
            vaccine.setUnwantedEffects(unwantedEffects);
            vaccine.setPreserve(preserve);
            vaccine.setObjectOfUse(objectOfUse);
            vaccine.setInjectionRegimen(injectionRegimen);
            vaccine.setPrice(price);
            vaccine.setHaveToOrder(haveToOrder);
            if (filename != null && !filename.isEmpty()) {
                vaccine.setImage(filename);
            } else {
                vaccine.setImage(existingImage);
            }
//            vaccineDAO.updateVaccine(vaccine);
            if (vaccineDAO.isVaccineExists(name)) {
                // Set the error message as a session attribute
                request.getSession().setAttribute("errorMessage", "Tên loại vaccine đã tồn tại");
                // Redirect to the form page
                response.sendRedirect("UpdateVaccineServlet?vaccineID=" + vaccineID);
            } else {
                vaccineDAO.updateVaccine(vaccine);
                response.sendRedirect("ListVaccineServlet");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
