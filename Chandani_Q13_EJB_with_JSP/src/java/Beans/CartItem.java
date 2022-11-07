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
public class CartItem implements Serializable {
    
    private int itemid;
    private int amt;
    private int itemqty;
    
    public int getItemqty() {
        return itemqty;
    }
    public void setItemqty(int itemqty) {
        this.itemqty = itemqty;
    }
    
    public int getAmt() {
        return amt;
    }
    public void setAmt(int amt) {
        this.amt = amt;
    }
    
    public int getItemid() {
        return itemid;
    }
    public void setItemid(int itemid) {
        this.itemid = itemid;
    }
}
