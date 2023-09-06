/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.Cookies;

import com.google.gson.Gson;
import com.ramaasoft.Entities.AdminEntity;
import com.ramaasoft.Entities.AdsEntity;
import com.ramaasoft.Entities.UserEntity;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gopal
 */
public class UserDefinedCookies {
    public static void setCookies(Object obj,HttpServletResponse response,String cookieName) throws UnsupportedEncodingException{
        Gson gson = new Gson();
        String objJson = gson.toJson(obj);
        String encodedStudentJson = URLEncoder.encode(objJson, "UTF-8");
        Cookie objCookie = new Cookie(cookieName, encodedStudentJson);
        objCookie.setMaxAge(60 * 60 * 24);
        response.addCookie(objCookie);
    }
    
    public static UserEntity getUserCookies(HttpServletRequest request,String cookieName) throws UnsupportedEncodingException{
        UserEntity obj = new UserEntity();
        Cookie[] cookies = request.getCookies();
        Gson gson = new Gson();
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    String encodedObjJson = cookie.getValue();
                    String decodedObjJson = URLDecoder.decode(encodedObjJson, "UTF-8");
                    obj = gson.fromJson(decodedObjJson, UserEntity.class);
                    break;
                }
            }
        }
        return obj;
    }
    public static AdminEntity getAdminCookies(HttpServletRequest request,String cookieName) throws UnsupportedEncodingException{
        AdminEntity obj = new AdminEntity();
        Cookie[] cookies = request.getCookies();
        Gson gson = new Gson();
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    String encodedObjJson = cookie.getValue();
                    String decodedObjJson = URLDecoder.decode(encodedObjJson, "UTF-8");
                    obj = gson.fromJson(decodedObjJson, AdminEntity.class);
                    break;
                }
            }
        }
        return obj;
    }
    public static AdsEntity getAdsCookies(HttpServletRequest request,String cookieName) throws UnsupportedEncodingException{
        AdsEntity obj = new AdsEntity();
        Cookie[] cookies = request.getCookies();
        Gson gson = new Gson();
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    String encodedObjJson = cookie.getValue();
                    String decodedObjJson = URLDecoder.decode(encodedObjJson, "UTF-8");
                    obj = gson.fromJson(decodedObjJson, AdsEntity.class);
                    break;
                }
            }
        }
        return obj;
    }
    
    
    public static void setNormalCookies(String cookieName , String content,HttpServletResponse response) throws UnsupportedEncodingException{
      String encodedCookieName = URLEncoder.encode(cookieName, StandardCharsets.UTF_8.toString());
      String encodedValue = URLEncoder.encode(content, StandardCharsets.UTF_8.toString());
      Cookie objCookie = new Cookie(encodedCookieName, encodedValue);
      objCookie.setMaxAge(60 * 60 * 24);
      response.addCookie(objCookie);
    }
    
    public static String getNormalCookies(String cookieName ,HttpServletRequest request) throws UnsupportedEncodingException{
        String cookieContent = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    cookieContent = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                    break;
                }
            }
        }
        return cookieContent;
    }
    
    public static boolean deleteCookies(String cookieName,HttpServletRequest request,HttpServletResponse response){
        boolean isLogout = false;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    cookie.setMaxAge(0); // Set the cookie's expiration time to 0 (in the past)
                    response.addCookie(cookie); // Add the modified cookie to the response
                    isLogout = true;
                    break; // No need to continue searching for the cookie
                }
            }
        }
        return isLogout;
    }
}
