/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SessionBeans;

import Entities.UserMaster;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Test
 */
@Local
public interface ManageUserBeanLocal {

    boolean addUser(int id,String name, String email, String password, String dob, String phone);

    String getUser(int id);
    
    public List<UserMaster> getAllProducts();
    
}
