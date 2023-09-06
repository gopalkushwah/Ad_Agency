/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import com.ramaasoft.Entities.AdsEntity;
import com.ramaasoft.dao.AdsDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gopal
 */
@WebServlet(name = "AdsUpdateServlet", urlPatterns = {"/AdsUpdateServlet"})
public class AdsUpdateServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
         String ad_title = request.getParameter("ad_title"); 
        String ad_description = request.getParameter("ad_description");
        String ad_type = request.getParameter("ad_type");
        String ad_format = request.getParameter("ad_format");
        String ad_platform = request.getParameter("ad_platform");
        String ad_url = request.getParameter("ad_url");
        String ad_status = request.getParameter("ad_status");
        int ad_id =Integer.parseInt(request.getParameter("ad_id"));
        float ad_budget = Float.parseFloat(request.getParameter("ad_budget"));
        AdsEntity ads = new AdsEntity();
        ads.setAd_title(ad_title);
        ads.setAd_description(ad_description);
        ads.setAd_type(ad_type);
        ads.setAd_format(ad_format);
        ads.setAd_url(ad_url);
        ads.setAd_platform(ad_platform);
        ads.setAd_status(ad_status);
        ads.setAd_budget(ad_budget);
        ads.setAd_id(ad_id);
        
        try {
            int i = AdsDao.updateAdsByAdsId(ads);
            if(i>0)
                out.print("Ad Updated Successfully...");
            else
                out.print("Something went wrong! Server is not responding");
                
        } catch (Exception e) {
            e.printStackTrace();
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
