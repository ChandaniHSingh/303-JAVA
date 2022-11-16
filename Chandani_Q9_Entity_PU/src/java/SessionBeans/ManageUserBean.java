/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SessionBeans;

import Entities.UserMaster;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Test
 */
@Stateless
public class ManageUserBean implements ManageUserBeanLocal {
    @PersistenceContext(unitName = "Chandani_Q9_Entity_PUPU")
    private EntityManager em;

    @Override
    public boolean addUser(int id,String name, String email, String password, String dob, String phone) {
        try{
            UserMaster u = new UserMaster(id,name,email,password,dob,phone,"No");
            em.persist(u);
            return true;
        }
            catch(Exception e){
            return false;
        }
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public void persist(Object object) {
        em.persist(object);
    }

    @Override
    public String getUser(int id) {
       Query myQuery = em.createNamedQuery("UserMaster.findByUid");
        myQuery.setParameter("uid", id);
        UserMaster myUserObj  = (UserMaster)myQuery.getSingleResult();
        if(myUserObj != null)
            return myUserObj.getUid() + "-" + myUserObj.getName();
        else
            return "User not found";
    }
    
    @Override
    public List<UserMaster> getAllProducts() {
        Query listAllQuery = em.createNamedQuery("UserMaster.findAll");
        List<UserMaster> myUserList = listAllQuery.getResultList();
       
        return myUserList;
    }
}
