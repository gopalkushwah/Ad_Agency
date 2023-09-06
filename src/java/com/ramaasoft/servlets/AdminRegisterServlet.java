/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

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

/**
 *
 * @author gopal
 */
@WebServlet(name = "AdminRegisterServlet", urlPatterns = {"/AdminRegisterServlet"})
public class AdminRegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String full_name = request.getParameter("name");
        String role = request.getParameter("role");
        String companyname = request.getParameter("companyname");
        AdminEntity getAdmin = AdminDao.getAdmin(email, mobile);
        boolean getAdminByUsername = AdminDao.getAdminByUsername(username);
        if (getAdminByUsername == false) {
            if (getAdmin.getAdmin_id() == null) {
                if (password.equals(cpassword)) {
                    //password validation regex
                    String regex = "^(?=.*[A-Z]{2})(?=.*[a-z]{2})(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]{2})(?=.*\\d{2}).{8,25}$";
                    Pattern pattern = Pattern.compile(regex);
                    Matcher matcher = pattern.matcher(password);
                    if (matcher.matches()) {
                        // username validation regex
                        regex = "^[a-zA-Z0-9_@\\-.+]{4,20}$";
                        pattern = Pattern.compile(regex);
                        matcher = pattern.matcher(username);
                        if (matcher.matches()) {
                            //mobile validation regex
                            regex = "^[6-9]\\d{9}$";
                            pattern = Pattern.compile(regex);
                            matcher = pattern.matcher(mobile);
                            if (matcher.matches()) {
                                //email validation regex
                                regex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
                                pattern = Pattern.compile(regex);
                                matcher = pattern.matcher(email);
                                if (matcher.matches()) {
                                    AdminEntity admin = new AdminEntity();
                                    admin.setEmail(email);
                                    admin.setFull_name(full_name);
                                    admin.setMobile(mobile);
                                    admin.setPassword(password);
                                    admin.setRole(role);
                                    admin.setUsername(username);
                                    admin.setCompanyname(companyname);
                                    try {
                                        int isAdminReg = AdminDao.registerAdmin(admin);
                                        if (isAdminReg > 0) {
                                            out.print("Registration Successfull...");
                                        } else {
                                            out.print("Something Went Wrong! Please try again...");
                                        }
                                    } catch (Exception e) {
                                    }
                                } else {
                                    out.print("Mobile length should be 10 and start by 6,7,8 or 9");
                                }
                            } else {
                                out.print("Mobile length should be 10 and start by 6,7,8 or 9");
                            }
                        } else {
                            out.print("Username is not matching given conditions...");
                        }
                    } else {
                        out.print("Password is not matching given conditions...");
                    }
                } else {
                    out.print("Password Is not Same...");
                }
            } else {
                out.print("User already registered with same credentials...");
            }
        } else {
            out.print("Username already taken");
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
