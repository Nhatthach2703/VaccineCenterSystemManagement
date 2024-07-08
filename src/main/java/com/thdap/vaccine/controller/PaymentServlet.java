/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.thdap.vaccine.dao.OrderVaccineInfoDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.model.Account;
import com.thdap.vaccine.model.OrderVaccineInfo;
import com.thdap.vaccine.model.User;
import com.thdap.vaccine.model.WorkLocation;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Formatter;
import java.util.List;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.model.Vaccine;
import java.time.LocalDate;

/**
 *
 * @author Xuan Vinh
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet PaymentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath() + "</h1>");
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
        int vaccineID = Integer.parseInt(request.getParameter("vaccineID"));
//        request.getAttribute(string)
        // Fetch vaccine details based on vaccineID (Assuming you have a VaccineDAO)
        VaccineDAO vaccineDAO = new VaccineDAO();
        Vaccine vaccine = vaccineDAO.getVaccineById(vaccineID);

        // Fetch work locations
        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();

        // Set necessary attributes for the JSP
        request.setAttribute("vaccine", vaccine);
        request.setAttribute("workLocations", workLocations);

        // Forward the request to the JSP for rendering the form
        request.getRequestDispatcher("orderVaccineForm.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
//        String checkoutUrl = (String) session.getAttribute("checkoutUrl");
//        if (checkoutUrl != null) {
//            response.sendRedirect(checkoutUrl);
//            return;
//        }
        
        // Example values
        String paymentMethod = "VIETQR";
        String status = "NOT PAID";
        LocalDateTime now = LocalDateTime.now();
        
        int vaccineID = Integer.parseInt(request.getParameter("vaccineID"));
        int workLocationID = Integer.parseInt(request.getParameter("workLocationID")); 
        int userID = Integer.parseInt(request.getParameter("userID"));
        long totalPrice = Long.parseLong(request.getParameter("totalPrice"));
        
        LocalDateTime createDate = LocalDateTime.now();
        LocalDate dateWantToGetVaccinatedCheck = LocalDate.parse(request.getParameter("dateWantToGetVaccinated"));
        Date dateWantToGetVaccinated = Date.valueOf(request.getParameter("dateWantToGetVaccinated"));
        
        // Kiểm tra nếu dateWantToGetVaccinated là quá khứ so với createDate
        if (dateWantToGetVaccinatedCheck.isBefore(LocalDate.now())) {
            VaccineDAO vaccineDAO = new VaccineDAO();
            Vaccine vaccine = vaccineDAO.getVaccineById(vaccineID);

            // Fetch work locations
            WorkLocationDAO workLocationDAO = new WorkLocationDAO();
            List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();

            // Set necessary attributes for the JSP
            request.setAttribute("vaccine", vaccine);
            request.setAttribute("workLocations", workLocations);
            request.setAttribute("dateWantToGetVaccinated", dateWantToGetVaccinated);
            request.setAttribute("workLocationID", workLocationID);
            request.setAttribute("errorMessage", "Ngày muốn tiêm không được ở quá khứ");
            request.getRequestDispatcher("orderVaccineForm.jsp").forward(request, response);
            return;
        }

        // Kiểm tra nếu dateWantToGetVaccinated cách ít nhất 15 ngày so với createDate
        Calendar calCreateDate = Calendar.getInstance();
        Date createDateCheck = new Date(Calendar.getInstance().getTime().getTime());
        calCreateDate.setTime(createDateCheck);
        calCreateDate.add(Calendar.DATE, 15); // Thêm 15 ngày vào createDate
        Date minDate = new Date(calCreateDate.getTime().getTime());
        
        if (dateWantToGetVaccinated.before(minDate)) {
            VaccineDAO vaccineDAO = new VaccineDAO();
            Vaccine vaccine = vaccineDAO.getVaccineById(vaccineID);

            // Fetch work locations
            WorkLocationDAO workLocationDAO = new WorkLocationDAO();
            List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();

            // Set necessary attributes for the JSP
            request.setAttribute("vaccine", vaccine);
            request.setAttribute("workLocations", workLocations);
            request.setAttribute("dateWantToGetVaccinated", dateWantToGetVaccinated);
            request.setAttribute("workLocationID", workLocationID);
            request.setAttribute("errorMessage", "Ngày muốn tiêm phải cách ít nhất 15 ngày so với ngày đặt!");
            request.getRequestDispatcher("orderVaccineForm.jsp").forward(request, response);
            return;
        }
 
        // Tạo đối tượng OrderVaccineInfo
        OrderVaccineInfo orderInfo = new OrderVaccineInfo();
        orderInfo.setUserID(userID);
        orderInfo.setCreateDate(createDate);
        orderInfo.setDateWantToGetVaccinated(dateWantToGetVaccinated);
        orderInfo.setWorkLocationID(workLocationID);
        orderInfo.setVaccineID(vaccineID);
        orderInfo.setConfirmStatus(false); // Mặc định chưa xác nhận
        orderInfo.setPaymentStatus(status); // Mặc định chưa thanh toán
        orderInfo.setTotalPrice(totalPrice);

        // Thêm thông tin đăng ký vào cơ sở dữ liệu
        OrderVaccineInfoDAO orderInfoDAO = new OrderVaccineInfoDAO();
        boolean success = orderInfoDAO.insertOrderVaccineInfo(orderInfo);
        
        LocalDateTime orderDateTime = orderInfo.getCreateDate();
        java.sql.Timestamp sqlTimestamp = java.sql.Timestamp.valueOf(orderDateTime);
        
        // Phản hồi kết quả cho người dùng
        int orderInfoID = orderInfoDAO.getOrderInfoID(userID, orderDateTime, dateWantToGetVaccinated, workLocationID, vaccineID, totalPrice);
        session.setAttribute("orderInfoID", orderInfoID);
        
        // Get order details from session
        Account account = (Account) session.getAttribute("account");
        User user = (User) session.getAttribute("user");

        String description = "Payment for THDAP";
        String totalPriceStr = String.valueOf(totalPrice);

        // Data parameter
        String cancelUrl = "http://localhost:8080/Vaccine/CancelPaymentServlet";
        String orderCode = String.valueOf(orderInfoID);
        String returnUrl = "http://localhost:8080/Vaccine/ReturnPaymentServlet";
        

        // Make data string
        String data = "amount=" + totalPriceStr + "&cancelUrl=" + cancelUrl + "&description=" + description + "&orderCode=" + orderCode + "&returnUrl=" + returnUrl;

        // Get signature
        String checksumKey = "00fee8fb0143562545efb623c2c29910cccf2173678de0540aa5308b20d6be85";
        String signature;
        try {
            signature = calculateHMAC(data, checksumKey);
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            e.printStackTrace();
            response.sendRedirect("Error.jsp");
            return;
        }

        // Send JSON
        String[] result;
        try {
            result = sendJsonToCreatePayment(orderCode, totalPriceStr, description, user, cancelUrl, returnUrl, signature);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("Error.jsp");
            return;
        }

        // Response fail
        if (result == null) {
            response.sendRedirect("Error.jsp");
            return;
        }
        // Save checkoutURL and paymentLinkId to session and redirect to checkoutUrl
        session.setAttribute("checkoutUrl", result[0]);
        Cookie checkoutUrlCookie = new Cookie("checkoutUrl", result[0]);
        checkoutUrlCookie.setMaxAge(60 * 5);
        response.addCookie(checkoutUrlCookie);
        session.setAttribute("paymentLinkId", result[1]);
        response.sendRedirect(result[0]);
    }

    private String[] sendJsonToCreatePayment(String orderCode, String totalPriceStr, String description, User user, String cancelUrl, String returnUrl, String signature) throws Exception {
        String[] result = new String[2];
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api-merchant.payos.vn/v2/payment-requests"))
                .header("x-client-id", "ed1b10e3-1b5a-4d2d-b73c-09b003718426")
                .header("x-api-key", "25c59741-e5e5-4043-ba8e-5552450d7032")
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(createJsonBody(orderCode, totalPriceStr, description, user, cancelUrl, returnUrl, signature)))
                .build();

        HttpResponse<String> httpResponse = client.send(request, HttpResponse.BodyHandlers.ofString());
        String responseBody = httpResponse.body();
        System.out.println(responseBody);
        // Parse the JSON response to get the checkoutUrl
        JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject();
        JsonObject data = jsonObject.getAsJsonObject("data");
        result[0] = data.get("checkoutUrl").getAsString();
        result[1] = data.get("paymentLinkId").getAsString();
        return result;
    }

    private String createJsonBody(String orderCode, String totalPriceStr, String description, User user, String cancelUrl, String returnUrl, String signature) {
        JsonObject jsonBody = new JsonObject();
        jsonBody.addProperty("orderCode", Integer.valueOf(orderCode));
        jsonBody.addProperty("amount", Integer.valueOf(totalPriceStr));
        jsonBody.addProperty("description", description);
        
        jsonBody.addProperty("cancelUrl", cancelUrl);
        jsonBody.addProperty("returnUrl", returnUrl);
        jsonBody.addProperty("expiredAt", getUnixTimestampPlusMinutes(5));
        jsonBody.addProperty("signature", signature);

        return jsonBody.toString();
    }

    private String calculateHMAC(String data, String key) throws NoSuchAlgorithmException, InvalidKeyException {
        SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(secretKeySpec);
        byte[] rawHmac = mac.doFinal(data.getBytes());
        Formatter formatter = new Formatter();
        for (byte b : rawHmac) {
            formatter.format("%02x", b);
        }
        return formatter.toString();
    }

    public static long getUnixTimestampPlusMinutes(int minutesToAdd) {
        Instant now = Instant.now();
        Instant future = now.plusSeconds(minutesToAdd * 60);
        return future.getEpochSecond();
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
