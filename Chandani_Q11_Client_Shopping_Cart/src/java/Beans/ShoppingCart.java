/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Beans;

import java.beans.*;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Sumit
 */
public class ShoppingCart implements Serializable {
    private final ArrayList<CartItem> cartItems;
    
    public ShoppingCart() {
        cartItems = new ArrayList();
    }
    
    public void addItem(CartItem item){
        cartItems.add(item);
    }
    
    public void removeItem(CartItem item){
        cartItems.remove(item);
    }
    
    public ArrayList<CartItem> getAllItems(){
        return cartItems;
    }
    
    public void clearCart(){
        cartItems.clear();
    }
    
}
