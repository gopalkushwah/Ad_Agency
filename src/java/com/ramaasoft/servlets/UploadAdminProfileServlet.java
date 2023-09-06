/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import com.ramaasoft.Entities.AdminEntity;
import com.ramaasoft.dao.AdminDao;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author gopal
 */
@MultipartConfig
@WebServlet(name = "UploadAdminProfileServlet", urlPatterns = {"/UploadAdminProfileServlet"})
public class UploadAdminProfileServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Part file = request.getPart("adminprofile");
        String imageFileName = System.currentTimeMillis()+ file.getSubmittedFileName();
        
        ServletContext context = getServletContext();
        String webAppPath = context.getRealPath("/");
        
//        --------------- add your system spacific path upto ----> uploads folder of project structer
        String urlPath = webAppPath+"Admin\\uploads\\"+ imageFileName;
        AdminEntity getAdmin = (AdminEntity) session.getAttribute("getAdmin");
        AdminEntity admin = AdminDao.getAdmin(getAdmin.getEmail(), getAdmin.getMobile());
        if (!"profile.png".equals(admin.getImage()) && admin.getImage() != null) {
            
//        --------------- add your system spacific path upto ----> uploads folder of project structer ----------------------------------------
            File fileToDelete = new File(webAppPath+"Admin\\uploads\\"+ admin.getImage()); // Replace with the actual file path you want to delete
            if (fileToDelete.exists()) {
                fileToDelete.delete();
            }
        }
        try {
            try (FileOutputStream fs = new FileOutputStream(urlPath)) {
                InputStream is = file.getInputStream();
                
                byte[] data = new byte[is.available()];
                is.read(data);
                fs.write(data);
            }
        } catch (IOException e) {
            System.out.println("error");
        }

        try {
            int row = AdminDao.uploadAdminImage(imageFileName, admin);
            System.out.println(row);
            if (row > 0) {
                response.sendRedirect("Admin/users-profile.jsp");
            } else {
                System.out.println("failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
