/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kriss
 */
public class Conexion {
    public String driver="com.mysql.cj.jdbc.Driver";
    public Connection getConnection(){
        Connection conexion=null;
        
        try {
            Class.forName(driver);
             conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/ventasbd","kriss","kriss");
      
        } catch (ClassNotFoundException| SQLException e) {
            System.out.println(e.toString());  
        }
        return conexion;
                 
          
    }
    public static void main(String[] args) throws SQLException{
        Connection conexion=null;
        Conexion con=new Conexion();
        conexion=con.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        ps=conexion.prepareStatement("SELECT * FROM producto");
        rs=ps.executeQuery();
        while(rs.next()){
            int id=rs.getInt("id");
            String nombre=rs.getString("nombre");
            System.out.println("id: "+id+" Nombre: "+nombre);
        }

    }

}