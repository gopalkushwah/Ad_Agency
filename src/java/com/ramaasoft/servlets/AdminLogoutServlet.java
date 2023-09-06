/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gopal
 */
@WebServlet(name = "AdminLogoutServlet", urlPatterns = {"/AdminLogoutServlet"})
public class AdminLogoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        boolean isLogout = UserDefinedCookies.deleteCookies("isAdminLogin", request, response);
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("isAdminLogin".equals(cookie.getName())) {
                    cookie.setMaxAge(0); // Set the cookie's expiration time to 0 (in the past)
                    response.addCookie(cookie); // Add the modified cookie to the response
                    break; // No need to continue searching for the cookie
                }
            }
            
        }
                    response.sendRedirect("Admin/pages-login.jsp");
//        if(isLogout==true)
//        else response.sendRedirect("Admin/users-profile.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
