/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SOAPServices;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Sumit
 */
@WebService(serviceName = "TemperatureConversionService")
public class TemperatureConversionService {


    /**
     * Web service operation for F to C
     */
    @WebMethod(operationName = "DegFtoDegC")
    public float DegFtoDegC(@WebParam(name = "f") float f) {
        //TODO write your implementation code here:
        float c = (((f - 32) * 5) / 9);
        return c;
    }
    
    /**
     * Web service operation C to F
     */
    @WebMethod(operationName = "DegCtoDegF")
    public float DegCtoDegF(@WebParam(name = "c") float c) {
        //TODO write your implementation code here:
        float f = ((c * 9 / 5) + 32);
        return f;
    }
    
}
