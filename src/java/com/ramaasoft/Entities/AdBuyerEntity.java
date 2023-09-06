/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.Entities;

import java.sql.Date;

/**
 *
 * @author gopal
 */
public class AdBuyerEntity {
    private int booking_id;
    private String buyer_id;
    private String full_name;
    private String email;
    private String phone_number;
    private String company_name;
    private String status;
    private int product_id;
    private String booking_date;
    private Date start_date;
    private Date end_date;
    private String seller_id;
    private String seller_email;
    private Date created_at;
    private Date updated_at;
    private String password;
    private String ad_title;
    private String ad_description;
    private String isBooked;

    public AdBuyerEntity() {
    }

    public AdBuyerEntity(int booking_id, String buyer_id, String full_name, String email, String phone_number, String company_name, String status, int product_id, String booking_date, Date start_date, Date end_date, String seller_id, String seller_email, Date created_at, Date updated_at, String password, String ad_title, String ad_description,String isBooked) {
        this.booking_id = booking_id;
        this.buyer_id = buyer_id;
        this.full_name = full_name;
        this.email = email;
        this.phone_number = phone_number;
        this.company_name = company_name;
        this.status = status;
        this.product_id = product_id;
        this.booking_date = booking_date;
        this.start_date = start_date;
        this.end_date = end_date;
        this.seller_id = seller_id;
        this.seller_email = seller_email;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.password = password;
        this.ad_title = ad_title;
        this.ad_description = ad_description;
        this.isBooked = isBooked;
    }

    
    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public String getBuyer_id() {
        return buyer_id;
    }

    public void setBuyer_id(String buyer_id) {
        this.buyer_id = buyer_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getBooking_date() {
        return booking_date;
    }

    public void setBooking_date(String booking_date) {
        this.booking_date = booking_date;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public String getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(String seller_id) {
        this.seller_id = seller_id;
    }

    public String getSeller_email() {
        return seller_email;
    }

    public void setSeller_email(String seller_email) {
        this.seller_email = seller_email;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAd_title() {
        return ad_title;
    }

    public void setAd_title(String ad_title) {
        this.ad_title = ad_title;
    }

    public String getAd_description() {
        return ad_description;
    }

    public void setAd_description(String ad_description) {
        this.ad_description = ad_description;
    }

    public String getIsBooked() {
        return isBooked;
    }

    public void setIsBooked(String isBooked) {
        this.isBooked = isBooked;
    }
    
    
}
