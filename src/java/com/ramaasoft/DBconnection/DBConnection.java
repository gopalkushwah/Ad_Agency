/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ramaasoft.DBconnection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author gopal
 */
public class DBConnection {
    
    private static Connection con = null;
    private static final String URL  = "jdbc:mysql://localhost/adagency";
    private static final String USER = "root";
    private static final String PASS = "1234";
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL,USER,PASS);       
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
