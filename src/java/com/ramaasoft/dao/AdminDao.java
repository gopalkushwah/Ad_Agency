/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.dao;

import com.ramaasoft.DBconnection.DBConnection;
import com.ramaasoft.Entities.AdminEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author gopal
 */
public class AdminDao {
    private static Connection con = null;
    private static final String REGISTER_ADMIN = "INSERT INTO admin(admin_id,username,mobile,email,password,full_name,role,companyname) VALUES(?,?,?,?,?,?,?,?)";
    private static final String GET_ADMIN = "SELECT * FROM admin WHERE email=? AND mobile=?";
    private static final String LOGIN_ADMIN = "SELECT * FROM admin WHERE email=? AND password=?";
    private static final String GET_ADMIN_BY_USERNAME = "SELECT * FROM admin WHERE username=?";
    private static final String GET_ADMIN_BY_ADMIN_ID = "SELECT * FROM admin WHERE admin_id=?";
    private static final String UPLOAD_ADMIN_IMAGE = "UPDATE admin SET image=? WHERE admin_id=?";
    private static final String UPDATE_ADMIN = "UPDATE admin SET username=?,mobile=?,email=?,full_name=?,instagram=?,twitter=?,facebook=?,linkedin=? WHERE admin_id=?";
    private static final String CHANGE_ADMIN_PASSWORD = "UPDATE admin SET password=? WHERE admin_id=?";
    
    public static int registerAdmin(AdminEntity admin) {
        int isReg = 0;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(REGISTER_ADMIN);
            pst.setString(1, Long.toString(System.currentTimeMillis()));
            pst.setString(2,admin.getUsername());
            pst.setString(3, admin.getMobile());
            pst.setString(4, admin.getEmail());
            pst.setString(5,admin.getPassword() );
            pst.setString(6,admin.getFull_name() );
            pst.setString(7,admin.getRole());
            pst.setString(8,admin.getCompanyname());
            isReg = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isReg;
    }
    
    public static AdminEntity getAdmin(String email, String mobile) {
        AdminEntity admin = new AdminEntity();
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ADMIN);
            pst.setString(1, email);
            pst.setString(2, mobile);

            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                admin.setAdmin_id(rst.getString("admin_id"));
                admin.setUsername(rst.getString("username"));
                admin.setMobile(rst.getString("mobile"));
                admin.setEmail(rst.getString("email"));
                admin.setPassword(rst.getString("password"));
                admin.setFull_name(rst.getString("full_name"));
                admin.setRole(rst.getString("role"));
                admin.setRegistration_date(rst.getString("registration_date"));
                admin.setLast_login(rst.getString("last_login"));  
                admin.setInstagram(rst.getString("instagram"));
                admin.setTwitter(rst.getString("twitter"));
                admin.setFacebook(rst.getString("facebook"));
                admin.setLinkedin(rst.getString("linkedin"));
                admin.setImage(rst.getString("image"));
                admin.setCompanyname(rst.getString("companyname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    return admin;
    }
    
    public static AdminEntity loginAdmin(String email, String password) {
        AdminEntity admin = new AdminEntity();
        
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(LOGIN_ADMIN);
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                admin.setAdmin_id(rst.getString("admin_id"));
                admin.setUsername(rst.getString("username"));
                admin.setMobile(rst.getString("mobile"));
                admin.setEmail(rst.getString("email"));
                admin.setPassword(rst.getString("password"));
                admin.setFull_name(rst.getString("full_name"));
                admin.setRole(rst.getString("role"));
                admin.setRegistration_date(rst.getString("registration_date"));
                admin.setLast_login(rst.getString("last_login"));   
                admin.setInstagram(rst.getString("instagram"));
                admin.setTwitter(rst.getString("twitter"));
                admin.setFacebook(rst.getString("facebook"));
                admin.setLinkedin(rst.getString("linkedin"));
                admin.setImage(rst.getString("image"));
                admin.setCompanyname(rst.getString("companyname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    return admin;
    }
    public static boolean getAdminByUsername(String username) {
        boolean isUsername = false;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ADMIN_BY_USERNAME);
            pst.setString(1, username);
            
            ResultSet rst = pst.executeQuery();
            if(rst.next()) {
               isUsername = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    return isUsername;
    }
    public static AdminEntity getAdminByAdminId(String admin_id) {
        AdminEntity admin = new  AdminEntity();
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_ADMIN_BY_ADMIN_ID);
            pst.setString(1, admin_id);
            
            ResultSet rst = pst.executeQuery();
            while(rst.next()){
                admin.setAdmin_id(rst.getString("admin_id"));
                admin.setUsername(rst.getString("username"));
                admin.setMobile(rst.getString("mobile"));
                admin.setEmail(rst.getString("email"));
                admin.setPassword(rst.getString("password"));
                admin.setFull_name(rst.getString("full_name"));
                admin.setRole(rst.getString("role"));
                admin.setRegistration_date(rst.getString("registration_date"));
                admin.setLast_login(rst.getString("last_login"));   
                admin.setInstagram(rst.getString("instagram"));
                admin.setTwitter(rst.getString("twitter"));
                admin.setFacebook(rst.getString("facebook"));
                admin.setLinkedin(rst.getString("linkedin"));
                admin.setImage(rst.getString("image"));
                admin.setCompanyname(rst.getString("companyname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    return admin;
    }
    
    public static int uploadAdminImage(String imageFileName,AdminEntity admin){
        int isDone = 0;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(UPLOAD_ADMIN_IMAGE);
            pst.setString(1, imageFileName);
            pst.setString(2, admin.getAdmin_id());
            isDone = pst.executeUpdate();
            if (isDone > 0) {
                isDone = 1;
            } else {
                System.out.println("failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isDone;
    }
    
    
    public static int AdminProfileUpdate(String admin_id,AdminEntity admin) {
        int isUpadate = 0;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(UPDATE_ADMIN);
            pst.setString(1,admin.getUsername());
            pst.setString(2, admin.getMobile());
            pst.setString(3, admin.getEmail());
            pst.setString(4, admin.getFull_name());
            pst.setString(5,admin.getInstagram());
            pst.setString(6,admin.getTwitter());
            pst.setString(7,admin.getFacebook());
            pst.setString(8, admin.getLinkedin());
            pst.setString(9, admin_id);
            
            isUpadate = pst.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    return isUpadate;
    }
    
    public static boolean changeAdminPassword(String password,String adminId){
        boolean isChanged = false;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(CHANGE_ADMIN_PASSWORD);
            pst.setString(1, password);
            pst.setString(2, adminId);
            int i = pst.executeUpdate();
            if(i>0)
                isChanged = true;
        } catch (Exception e) {
        }
        return isChanged;
    }
    
    public static String getAdminProfileImage(String admin_id){
        String adminProfile = "";
        try{
            con  = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT image FROM admin WHERE admin_id=?");
            pst.setString(1, admin_id);
            
            ResultSet rst = pst.executeQuery();
            if(rst.next()){
                adminProfile = rst.getString("image");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return adminProfile;
    }
}
