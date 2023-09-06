/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import com.ramaasoft.Entities.UserEntity;
import com.ramaasoft.dao.UserDao;
import java.io.IOException;
import java.sql.Connection;
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
@WebServlet(name = "UserProfileUpdateServlet", urlPatterns = {"/UserProfileUpdateServlet"})
public class UserProfileUpdateServlet extends HttpServlet {
    private static Connection con = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserEntity userid = (UserEntity)session.getAttribute("user");
        UserEntity user = new UserEntity();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String area = request.getParameter("area");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        user.setName(name);
        user.setEmail(email);
        user.setMobile(mobile);
        user.setAddress(address);
        user.setArea(area);
        user.setCity(city);
        user.setState(state);
        int isUpdate = UserDao.userProfileUpdate(userid.getId(), user);
        if(isUpdate>0){
            session.setAttribute("update", "Profile Successfully Updated...");
            response.sendRedirect("profile.jsp");
        }else{
            session.setAttribute("update", "Something went wrong! Try again...");
            response.sendRedirect("profile.jsp");
        }
    }

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
