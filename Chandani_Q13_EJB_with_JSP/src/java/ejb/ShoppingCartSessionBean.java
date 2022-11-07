/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ejb;

import Beans.CartItem;
import java.util.ArrayList;
import javax.ejb.Stateful;

/**
 *
 * @author Sumit
 */
@Stateful
public class ShoppingCartSessionBean implements ShoppingCartSessionBeanLocal {

    private final ArrayList<CartItem> cartItems;
    
    public ShoppingCartSessionBean() {
        cartItems = new ArrayList<CartItem>();
    }
    
    @Override
    public void addItem(CartItem item){
        cartItems.add(item);
    }
    
    @Override
    public void removeItem(CartItem item){
        cartItems.remove(item);
    }
    
    @Override
    public ArrayList<CartItem> getAllItems(){
        return cartItems;
    }
    
    @Override
    public void clearCart(){
        cartItems.clear();
    }

    
}
