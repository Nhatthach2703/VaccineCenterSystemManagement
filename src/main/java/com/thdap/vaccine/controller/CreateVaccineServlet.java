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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ADMIN
 */
@MultipartConfig(maxFileSize = 16177215) // 16 MB
@WebServlet(name = "CreateVaccineServlet", urlPatterns = {"/CreateVaccineServlet"})
public class CreateVaccineServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateVaccineServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateVaccineServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        TypeOfVaccineDAO typeOfVaccineDAO = new TypeOfVaccineDAO();
        List<TypeOfVaccine> typeOfVaccines = typeOfVaccineDAO.getAllTypesOfVaccine();
        request.setAttribute("typeOfVaccines", typeOfVaccines);
        request.getRequestDispatcher("CreateVaccine.jsp").forward(request, response);

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

            // Process additional form parameters and validate required fields
            String name = fields.get("name");
            String summary = fields.get("summary");
            String source = fields.get("source");
            String typeIDStr = fields.get("typeID");
            String injectionRoute = fields.get("injectionRoute");
            String contraindicated = fields.get("contraindicated");
            String usingNote = fields.get("usingNote");
            String drugInteractions = fields.get("drugInteractions");
            String unwantedEffects = fields.get("unwantedEffects");
            String preserve = fields.get("preserve");
            String objectOfUse = fields.get("objectOfUse");
            String injectionRegimen = fields.get("injectionRegimen");
            String priceStr = fields.get("price");
            boolean haveToOrder = fields.get("haveToOrder") != null;

            // Validate required fields
            if (name == null || summary == null || source == null || typeIDStr == null || injectionRoute == null
                    || contraindicated == null || usingNote == null || drugInteractions == null || unwantedEffects == null
                    || preserve == null || objectOfUse == null || injectionRegimen == null || priceStr == null) {
                request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin.");
                request.getRequestDispatcher("CreateVaccine.jsp").forward(request, response);
                return;
            }

            int typeID = Integer.parseInt(typeIDStr);
            int price = Integer.parseInt(priceStr);

            // Create and save or update Vaccine object
            Vaccine vaccine = new Vaccine();
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
            }

            vaccineDAO.addVaccine(name, summary, source, typeID, filename, injectionRoute, contraindicated, usingNote,
                    drugInteractions, unwantedEffects, preserve, objectOfUse, injectionRegimen, price, haveToOrder);
            request.setAttribute("vaccines", vaccineDAO.getAllVaccines());

            // Redirecting to the list servlet
            response.sendRedirect("ListVaccineServlet");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
