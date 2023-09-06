/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.Entities;

import java.io.Serializable;

/**
 *
 * @author gopal
 */
public class AdminEntity implements Serializable{
    private String admin_id;
    private String username;
    private String mobile;
    private String email;
    private String password;
    private String full_name;
    private String role;
    private String registration_date;
    private String last_login;
    private String instagram;
    private String twitter;
    private String facebook;
    private String linkedin;
    private String image;
    private String companyname;
    
    public AdminEntity() {
    }

    public AdminEntity(String admin_id, String username, String mobile, String email, String password, String full_name, String role, String registration_date, String last_login, String instagram, String twitter, String facebook, String linkedin, String image, String companyname) {
        this.admin_id = admin_id;
        this.username = username;
        this.mobile = mobile;
        this.email = email;
        this.password = password;
        this.full_name = full_name;
        this.role = role;
        this.registration_date = registration_date;
        this.last_login = last_login;
        this.instagram = instagram;
        this.twitter = twitter;
        this.facebook = facebook;
        this.linkedin = linkedin;
        this.image = image;
        this.companyname = companyname;
    }

    
    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRegistration_date() {
        return registration_date;
    }

    public void setRegistration_date(String registration_date) {
        this.registration_date = registration_date;
    }

    public String getLast_login() {
        return last_login;
    }

    public void setLast_login(String last_login) {
        this.last_login = last_login;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getLinkedin() {
        return linkedin;
    }

    public void setLinkedin(String linkedin) {
        this.linkedin = linkedin;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }
    
    
}
