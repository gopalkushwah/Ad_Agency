/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ramaasoft.servlets;

import com.ramaasoft.Cookies.UserDefinedCookies;
import com.ramaasoft.Entities.AdminEntity;
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
@WebServlet(name = "InsertAdsServlet", urlPatterns = {"/InsertAdsServlet"})
public class InsertAdsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String ad_title = request.getParameter("ad_title"); 
        String ad_description = request.getParameter("ad_description");
        String ad_type = request.getParameter("ad_type");
        String ad_format = request.getParameter("ad_format");
        String ad_platform = request.getParameter("ad_platform");
        float ad_budget = Float.parseFloat(request.getParameter("ad_budget"));
        
        AdminEntity admin = UserDefinedCookies.getAdminCookies(request, "adminLogin");
        
        AdsEntity ads = new AdsEntity();
        ads.setAd_budget(ad_budget);
        ads.setAd_title(ad_title);
        ads.setAd_description(ad_description);
        ads.setAd_type(ad_type);
        ads.setAd_platform(ad_platform);
        ads.setAd_format(ad_format);
        ads.setSeller_id(admin.getAdmin_id());
        try {
            int i = AdsDao.insertAds(ads);
            if(i>0)
                out.print("Ads Generated successfully...");
            else
                out.print("Something went wrong! Server not responding");
                
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
