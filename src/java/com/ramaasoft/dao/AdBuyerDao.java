/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.dao;

import com.google.gson.Gson;
import com.ramaasoft.DBconnection.DBConnection;
import com.ramaasoft.Entities.AdBuyerEntity;
import com.ramaasoft.Entities.AdsEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author gopal
 */
public class AdBuyerDao {

    public static Connection con = null;
    public static final String BOOK_AD = "INSERT INTO ad_buyers(buyer_id,full_name,email,phone_number,company_name,product_id,start_date,end_date,seller_id,seller_email,ad_title,ad_description) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
    public static final String GET_ALL_AD_BOOKING_BY_SELLER_ID = "SELECT * FROM ad_buyers WHERE seller_id=?";
    public static final String GET_ALL_AD_BOOKING_BY_BUYER_ID = "SELECT * FROM ad_buyers WHERE buyer_id=?";
    public static final String CANCEL_BOOKING = "UPDATE ad_buyers SET is_booked=? WHERE booking_id=?";
    public static final String BOOKING_STATUS = "UPDATE ad_buyers SET status=? WHERE booking_id=?";

    public static boolean bookAd(AdBuyerEntity adBuyer) {
        AdsEntity ads = AdsDao.getAllAdsByAdsId(adBuyer.getProduct_id());
        boolean b = false;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(BOOK_AD);
            pst.setString(1, adBuyer.getBuyer_id());
            pst.setString(2, adBuyer.getFull_name());
            pst.setString(3, adBuyer.getEmail());
            pst.setString(4, adBuyer.getPhone_number());
            pst.setString(5, adBuyer.getCompany_name());
            pst.setInt(6, adBuyer.getProduct_id());
            pst.setDate(7, adBuyer.getStart_date());
            pst.setDate(8, adBuyer.getEnd_date());
            pst.setString(9, adBuyer.getSeller_id());
            pst.setString(10, adBuyer.getSeller_email());
            pst.setString(11, ads.getAd_title());
            pst.setString(12, ads.getAd_description());

            int i = pst.executeUpdate();
            if (i > 0) {
                b = true;
            }
             
        } catch (Exception e) {
                
        }
       return b;
    }

    public static List<AdBuyerEntity> getAllAdBookingBySellerId(String sellerId) {
        List<AdBuyerEntity> adBuyerList = new ArrayList<AdBuyerEntity>();
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ALL_AD_BOOKING_BY_SELLER_ID);
            pst.setString(1, sellerId);

            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                AdBuyerEntity adBuyer = new AdBuyerEntity();
                adBuyer.setBooking_id(rst.getInt("booking_id"));
                adBuyer.setBuyer_id(rst.getString("buyer_id"));
                adBuyer.setFull_name(rst.getString("full_name"));
                adBuyer.setEmail(rst.getString("email"));
                adBuyer.setPhone_number(rst.getString("phone_number"));
                adBuyer.setCompany_name(rst.getString("company_name"));
                adBuyer.setStatus(rst.getString("status"));
                adBuyer.setProduct_id(rst.getInt("product_id"));
                adBuyer.setBooking_date(rst.getString("booking_date"));
                adBuyer.setStart_date(rst.getDate("start_date"));
                adBuyer.setEnd_date(rst.getDate("end_date"));
                adBuyer.setSeller_id(rst.getString("seller_id"));
                adBuyer.setSeller_email(rst.getString("seller_email"));
                adBuyer.setCreated_at(rst.getDate("created_at"));
                adBuyer.setUpdated_at(rst.getDate("updated_at"));
                adBuyer.setAd_title(rst.getString("ad_title"));
                adBuyer.setAd_description(rst.getString("ad_description"));
                adBuyer.setIsBooked(rst.getString("is_booked"));

                adBuyerList.add(adBuyer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return adBuyerList;
    }

    public static List<AdBuyerEntity> getAllAdBookingByBuyerId(String buyerId) {
        List<AdBuyerEntity> adBuyerList = new ArrayList<AdBuyerEntity>();
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ALL_AD_BOOKING_BY_BUYER_ID);
            pst.setString(1, buyerId);

            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                AdBuyerEntity adBuyer = new AdBuyerEntity();
                adBuyer.setBooking_id(rst.getInt("booking_id"));
                adBuyer.setBuyer_id(rst.getString("buyer_id"));
                adBuyer.setFull_name(rst.getString("full_name"));
                adBuyer.setEmail(rst.getString("email"));
                adBuyer.setPhone_number(rst.getString("phone_number"));
                adBuyer.setCompany_name(rst.getString("company_name"));
                adBuyer.setStatus(rst.getString("status"));
                adBuyer.setProduct_id(rst.getInt("product_id"));
                adBuyer.setBooking_date(rst.getString("booking_date"));
                adBuyer.setStart_date(rst.getDate("start_date"));
                adBuyer.setEnd_date(rst.getDate("end_date"));
                adBuyer.setSeller_id(rst.getString("seller_id"));
                adBuyer.setSeller_email(rst.getString("seller_email"));
                adBuyer.setCreated_at(rst.getDate("created_at"));
                adBuyer.setUpdated_at(rst.getDate("updated_at"));
                adBuyer.setAd_title(rst.getString("ad_title"));
                adBuyer.setAd_description(rst.getString("ad_description"));
                adBuyer.setIsBooked(rst.getString("is_booked"));

                adBuyerList.add(adBuyer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return adBuyerList;
    }

    public static boolean cancelBooking(int booking_id) {
        boolean b = false;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(CANCEL_BOOKING);
            pst.setString(1, "cancelled");
            pst.setInt(2, booking_id);

            int i = pst.executeUpdate();
            if(i>0)
                b= true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;
    }
    
    
    public static boolean bookingStatus(int id,String status) {
        boolean b = false;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(BOOKING_STATUS);
            pst.setString(1, status);
            pst.setInt(2, id);

            int i = pst.executeUpdate();
            if(i>0)
                b= true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;
    }
    
    public static String getAdBuyerJson(){
        String jsonData = "";
        try {
            Gson gson = new Gson();
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM ad_buyers");
            ResultSet rst = pst.executeQuery();
            List<AdBuyerEntity> adBuyerList = new ArrayList<>();
            while (rst.next()) {
                AdBuyerEntity adBuyer = new AdBuyerEntity();
                adBuyer.setBooking_id(rst.getInt("booking_id"));
                adBuyer.setBuyer_id(rst.getString("buyer_id"));
                adBuyer.setFull_name(rst.getString("full_name"));
                adBuyer.setEmail(rst.getString("email"));
                adBuyer.setPhone_number(rst.getString("phone_number"));
                adBuyer.setCompany_name(rst.getString("company_name"));
                adBuyer.setStatus(rst.getString("status"));
                adBuyer.setProduct_id(rst.getInt("product_id"));
                adBuyer.setBooking_date(rst.getString("booking_date"));
                adBuyer.setStart_date(rst.getDate("start_date"));
                adBuyer.setEnd_date(rst.getDate("end_date"));
                adBuyer.setSeller_id(rst.getString("seller_id"));
                adBuyer.setSeller_email(rst.getString("seller_email"));
                adBuyer.setCreated_at(rst.getDate("created_at"));
                adBuyer.setUpdated_at(rst.getDate("updated_at"));
                adBuyer.setAd_title(rst.getString("ad_title"));
                adBuyer.setAd_description(rst.getString("ad_description"));
                adBuyer.setIsBooked(rst.getString("is_booked"));

                adBuyerList.add(adBuyer);
            }
            jsonData = gson.toJson(adBuyerList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonData;
    }

}
