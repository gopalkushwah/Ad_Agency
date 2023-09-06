/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import com.ramaasoft.Entities.UserEntity;
import com.ramaasoft.dao.UserDao;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
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
@WebServlet(name = "UploadProfileServlet", urlPatterns = {"/UploadProfileServlet"})
public class UploadProfileServlet extends HttpServlet {

    private static Connection con = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Part file = request.getPart("profile");
        String imageFileName = System.currentTimeMillis()+ file.getSubmittedFileName();
        
        ServletContext context = getServletContext();
        String webAppPath = context.getRealPath("/");
        
//      --------------- add your system spacific path upto ----> upload folder of project structer
        String urlPath = webAppPath+"upload\\" + imageFileName;
        
        UserEntity user1 = (UserEntity) session.getAttribute("user");
        UserEntity user = UserDao.getUser(user1.getEmail(), user1.getMobile());
        if (!"profile.png".equals(user.getProfile_image()) && user.getProfile_image() != null) {
//      --------------- add your system spacific path upto ----> upload folder of project structer
            File fileToDelete = new File(webAppPath+"upload\\" + user.getProfile_image()); // Replace with the actual file path you want to delete
            if (fileToDelete.exists()) {
                fileToDelete.delete();
            }
        }
        try {
            FileOutputStream fs = new FileOutputStream(urlPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fs.write(data);
            fs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            int row = UserDao.uploadUserImage(imageFileName, user);
            if (row > 0) {
                response.sendRedirect("profile.jsp");
            } else {
                System.out.println("failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
