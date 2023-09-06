/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.Entities;

/**
 *
 * @author gopal
 */  
public class ContactUsEntity {
    private String contact_us_id; 
    private String contact_name;
    private String contact_email;
    private String contact_us_subject;
    private String contact_message;
    private String user_type;
    private String mobile_number;

    public ContactUsEntity() {
    }

    public ContactUsEntity(String contact_us_id, String contact_name, String contact_email, String contact_us_subject, String contact_message, String user_type, String mobile_number) {
        this.contact_us_id = contact_us_id;
        this.contact_name = contact_name;
        this.contact_email = contact_email;
        this.contact_us_subject = contact_us_subject;
        this.contact_message = contact_message;
        this.user_type = user_type;
        this.mobile_number = mobile_number;
    }

    public String getContact_us_id() {
        return contact_us_id;
    }

    public void setContact_us_id(String contact_us_id) {
        this.contact_us_id = contact_us_id;
    }

    public String getContact_name() {
        return contact_name;
    }

    public void setContact_name(String contact_name) {
        this.contact_name = contact_name;
    }

    public String getContact_email() {
        return contact_email;
    }

    public void setContact_email(String contact_email) {
        this.contact_email = contact_email;
    }

    public String getContact_message() {
        return contact_message;
    }

    public void setContact_message(String contact_message) {
        this.contact_message = contact_message;
    }
    
    public String getContact_us_subject() {
        return contact_us_subject;
    }

    public void setContact_us_subject(String contact_us_subject) {
        this.contact_us_subject = contact_us_subject;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public String getMobile_number() {
        return mobile_number;
    }

    public void setMobile_number(String mobile_number) {
        this.mobile_number = mobile_number;
    }
    
}
