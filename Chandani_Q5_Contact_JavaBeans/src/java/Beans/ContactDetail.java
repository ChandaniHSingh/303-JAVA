/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Beans;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author Sumit
 */
public class ContactDetail implements Serializable {
    
    private int id;
    
    private String name;

    private String mobile;

    private String email;
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

   
    public String getName() {
        return name;
    }

  
    public void setName(String name) {
        this.name = name;
    }

   
    public int getId() {
        return id;
    }

   
    public void setId(int id) {
        this.id = id ;
    }

}
