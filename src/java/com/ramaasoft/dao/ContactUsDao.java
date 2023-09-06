/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.dao;

import com.ramaasoft.DBconnection.DBConnection;
import com.ramaasoft.Entities.ContactUsEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author gopal
 */
public class ContactUsDao {
    private static final String  SEND_MESSAGE = "INSERT INTO contact_us(contact_name, contact_email, contact_us_subject, contact_message,mobile_number,user_type) VALUES(?,?,?,?,?,?)";
    
    private static Connection con = null;
    
    public static boolean sendMessage(ContactUsEntity contactInfo){
        boolean isSent = false;
        try {
            con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(SEND_MESSAGE);
            pst.setString(1, contactInfo.getContact_name());
            pst.setString(2, contactInfo.getContact_email());
            pst.setString(3, contactInfo.getContact_us_subject());
            pst.setString(4, contactInfo.getContact_message());
            pst.setString(5, contactInfo.getMobile_number());
            pst.setString(6, contactInfo.getUser_type());
            
            int i = pst.executeUpdate();
            if(i>0)
                isSent = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSent;
    }
    
}
