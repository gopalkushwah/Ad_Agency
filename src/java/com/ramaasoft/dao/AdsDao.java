/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.dao;

import com.google.gson.Gson;
import com.ramaasoft.DBconnection.DBConnection;
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
public class AdsDao {
    private static Connection con = null;
    private static final String INSERT_ADS = "INSERT INTO ads(ad_title, ad_description, ad_type, ad_format, ad_platform, ad_budget, ad_status,seller_id) VALUES(?,?,?,?,?,?,?,?)";
    private static final String GET_ALL_ADS = "SELECT * FROM ads ORDER BY ad_id ASC";
//    private static final String GET_ALL_ADS1 = "SELECT * FROM ads ORDER BY RAND()";
    private static final String GET_ALL_ADS1 = "SELECT * FROM ads";
    private static final String GET_ALL_ADS2 = "SELECT * FROM ads ORDER BY ad_id DESC";
    private static final String GET_ADS_BY_ID = "SELECT * FROM ads WHERE ad_id=? AND seller_id=?";
    private static final String GET_ADS_BY_ID1 = "SELECT * FROM ads WHERE ad_id=?";
    private static final String UPDATE_ADS_BY_ID = "UPDATE ads SET ad_title=?,ad_description=?,ad_type=?,ad_format=?,ad_url=?,ad_platform=?,ad_budget=?,ad_status=? WHERE ad_id=?";
    private static final String ADS_COUNT = "SELECT COUNT(ad_id) FROM ads";
    private static final String ADS_COUNT_BY_SELLER_ID = "SELECT COUNT(ad_id) FROM ads WHERE seller_id=?";
    private static final String UPDATE_AND_INSERT_IMAGE = "UPDATE ads SET ads_image=? WHERE ad_id=?";
    private static final String DELETE_ADS_BY_AD_ID = "DELETE FROM ads WHERE ad_id=?";
    
    public static int insertAds(AdsEntity ads){
        int isInserted = 0;
        try{
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(INSERT_ADS);
            pst.setString(1, ads.getAd_title());
            pst.setString(2, ads.getAd_description());
            pst.setString(3, ads.getAd_type());
            pst.setString(4, ads.getAd_format());
            pst.setString(5, ads.getAd_platform());
            pst.setFloat(6, ads.getAd_budget());
            pst.setString(7, "Active");
            pst.setString(8, ads.getSeller_id());
            isInserted = pst.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return isInserted;
    }
    
    public static List<AdsEntity> getAllAdsByAdminId(String adminId){
        List<AdsEntity> adsList = new ArrayList<>();
        try{
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ALL_ADS);
            
            ResultSet rst = pst.executeQuery();
            while(rst.next()){
                if(rst.getString("seller_id").equals(adminId)){
                    AdsEntity ads = new AdsEntity();
                    ads.setAd_id(rst.getInt("ad_id"));
                    ads.setAd_title(rst.getString("ad_title"));
                    ads.setAd_description(rst.getString("ad_description"));
                    ads.setAd_type(rst.getString("ad_type"));
                    ads.setAd_format(rst.getString("ad_format"));
                    ads.setAd_url(rst.getString("ad_url"));
                    ads.setAd_platform(rst.getString("ad_platform"));
                    ads.setAd_budget(rst.getFloat("ad_budget"));
                    ads.setAd_status(rst.getString("ad_status"));
                    ads.setAd_creation_date(rst.getDate("ad_creation_date"));
                    ads.setAd_last_updated(rst.getDate("ad_last_updated"));
                    ads.setSeller_id(rst.getString("seller_id"));
                    ads.setAds_image(rst.getString("ads_image"));
                    adsList.add(ads);
                }
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return adsList;
    }
   
    public static List<AdsEntity> getAllAds(){
        List<AdsEntity> adsList = new ArrayList<>();
        try{
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ALL_ADS1);
            
            ResultSet rst = pst.executeQuery();
            while(rst.next()){
                    AdsEntity ads = new AdsEntity();
                    ads.setAd_id(rst.getInt("ad_id"));
                    ads.setAd_title(rst.getString("ad_title"));
                    ads.setAd_description(rst.getString("ad_description"));
                    ads.setAd_type(rst.getString("ad_type"));
                    ads.setAd_format(rst.getString("ad_format"));
                    ads.setAd_url(rst.getString("ad_url"));
                    ads.setAd_platform(rst.getString("ad_platform"));
                    ads.setAd_budget(rst.getFloat("ad_budget"));
                    ads.setAd_status(rst.getString("ad_status"));
                    ads.setAd_creation_date(rst.getDate("ad_creation_date"));
                    ads.setAd_last_updated(rst.getDate("ad_last_updated"));
                    ads.setSeller_id(rst.getString("seller_id"));
                    ads.setAds_image(rst.getString("ads_image"));
                    adsList.add(ads);   
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return adsList;
    }
    
    public static List<AdsEntity> getAllAdsDesc(){
        List<AdsEntity> adsList = new ArrayList<>();
        try{
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ALL_ADS2);
            
            ResultSet rst = pst.executeQuery();
            while(rst.next()){
                    AdsEntity ads = new AdsEntity();
                    ads.setAd_id(rst.getInt("ad_id"));
                    ads.setAd_title(rst.getString("ad_title"));
                    ads.setAd_description(rst.getString("ad_description"));
                    ads.setAd_type(rst.getString("ad_type"));
                    ads.setAd_format(rst.getString("ad_format"));
                    ads.setAd_url(rst.getString("ad_url"));
                    ads.setAd_platform(rst.getString("ad_platform"));
                    ads.setAd_budget(rst.getFloat("ad_budget"));
                    ads.setAd_status(rst.getString("ad_status"));
                    ads.setAd_creation_date(rst.getDate("ad_creation_date"));
                    ads.setAd_last_updated(rst.getDate("ad_last_updated"));
                    ads.setSeller_id(rst.getString("seller_id"));
                    ads.setAds_image(rst.getString("ads_image"));
                    adsList.add(ads);   
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return adsList;
    }
    
    public static AdsEntity getAllAdsByAdsId(int adsId,String admin_id){
        AdsEntity ads = new AdsEntity();
        try{
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ADS_BY_ID);
            pst.setInt(1, adsId);
            pst.setString(2, admin_id);
            ResultSet rst = pst.executeQuery();
            while(rst.next()){
                    ads.setAd_id(rst.getInt("ad_id"));
                    ads.setAd_title(rst.getString("ad_title"));
                    ads.setAd_description(rst.getString("ad_description"));
                    ads.setAd_type(rst.getString("ad_type"));
                    ads.setAd_format(rst.getString("ad_format"));
                    ads.setAd_url(rst.getString("ad_url"));
                    ads.setAd_platform(rst.getString("ad_platform"));
                    ads.setAd_budget(rst.getFloat("ad_budget"));
                    ads.setAd_status(rst.getString("ad_status"));
                    ads.setAd_creation_date(rst.getDate("ad_creation_date"));
                    ads.setAd_last_updated(rst.getDate("ad_last_updated"));
                    ads.setSeller_id(rst.getString("seller_id"));
                    ads.setAds_image(rst.getString("ads_image"));
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return ads;
    }
    
    public static AdsEntity getAllAdsByAdsId(int adsId){
        AdsEntity ads = new AdsEntity();
        try{
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ADS_BY_ID1);
            pst.setInt(1, adsId);
            ResultSet rst = pst.executeQuery();
            while(rst.next()){
                    ads.setAd_id(rst.getInt("ad_id"));
                    ads.setAd_title(rst.getString("ad_title"));
                    ads.setAd_description(rst.getString("ad_description"));
                    ads.setAd_type(rst.getString("ad_type"));
                    ads.setAd_format(rst.getString("ad_format"));
                    ads.setAd_url(rst.getString("ad_url"));
                    ads.setAd_platform(rst.getString("ad_platform"));
                    ads.setAd_budget(rst.getFloat("ad_budget"));
                    ads.setAd_status(rst.getString("ad_status"));
                    ads.setAd_creation_date(rst.getDate("ad_creation_date"));
                    ads.setAd_last_updated(rst.getDate("ad_last_updated"));
                    ads.setSeller_id(rst.getString("seller_id"));
                    ads.setAds_image(rst.getString("ads_image"));
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return ads;
    }
    
    public static int updateAdsByAdsId(AdsEntity ads){
        int isUpdated = 0;
        try{
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(UPDATE_ADS_BY_ID);
           
            pst.setString(1, ads.getAd_title());
            pst.setString(2, ads.getAd_description());
            pst.setString(3, ads.getAd_type());
            pst.setString(4, ads.getAd_format());
            pst.setString(5, ads.getAd_url());
            pst.setString(6, ads.getAd_platform());
            pst.setFloat(7, ads.getAd_budget());
            pst.setString(8, ads.getAd_status());
            pst.setInt(9, ads.getAd_id());
            
            isUpdated = pst.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return isUpdated;
    }
    
    public static int countOfAds(){
        int count = 0;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(ADS_COUNT);
            ResultSet resultSet = pst.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public static int countOfAdsBySellerId(String seller_id){
        int count = 0;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(ADS_COUNT_BY_SELLER_ID);
            pst.setString(1, seller_id);
            ResultSet resultSet = pst.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public static int updateAndInserImage(String ads_image,int ad_id){
        int isUpdated = 0;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(UPDATE_AND_INSERT_IMAGE);
            pst.setString(1, ads_image);
            pst.setInt(2, ad_id);
            
            isUpdated = pst.executeUpdate();
                    
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }
    
    public static int deleteAdsById(int ad_id){
        int isUpdated = 0;
        try {
            con = DBConnection.getConnection();
                PreparedStatement pst = con.prepareStatement(DELETE_ADS_BY_AD_ID);
            pst.setInt(1, ad_id);
           
            isUpdated = pst.executeUpdate();
                    
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }
    
    public static String getAdsJson(){
        String jsonData = "";
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ALL_ADS1);
            ResultSet rst = pst.executeQuery();
            List<AdsEntity> adsList = new ArrayList<>();
            Gson gson = new Gson();
            while(rst.next()){
                AdsEntity ads = new AdsEntity();
        
                ads.setAd_id(rst.getInt("ad_id"));
                    ads.setAd_title(rst.getString("ad_title"));
                    ads.setAd_description(rst.getString("ad_description"));
                    ads.setAd_type(rst.getString("ad_type"));
                    ads.setAd_format(rst.getString("ad_format"));
                    ads.setAd_url(rst.getString("ad_url"));
                    ads.setAd_platform(rst.getString("ad_platform"));
                    ads.setAd_budget(rst.getFloat("ad_budget"));
                    ads.setAd_status(rst.getString("ad_status"));
                    ads.setAd_creation_date(rst.getDate("ad_creation_date"));
                    ads.setAd_last_updated(rst.getDate("ad_last_updated"));
                    ads.setSeller_id(rst.getString("seller_id"));
                    ads.setAds_image(rst.getString("ads_image"));
                    adsList.add(ads);
            }
            jsonData = gson.toJson(adsList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonData;
    }
    
}
