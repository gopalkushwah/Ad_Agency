/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import com.ramaasoft.Cookies.UserDefinedCookies;
import com.ramaasoft.Entities.AdminEntity;
import com.ramaasoft.Entities.AdsEntity;
import com.ramaasoft.dao.AdsDao;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author gopal
 */
@MultipartConfig
@WebServlet(name = "UploadAdsImageServlet", urlPatterns = {"/UploadAdsImageServlet"})
public class UploadAdsImageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        int ad_id = Integer.parseInt(request.getParameter("ad_id"));
        Part file = request.getPart("adsImage");
        AdminEntity admin = UserDefinedCookies.getAdminCookies(request, "adminLogin");
        AdsEntity ads = AdsDao.getAllAdsByAdsId(ad_id,admin.getAdmin_id());
          
        ServletContext context = getServletContext();
        String webAppPath = context.getRealPath("/");
       // System.out.println(webAppPath+"adsuploads\\");
        
        if(ads.getSeller_id().equals(admin.getAdmin_id())){
            if(file.getSubmittedFileName()!=""){
                String imageFileName = "abc"+System.currentTimeMillis()+ file.getSubmittedFileName();
                String urlPath = webAppPath+"adsuploads\\"+ imageFileName;

                if (!"noimage.jpg".equals(ads.getAds_image()) && ads.getAds_image() != null) {
//                       --------------- add your system spacific path upto ----> adsuploads folder of project structer
                File fileToDelete = new File(webAppPath+"adsuploads\\" +  ads.getAds_image()); // Replace with the actual file path you want to delete
                if (fileToDelete.exists()) {
                    fileToDelete.delete();
                }
            }

                if (!"noimage.jpg".equals(ads.getAds_image()) && ads.getAds_image() != null) {
//                       --------------- add your system spacific path upto ----> adsuploads folder of project structer
                    File fileToDelete = new File(webAppPath+"adsuploads\\" + ads.getAds_image()); // Replace with the actual file path you want to delete
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
                    System.out.println("error");
                }
                int width = 0;
                int height = 0;
//                ================================================================================
//           --------------- add your system spacific path upto ----> adsuploads folder of project structer
                File imageFile = new File(webAppPath+"adsuploads\\" + imageFileName);
                try {
                    BufferedImage bufferedImage = ImageIO.read(imageFile);
                    if (bufferedImage != null) {
                        width = bufferedImage.getWidth();
                        height = bufferedImage.getHeight();

                        System.out.println("Image Width: " + width);
                        System.out.println("Image Height: " + height);
                    } else {
                        System.out.println("Failed to read the image.");
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
//                ===============================================================================                
//                if(width==1024 && height==768){
                    try {
                        int row = AdsDao.updateAndInserImage(imageFileName, ad_id);
                        System.out.println(row);
                        if (row > 0) {
                            session.setAttribute("adsImageUpdate", "Image Updated Successfully...");
                            response.sendRedirect("Admin/edit-ads.jsp?adsid="+ad_id);
            //                out.print("Image Updated...");
                        } else {
                            session.setAttribute("adsImageUpdate", "Something went wrong! Server is not responding");
                            response.sendRedirect("Admin/your-ads.jsp");
                            out.print("Something went wrong! Server is not responding");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
//                }
//                else{
//                    File fileToDelete = new File("C:/Users/gopal/OneDrive/Documents/NetBeansProjects/Ad_Agency/web/adsuploads/" +  imageFileName); // Replace with the actual file path you want to delete
//                    if (fileToDelete.exists()) {
//                        fileToDelete.delete();
//                    }
//                    session.setAttribute("adsImageUpdate", "Please Select image of 1024*768");
//                    response.sendRedirect("Admin/edit-ads.jsp?adsid="+ad_id);
//                }
            }else{
                session.setAttribute("adsImageUpdate", "Please Select image");
                response.sendRedirect("Admin/edit-ads.jsp?adsid="+ad_id);
            }
        }else{
            session.setAttribute("adsImageUpdate", "You can't change others data");
            response.sendRedirect("Admin/edit-ads.jsp?adsid="+ad_id);
                    
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
