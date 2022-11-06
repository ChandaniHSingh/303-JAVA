/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package RESTFulServices;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;

/**
 * REST Web Service
 *
 * @author Sumit
 */
@Path("contact")
public class ContactResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of ContactResource
     */
    public ContactResource() {
    }

    /**
     * Retrieves representation of an instance of RESTFulServices.ContactResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("application/json")
    public ArrayList<ContactDetail> getJson() {
        
        ArrayList<ContactDetail> myContact = new ArrayList<>();
        //String str = "";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from contact");
            while(rs.next()){
                ContactDetail c = new ContactDetail();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setMobile(rs.getString("mobile"));
                c.setEmail(rs.getString("email"));
                myContact.add(c);
                //str += c;
            }
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(ContactResource.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ContactResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return myContact;
    }

    /**
     * Retrieves representation of an instance of RESTFulServices.ContactResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("application/json")
    @Path("{id}")
    public ContactDetail getJson(@PathParam("id") int id) {
        
        ContactDetail c = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from contact where id = "+id);
            while(rs.next()){
                c = new ContactDetail();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setMobile(rs.getString("mobile"));
                c.setEmail(rs.getString("email"));
                
            }
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(ContactResource.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ContactResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
    /**
     * POST method for updating or creating an instance of ProductResource
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @POST
    @Consumes("application/json")
    @Produces("application/json")
    public String  postJson(ContactDetail c) {
        int no_of_rows_updated =0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            Statement st = cn.createStatement();
            no_of_rows_updated = st.executeUpdate("insert into contact(name,mobile,email) values ('" + c.getName()+ "','" + c.getMobile()+ "','" + c.getEmail()+ "')");
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ContactResource.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ContactResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        String status = "{'status' : false}";
        if(no_of_rows_updated > 0)
          status = "{'status' : true}";
        return status;
    }
    /**
     * DELETE method for updating or creating an instance of ProductResource
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @DELETE
    @Consumes("application/json")
    @Path("{id}")
    public String deleteJson(@PathParam("id") int id) {
        int no_of_rows_updated =0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            Statement st = cn.createStatement();
            no_of_rows_updated = st.executeUpdate("delete from contact where id = "+id);
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(ContactResource.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ContactResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        String status = "{'status' : false}";
        if(no_of_rows_updated > 0)
          status = "{'status' : true}";
        return status;
    }
    /**
     * PUT method for updating or creating an instance of ContactResource
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @PUT
    @Consumes("application/json")
    public String putJson(ContactDetail c) {
        int no_of_rows_updated =0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chandani?zeroDateTimeBehavior=convertToNull","root","");
            Statement st = cn.createStatement();
            no_of_rows_updated = st.executeUpdate("update contact set name = '"+c.getName()+"', email = '"+c.getEmail()+"', mobile = '"+c.getMobile()+"' where id = "+c.getId());
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(ContactResource.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ContactResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        String status = "{'status' : false}";
        if(no_of_rows_updated > 0)
          status = "{'status' : true}";
        return status;
    }
}
