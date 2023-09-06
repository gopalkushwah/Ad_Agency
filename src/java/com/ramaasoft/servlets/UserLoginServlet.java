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
@WebServlet(name = "UserLoginServlet", urlPatterns = {"/UserLoginServlet"})
public class UserLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        UserEntity getUser = UserDao.loginUser(email, password);
        HttpSession session = request.getSession();
        if(getUser.getId()!=null){
            session.setAttribute("isLogin", null);
            session.setAttribute("isLogin1", "Login Successfull....");
            session.setAttribute("user", getUser);
            UserDefinedCookies.setCookies(getUser, response, "userdata");
//            UserDefinedCookies.setNormalCookies("isUserLogin", "Login Successfull....", response);
            out.print("Login Successfull....");
        }else{
            out.print("Invalid Credentials...");
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
