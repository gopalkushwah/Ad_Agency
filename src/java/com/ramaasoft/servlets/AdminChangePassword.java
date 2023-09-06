/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import com.ramaasoft.Cookies.UserDefinedCookies;
import com.ramaasoft.Entities.AdminEntity;
import com.ramaasoft.dao.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
@WebServlet(name = "AdminChangePassword", urlPatterns = {"/AdminChangePassword"})
public class AdminChangePassword extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String currentPassword = request.getParameter("currentPassword");
        String newpassword = request.getParameter("newPassword");
        String renewpassword = request.getParameter("renewPassword");
        //              password validation regex
        String regex = "^(?=.*[A-Z]{2})(?=.*[a-z]{2})(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]{2})(?=.*\\d{2}).{8,25}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(renewpassword);
        if (matcher.matches()) {             
            if(newpassword.equals(renewpassword)){
                AdminEntity admin = UserDefinedCookies.getAdminCookies(request, "adminLogin");
                if(admin.getPassword().equals(currentPassword)){
                        AdminDao.changeAdminPassword(newpassword, admin.getAdmin_id());
                        out.print("Password Changed successfully...");
                }else{
                    out.print("Password Changed successfully...");
                }
            }else{
                out.print("Both password should be same...");
            }
        }else{
            out.print("Password must contains 2 -> Uppercase ,Lowercase ,digit and spacial symbol and Length >=8 and <= 25");
        }
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
