/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ejb;

import javax.ejb.Stateless;

/**
 *
 * @author Sumit
 */
@Stateless
public class FirstSessionBean {

    private String name;
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String sayHello() {
        StringBuilder sb= new StringBuilder("Hello ");
        sb.append(this.getName()).append("!");
        return sb.toString();
    }
}
