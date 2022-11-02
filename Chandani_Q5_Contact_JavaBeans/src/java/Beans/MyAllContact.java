/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Beans;

import java.beans.*;
import java.io.Serializable;
import java.sql.*;
import java.sql.DriverManager;
import java.util.ArrayList;

/**
 *
 * @author Sumit
 */
public class MyAllContact implements Serializable {

    private final ArrayList<ContactDetail> myContact;
    public MyAllContact() {
        myContact = new ArrayList();
    }
    
    public void addContact(ContactDetail c){
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            java.sql.Statement st = cn.createStatement();
             
            st.execute("insert into contact(name,mobile,email) values('"+c.getName()+"','"+c.getMobile()+"','"+c.getEmail()+"')");
            
        }
        catch(ClassNotFoundException e){
            System.out.println(e.toString());
        }
        catch(SQLException e){
            System.out.println(e.toString());
        }
    }
    
    public void removeContact(ContactDetail c){
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            java.sql.Statement st = cn.createStatement();
             
            st.execute("delete from contact where id = "+c.getId());
            
        }
        catch(ClassNotFoundException e){
            System.out.println(e.toString());
        }
        catch(SQLException e){
            System.out.println(e.toString());
        }
    }
    
    public void updateContact(ContactDetail c){
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            java.sql.Statement st = cn.createStatement();
             
            int ans = st.executeUpdate("update contact set name = '"+c.getName()+"', email = '"+c.getEmail()+"', mobile = '"+c.getMobile()+"' where id = "+c.getId());
            
        }
        catch(ClassNotFoundException e){
            System.out.println(e.toString());
        }
        catch(SQLException e){
            System.out.println(e.toString());
        }
    }
    
    public void clearContact(){
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            java.sql.Statement st = cn.createStatement();
             
            st.execute("delete from contact");
            
        }
        catch(ClassNotFoundException e){
            System.out.println(e.toString());
        }
        catch(SQLException e){
            System.out.println(e.toString());
        }
    }
    
    public ArrayList<ContactDetail> getAllContacts(){
        myContact.clear();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            java.sql.Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from contact");
            while(rs.next()){
                ContactDetail c = new ContactDetail();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setMobile(rs.getString("mobile"));
                c.setEmail(rs.getString("email"));
                
                myContact.add(c);
            }
        }
        catch(ClassNotFoundException e){
            System.out.println(e.toString());
        }
        catch(SQLException e){
            System.out.println(e.toString());
        }
        return myContact;
    }
    
    public ContactDetail getOneContact(int id){
        ContactDetail c = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            java.sql.Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from contact where id = "+id);
            while(rs.next()){
                c = new ContactDetail();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setMobile(rs.getString("mobile"));
                c.setEmail(rs.getString("email"));
            }
        }
        catch(ClassNotFoundException e){
            System.out.println(e.toString());
        }
        catch(SQLException e){
            System.out.println(e.toString());
        }
        return c;
    }
}
