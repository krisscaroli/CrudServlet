/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kriss
 */
public class ProductoDAO {
    Conexion cn= new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public List<Producto> listar(){
        List<Producto> lista=new ArrayList<>();
        String sql="select * from producto";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
        while(rs.next()){
           Producto p =new Producto();
           p.setId(rs.getInt(1));
           p.setNombre(rs.getString(2));
           p.setDescripcion(rs.getString(3));
           p.setPrecio(rs.getDouble(4));
           p.setImagen(rs.getBinaryStream(5));
           lista.add(p);
        }
        } catch (Exception ex) {
        }
        
        return lista;
    }
    
    public void listarImg(int id, HttpServletResponse response){
        String sql="select * from producto where id="+id;
        InputStream inputStream=null;
        OutputStream outputStream=null;
        BufferedInputStream bufferedInputStream =null;
        BufferedOutputStream bufferedOutputStream =null;
        response.setContentType("image/*");
        try{
            outputStream=response.getOutputStream();
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            if(rs.next()){
                inputStream=rs.getBinaryStream("image");
            }
            bufferedInputStream= new BufferedInputStream(inputStream);
            bufferedOutputStream= new BufferedOutputStream(outputStream);
            int i=0;
            while((i=bufferedInputStream.read())!=-1){
                bufferedOutputStream.write(i);
            }
        }catch(Exception e){
            
        }
        
    }
    
    public boolean insertarProducto(Producto producto){
        String sql="INSERT INTO producto(nombre, descripcion,precio,image) VALUES (?,?,?,?)";
       try{
           con=cn.getConnection();
           ps = con.prepareStatement(sql);
           ps.setString(1,producto.getNombre());
           ps.setString(2,producto.getDescripcion());
           ps.setDouble(3,producto.getPrecio());
           ps.setBlob(4,producto.getImagen());
            ps.executeUpdate();
           return true;
       }catch(SQLException e){
           System.out.println(e.toString());
           return false;
       }
   }
     public boolean actualizarProducto(Producto producto){
        String sql="UPDATE producto SET nombre=?, descripcion=?,precio=?,image=? WHERE id=?";
       try{
           con=cn.getConnection();
            ps=con.prepareStatement(sql);
           ps.setString(1,producto.getNombre());
           ps.setString(2,producto.getDescripcion());
           ps.setDouble(3,producto.getPrecio());
           ps.setBlob(4,producto.getImagen());
            ps.setInt(5, producto.getId());
           ps.execute();
           return true;
       }catch(SQLException e){
           System.out.println(e.toString());
           return false;
       }
   }
   
   public boolean eliminarProducto(int _id){
        PreparedStatement ps;
         String sql="DELETE FROM producto WHERE id=?";
       try{
           con=cn.getConnection();
           ps = con.prepareStatement(sql);
           ps.setInt(1, _id);
           ps.execute();
           
           return true;
       }catch(SQLException e){
           System.out.println(e.toString());
           return false;
       }
   }
}
