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
public class InterestCalcSessionBean implements InterestCalcSessionBeanLocal {

    @Override
    public float SimpleInterest(int p, float r, int n) {
        return (p * r * n)/100;
    }

    @Override
    public float CompoundInterest(int p, float r, int n) {
        float x =1 + r/100;
        return (float) (p * (Math.pow(x,n)) - p);
    }
    
}
