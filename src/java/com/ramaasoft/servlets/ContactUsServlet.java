/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import com.ramaasoft.Entities.ContactUsEntity;
import com.ramaasoft.dao.ContactUsDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gopal
 */
@WebServlet(name = "ContactUsServlet", urlPatterns = {"/ContactUsServlet"})
public class ContactUsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String contact_name = request.getParameter("contact_name");
        String contact_email = request.getParameter("contact_email");
        String contact_us_subject = request.getParameter("contact_us_subject");
        String contact_message = request.getParameter("contact_message");
        String user_type = request.getParameter("user_type");
        String mobile_number = request.getParameter("mobile_number");

        ContactUsEntity contactInfo = new ContactUsEntity();
        contactInfo.setContact_email(contact_email);
        contactInfo.setContact_message(contact_message);
        contactInfo.setContact_name(contact_name);
        contactInfo.setContact_us_subject(contact_us_subject);
        contactInfo.setUser_type(user_type);
        contactInfo.setMobile_number(mobile_number);
        boolean isSent = ContactUsDao.sendMessage(contactInfo);
        if(isSent==true){
            out.print("Message sent! We will contact you soon");
        }else{
            out.print("Something went wrong! server not responding");
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
