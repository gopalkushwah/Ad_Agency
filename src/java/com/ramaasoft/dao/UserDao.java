/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.dao;

import com.ramaasoft.DBconnection.DBConnection;
import com.ramaasoft.Entities.UserEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author gopal
 */
public class UserDao {

    private static Connection con = null;
    private static final String REGISTER_USER = "INSERT INTO user(id,name,email,mobile,address,area,city,state,password) VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String GET_USER = "SELECT * FROM user WHERE email=? AND mobile=?";
    private static final String LOGIN_USER = "SELECT * FROM user WHERE email=? AND password=?";
    private static final String UPDATE_USER = "UPDATE user SET name=?,email=?,mobile=?,address=?,area=?,city=?,state=? WHERE id=?";
    private static final String CHANGE_USER_PASSWORD = "UPDATE user SET password=? WHERE id=?";
    private static final String UPLOAD_USER_IMAGE = "UPDATE user SET profile_image=? WHERE id=?";
    private static final String GET_USER_BY_ID = "SELECT * FROM user WHERE id=?";

    public static int registerUser(UserEntity user) {
        int isReg = 0;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(REGISTER_USER);
            pst.setString(1, Long.toString(System.currentTimeMillis()));
            pst.setString(2, user.getName());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getMobile());
            pst.setString(5, user.getAddress());
            pst.setString(6, user.getArea());
            pst.setString(7, user.getCity());
            pst.setString(8, user.getState());
            pst.setString(9, user.getPassword());

            isReg = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isReg;
    }

    public static UserEntity getUser(String email, String mobile) {
        UserEntity user = new UserEntity();
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_USER);
            pst.setString(1, email);
            pst.setString(2, mobile);

            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                user.setName(rst.getString("name"));
                user.setEmail(rst.getString("email"));
                user.setAddress(rst.getString("address"));
                user.setCity(rst.getString("city"));
                user.setArea(rst.getString("area"));
                user.setId(rst.getString("id"));
                user.setMobile(rst.getString("mobile"));
                user.setSignup_date(rst.getDate("signup_date"));
                user.setState(rst.getString("state"));
                user.setProfile_image(rst.getString("profile_image"));
                user.setPassword(rst.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    return user;
    }
    public static UserEntity getUserById(String userId) {
        UserEntity user = new UserEntity();
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(GET_USER_BY_ID);
            pst.setString(1, userId);
            
            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                user.setName(rst.getString("name"));
                user.setEmail(rst.getString("email"));
                user.setAddress(rst.getString("address"));
                user.setCity(rst.getString("city"));
                user.setArea(rst.getString("area"));
                user.setId(rst.getString("id"));
                user.setMobile(rst.getString("mobile"));
                user.setSignup_date(rst.getDate("signup_date"));
                user.setState(rst.getString("state"));
                user.setProfile_image(rst.getString("profile_image"));
                user.setPassword(rst.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    return user;
    }
    public static UserEntity loginUser(String email, String password) {
        UserEntity user = new UserEntity();
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(LOGIN_USER);
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                user.setId(rst.getString("id"));
                user.setName(rst.getString("name"));
                user.setEmail(rst.getString("email"));
                user.setMobile(rst.getString("mobile"));
                user.setArea(rst.getString("area"));
                user.setCity(rst.getString("city"));
                user.setAddress(rst.getString("address"));
                user.setState(rst.getString("state"));
                user.setSignup_date(rst.getDate("signup_date"));
                user.setProfile_image(rst.getString("profile_image"));
                user.setPassword(rst.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    return user;
    }
    
    public static int userProfileUpdate(String userid,UserEntity user) {
        int isUpadate = 0;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(UPDATE_USER);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getMobile());
            pst.setString(4, user.getAddress());
            pst.setString(5, user.getArea());
            pst.setString(6, user.getCity());
            pst.setString(7, user.getState());
            pst.setString(8, userid);
            
            isUpadate = pst.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    return isUpadate;
    }
    
    public static int changeUserPassword(String userid,String Password) {
        int isUpadate = 0;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(CHANGE_USER_PASSWORD);
             pst.setString(1, Password);
             pst.setString(2, userid);
            
            isUpadate = pst.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    return isUpadate;
    }
    public static int uploadUserImage(String imageFileName,UserEntity user){
        int isDone = 0;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(UPLOAD_USER_IMAGE);
            pst.setString(1, imageFileName);
            pst.setString(2, user.getId());
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
    
}
