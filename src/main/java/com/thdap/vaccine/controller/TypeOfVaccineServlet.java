package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.TypeOfVaccineDAO;
import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.model.TypeOfVaccine;
import com.thdap.vaccine.model.Vaccine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@WebServlet(name = "TypeOfVaccineServlet", urlPatterns = {"/TypeOfVaccineServlet"})
public class TypeOfVaccineServlet extends HttpServlet {

    private VaccineDAO vaccineDAO = new VaccineDAO();
    private TypeOfVaccineDAO typeOfVaccineDAO = new TypeOfVaccineDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Get list of types of vaccine
        List<TypeOfVaccine> typeOfVaccines = typeOfVaccineDAO.getAllTypesOfVaccine();
        request.setAttribute("typeOfVaccines", typeOfVaccines);

        // Check for search parameters
        String searchValue = request.getParameter("searchValue");
        String typeName = request.getParameter("typeName");
        String source = request.getParameter("source");
        List<Vaccine> vaccines;
        List<Vaccine> vaccine_1;

        String typeIDParam = request.getParameter("typeID");

        if ((typeName != null && !typeName.isEmpty()) || (source != null && !source.isEmpty())) {
            vaccines = vaccineDAO.searchVaccinesByOptions(typeName, source);
        } else if (searchValue != null && !searchValue.isEmpty()) {
            vaccines = vaccineDAO.searchVaccines(Optional.of(searchValue));
        } else if (typeIDParam != null && !typeIDParam.isEmpty()) {
            int typeID = Integer.parseInt(typeIDParam); // Convert typeIDParam to an integer
            vaccines = vaccineDAO.getVaccinesByType(typeID);
        } else {
            vaccines = vaccineDAO.getAllVaccines();
        }
        vaccine_1 = vaccineDAO.getAllVaccines();
        // Extract unique sources from the list of vaccines
        Set<String> uniqueSources = new LinkedHashSet<>();
        for (Vaccine vaccine : vaccine_1) {
            uniqueSources.add(vaccine.getSource());
        }

        request.setAttribute("vaccines", vaccines);
        request.setAttribute("uniqueSources", uniqueSources);
        request.getRequestDispatcher("TypeOfVaccine.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String searchValue = request.getParameter("searchValue");
        String typeName = request.getParameter("typeName");
        String source = request.getParameter("source");
        request.setAttribute("searchValue", searchValue);
        request.setAttribute("typeName", typeName);
        request.setAttribute("source", source);
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for searching and displaying vaccines.";
    }
}
