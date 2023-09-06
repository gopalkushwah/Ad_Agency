/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import com.ramaasoft.Cookies.UserDefinedCookies;
import com.ramaasoft.Entities.UserEntity;
import com.ramaasoft.dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UserChangePasswordServlet", urlPatterns = {"/UserChangePasswordServlet"})
public class UserChangePasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String oldPassword = request.getParameter("oldpass");
        String newpassword = request.getParameter("newpassword");
        UserEntity getUser = UserDefinedCookies.getUserCookies(request, "userdata");

        if (getUser != null) {
            System.out.println("first");
            UserEntity user = UserDao.getUser(getUser.getEmail(), getUser.getMobile());
            if (oldPassword.equals(user.getPassword())) {
            System.out.println("second");
                UserDao.changeUserPassword(user.getId(), newpassword);
                out.print("Password has bean changed...");
            } else {
                out.print("New password doesn't match with your old Passward");
            }
        }else {
                out.print("You have been logout out for some reason");
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
