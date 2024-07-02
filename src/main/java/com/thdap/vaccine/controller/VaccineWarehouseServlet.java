package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.dao.VaccineWarehouseDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.model.Vaccine;
import com.thdap.vaccine.model.VaccineWarehouse;
import com.thdap.vaccine.model.WorkLocation;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/vaccine-warehouse")
public class VaccineWarehouseServlet extends HttpServlet {
    private VaccineWarehouseDAO vaccineWarehouseDAO;
    private VaccineDAO vaccineDAO;
    private WorkLocationDAO workLocationDAO;

    @Override
    public void init() throws ServletException {
        this.vaccineWarehouseDAO = new VaccineWarehouseDAO();
        this.vaccineDAO = new VaccineDAO();
        this.workLocationDAO = new WorkLocationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Fetch the list of VaccineWarehouse records
        List<VaccineWarehouse> warehouses = vaccineWarehouseDAO.getAll();

        // Fetch the list of Vaccine records
        List<Vaccine> vaccines = vaccineDAO.getAllVaccines();

        // Fetch all WorkLocations
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();
        
        // Set the lists as request attributes
        request.setAttribute("warehouses", warehouses);
        request.setAttribute("vaccines", vaccines);
        request.setAttribute("workLocations", workLocations);

        // Forward the request to the JSP page
        request.getRequestDispatcher("vaccineWarehouseList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests if needed (e.g., form submissions)
        doGet(request, response); // Forward to doGet for processing
    }
}
