/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ejb;

import Beans.CartItem;
import javax.ejb.Local;
import java.util.ArrayList;

/**
 *
 * @author Sumit
 */
@Local
public interface ShoppingCartSessionBeanLocal {

    void addItem(CartItem c);
    public void removeItem(CartItem item);
    public ArrayList<CartItem> getAllItems();
    public void clearCart();
    
}
