/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import com.ramaasoft.Entities.AdBuyerEntity;
import com.ramaasoft.Entities.UserEntity;
import com.ramaasoft.dao.AdBuyerDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gopal
 */
@WebServlet(name = "BookAdsServlet", urlPatterns = {"/BookAdsServlet"})
public class BookAdsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String buyer_id = request.getParameter("buyer_id");
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("phone_number");
        String company_name = request.getParameter("company_name");
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        Date start_date = Date.valueOf(request.getParameter("start_date"));
        Date end_date = Date.valueOf(request.getParameter("end_date"));
        String seller_id = request.getParameter("seller_id");
        String seller_email = request.getParameter("seller_email");
        String password = request.getParameter("password");
        UserEntity user = (UserEntity)session.getAttribute("user");
        if(password.equals(user.getPassword())){
        AdBuyerEntity adBuyer = new AdBuyerEntity();
        adBuyer.setBuyer_id(buyer_id);
        adBuyer.setFull_name(full_name);
        adBuyer.setEmail(email);
        adBuyer.setPhone_number(phone_number);
        adBuyer.setCompany_name(company_name);
        adBuyer.setProduct_id(product_id);
        adBuyer.setStart_date(start_date);
        adBuyer.setEnd_date(end_date);
        adBuyer.setSeller_id(seller_id);
        adBuyer.setSeller_email(seller_email);
        
        try {
            boolean isBooking = AdBuyerDao.bookAd(adBuyer);
            if(isBooking){
                out.print("Booking successfull! seller will contact you soon");
            }else{
                out.print("Something went wrong! please try again");
            }
        } catch (Exception e) {
            out.print("Something went wrong! please try again");
        }
        }else{
            out.print("Incorrect password");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
