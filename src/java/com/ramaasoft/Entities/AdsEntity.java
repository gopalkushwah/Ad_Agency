/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.Entities;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author gopal
 */
public  class AdsEntity implements Serializable{
    private int ad_id;
    private String ad_title; 
    private String ad_description;
    private String ad_type;
    private String ad_format;
    private String ad_url;
    private String ad_platform;
    private float ad_budget;
    private String ad_status;
    private Date ad_creation_date;
    private Date ad_last_updated;
    private String seller_id;
    private String ads_image;

    public AdsEntity() {
    }

    public AdsEntity(int ad_id, String ad_title, String ad_description, String ad_type, String ad_format, String ad_url, String ad_platform, float ad_budget, String ad_status, Date ad_creation_date, Date ad_last_updated, String seller_id, String ads_image) {
        this.ad_id = ad_id;
        this.ad_title = ad_title;
        this.ad_description = ad_description;
        this.ad_type = ad_type;
        this.ad_format = ad_format;
        this.ad_url = ad_url;
        this.ad_platform = ad_platform;
        this.ad_budget = ad_budget;
        this.ad_status = ad_status;
        this.ad_creation_date = ad_creation_date;
        this.ad_last_updated = ad_last_updated;
        this.seller_id = seller_id;
        this.ads_image = ads_image;
    }
    
    public int getAd_id() {
        return ad_id;
    }

    public void setAd_id(int ad_id) {
        this.ad_id = ad_id;
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

    public String getAd_type() {
        return ad_type;
    }

    public void setAd_type(String ad_type) {
        this.ad_type = ad_type;
    }

    public String getAd_format() {
        return ad_format;
    }

    public void setAd_format(String ad_format) {
        this.ad_format = ad_format;
    }

    public String getAd_url() {
        return ad_url;
    }

    public void setAd_url(String ad_url) {
        this.ad_url = ad_url;
    }

    public String getAd_platform() {
        return ad_platform;
    }

    public void setAd_platform(String ad_platform) {
        this.ad_platform = ad_platform;
    }

    public float getAd_budget() {
        return ad_budget;
    }

    public void setAd_budget(float ad_budget) {
        this.ad_budget = ad_budget;
    }

    public String getAd_status() {
        return ad_status;
    }

    public void setAd_status(String ad_status) {
        this.ad_status = ad_status;
    }

    public Date getAd_creation_date() {
        return ad_creation_date;
    }

    public void setAd_creation_date(Date ad_creation_date) {
        this.ad_creation_date = ad_creation_date;
    }

    public Date getAd_last_updated() {
        return ad_last_updated;
    }

    public void setAd_last_updated(Date ad_last_updated) {
        this.ad_last_updated = ad_last_updated;
    }
    
    public String getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(String seller_id) {
        this.seller_id = seller_id;
    }

    public String getAds_image() {
        return ads_image;
    }

    public void setAds_image(String ads_image) {
        this.ads_image = ads_image;
    }
    
    
}
