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
        if ("delete".equals(action)) {
            try {
                deleteVaccine(request, response);
            } catch (SQLException ex) {
                throw new ServletException(ex);
            }
        }

    }

    private void deleteVaccine(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int vaccineID = Integer.parseInt(request.getParameter("id"));
        vaccineDAO.deleteVaccine(vaccineID);
        response.sendRedirect("CRUDVaccine.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            // Create a factory for disk-based file items
//            DiskFileItemFactory factory = new DiskFileItemFactory();
//
//            // Configure a repository (to ensure a secure temp location is used)
//            ServletContext servletContext = this.getServletConfig().getServletContext();
//            File repository = (File) servletContext.getAttribute("jakarta.servlet.context.tempdir");
//            factory.setRepository(repository);
//
//            // Create a new file upload handler
//            ServletFileUpload upload = new ServletFileUpload(factory);
//
//            // Parse the request
//            List<FileItem> items = upload.parseRequest(request);
//            HashMap<String, String> fields = new HashMap<>();
//            String filename = null;
//
//            for (FileItem item : items) {
//                if (item.isFormField()) {
//                    fields.put(item.getFieldName(), item.getString());
//                    System.out.println("name: " + item.getFieldName());
//                    System.out.println("value: " + item.getString());
//                } else {
//                    filename = item.getName();
//                    System.out.println("filename: " + filename);
//
//                    if (filename != null && !filename.isEmpty()) {
//                        Path path = Paths.get(filename);
//                        String storePath = servletContext.getRealPath("/uploads");
//                        File uploadFile = new File(storePath, path.getFileName().toString());
//                        item.write(uploadFile);
//                        System.out.println("Stored file at: " + uploadFile.getAbsolutePath());
//                    }
//                }
//            }
//
//            // Process additional form parameters
//            int vaccineID = Integer.parseInt(fields.get("vaccineID"));
//            String summary = fields.get("summary");
//            String source = fields.get("source");
//            int typeID = Integer.parseInt(fields.get("typeID"));
//            String injectionRoute = fields.get("injectionRoute");
//            String contraindicated = fields.get("contraindicated");
//            String usingNote = fields.get("usingNote");
//            String drugInteractions = fields.get("drugInteractions");
//            String unwantedEffects = fields.get("unwantedEffects");
//            String preserve = fields.get("preserve");
//            String objectOfUse = fields.get("objectOfUse");
//            String injectionRegimen = fields.get("injectionRegimen");
//            int price = Integer.parseInt(fields.get("price"));
//            boolean haveToOrder = fields.get("haveToOrder") != null;
//
//            // Create and save or update Vaccine object
//            Vaccine vaccine = new Vaccine();
//            vaccine.setVaccineID(vaccineID);
//            vaccine.setSummary(summary);
//            vaccine.setSource(source);
//            vaccine.setTypeID(typeID);
//            vaccine.setInjectionRoute(injectionRoute);
//            vaccine.setContraindicated(contraindicated);
//            vaccine.setUsingNote(usingNote);
//            vaccine.setDrugInteractions(drugInteractions);
//            vaccine.setUnwantedEffects(unwantedEffects);
//            vaccine.setPreserve(preserve);
//            vaccine.setObjectOfUse(objectOfUse);
//            vaccine.setInjectionRegimen(injectionRegimen);
//            vaccine.setPrice(price);
//            vaccine.setHaveToOrder(haveToOrder);
//            if (filename != null && !filename.isEmpty()) {
//                vaccine.setImage(filename);
//            } 
//                vaccineDAO.updateVaccine(vaccineID, summary, source, typeID, filename, injectionRoute, contraindicated, usingNote, drugInteractions, unwantedEffects, preserve, objectOfUse, injectionRegimen, price, haveToOrder);
//                System.out.println("//====== Update ======");
//            
//
//            // Redirect or forward to appropriate view
//            request.setAttribute("LIST_VACCINE", vaccineDAO.getAllVaccines());
//            request.getRequestDispatcher("CRUDVaccine.jsp").forward(request, response);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }

//        if (fileName != null && isImageFile(fileName)) {
//            int vaccineID = Integer.parseInt(request.getParameter("vaccineID"));
//            String summary = request.getParameter("summary");
//            String source = request.getParameter("source");
//            int typeID = Integer.parseInt(request.getParameter("typeID"));
//            String injectionRoute = request.getParameter("injectionRoute");
//            String contraindicated = request.getParameter("contraindicated");
//            String usingNote = request.getParameter("usingNote");
//            String drugInteractions = request.getParameter("drugInteractions");
//            String unwantedEffects = request.getParameter("unwantedEffects");
//            String preserve = request.getParameter("preserve");
//            String objectOfUse = request.getParameter("objectOfUse");
//            String injectionRegimen = request.getParameter("injectionRegimen");
//            int price = Integer.parseInt(request.getParameter("price"));
//            boolean haveToOrder = request.getParameter("haveToOrder") != null;
//
//            try {
//                vaccineDAO.updateVaccine(vaccineID, summary, source, typeID, fileName, injectionRoute, contraindicated, usingNote, drugInteractions, unwantedEffects, preserve, objectOfUse, injectionRegimen, price, haveToOrder);
//                Vaccine existingVaccine = vaccineDAO.getVaccineByID(vaccineID);
//                request.setAttribute("vaccine", existingVaccine);
//                response.sendRedirect("CRUDVaccine.jsp");
//            } catch (SQLException e) {
//                e.printStackTrace();
//                response.sendRedirect("error.jsp");
//            }
//        } else {
//            response.sendRedirect("error.jsp");
//        }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
