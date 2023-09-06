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
@WebServlet(name = "AdminProfileUpdateServlet", urlPatterns = {"/AdminProfileUpdateServlet"})
public class AdminProfileUpdateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String mobile = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String full_name = request.getParameter("fullName");
        String twitter = request.getParameter("twitter");
        String facebook = request.getParameter("facebook");
        String instagram = request.getParameter("instagram");
        String linkedin = request.getParameter("linkedin");

        HttpSession session = request.getSession();
//        getting user info from cookies to get user id
        AdminEntity getAdmin1 = UserDefinedCookies.getAdminCookies(request, "adminLogin");
//       to check if user already registered with the given email and mobile
        AdminEntity getAdmin = AdminDao.getAdmin(email, mobile);

//        getting full info from db to do some validations 
        AdminEntity getAdmin2 = AdminDao.getAdmin(getAdmin1.getEmail(), getAdmin1.getMobile());

        if (getAdmin2.getPassword().equals(password)) {
                //  password validation regex
                String regex = "^(?=.*[A-Z]{2})(?=.*[a-z]{2})(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]{2})(?=.*\\d{2}).{8,25}$";
                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(password);
                if (matcher.matches()) {
                    //                  username validation regex
                    regex = "^[a-zA-Z0-9_@\\-.+]{4,20}$";
                    pattern = Pattern.compile(regex);
                    matcher = pattern.matcher(username);
                    if (matcher.matches()) {
                        //                      mobile validation regex
                        regex = "^[6-9]\\d{9}$";
                        pattern = Pattern.compile(regex);
                        matcher = pattern.matcher(mobile);
                        if (matcher.matches()) {
                            //                          email validation regex
                            regex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
                            pattern = Pattern.compile(regex);
                            matcher = pattern.matcher(email);
                            if (matcher.matches()) {
                                AdminEntity admin = new AdminEntity();
                                admin.setEmail(email);
                                admin.setFull_name(full_name);
                                admin.setMobile(mobile);
                                admin.setUsername(username);
                                admin.setTwitter(twitter);
                                admin.setInstagram(instagram);
                                admin.setFacebook(facebook);
                                admin.setLinkedin(linkedin);
                                try {
                                    String admin_id = getAdmin1.getAdmin_id();
                                    int isAdminReg = AdminDao.AdminProfileUpdate(admin_id, admin);
                                    if (isAdminReg > 0) {
                                        out.print("Edited successfully...");
                                    } else {
                                        out.print("Something Went Wrong! Please try again...");
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            } else {
                                out.print("Email Should be valid...");
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
            out.print("Password not matches with old password");
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
