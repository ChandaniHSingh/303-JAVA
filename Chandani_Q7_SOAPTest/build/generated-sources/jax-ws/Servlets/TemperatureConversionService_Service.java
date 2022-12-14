
package Servlets;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.11-b150120.1832
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "TemperatureConversionService", targetNamespace = "http://SOAPServices/", wsdlLocation = "http://localhost:8080/Chandani_Q7_SOAPService/TemperatureConversionService?wsdl")
public class TemperatureConversionService_Service
    extends Service
{

    private final static URL TEMPERATURECONVERSIONSERVICE_WSDL_LOCATION;
    private final static WebServiceException TEMPERATURECONVERSIONSERVICE_EXCEPTION;
    private final static QName TEMPERATURECONVERSIONSERVICE_QNAME = new QName("http://SOAPServices/", "TemperatureConversionService");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:8080/Chandani_Q7_SOAPService/TemperatureConversionService?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        TEMPERATURECONVERSIONSERVICE_WSDL_LOCATION = url;
        TEMPERATURECONVERSIONSERVICE_EXCEPTION = e;
    }

    public TemperatureConversionService_Service() {
        super(__getWsdlLocation(), TEMPERATURECONVERSIONSERVICE_QNAME);
    }

    public TemperatureConversionService_Service(WebServiceFeature... features) {
        super(__getWsdlLocation(), TEMPERATURECONVERSIONSERVICE_QNAME, features);
    }

    public TemperatureConversionService_Service(URL wsdlLocation) {
        super(wsdlLocation, TEMPERATURECONVERSIONSERVICE_QNAME);
    }

    public TemperatureConversionService_Service(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, TEMPERATURECONVERSIONSERVICE_QNAME, features);
    }

    public TemperatureConversionService_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public TemperatureConversionService_Service(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns TemperatureConversionService
     */
    @WebEndpoint(name = "TemperatureConversionServicePort")
    public TemperatureConversionService getTemperatureConversionServicePort() {
        return super.getPort(new QName("http://SOAPServices/", "TemperatureConversionServicePort"), TemperatureConversionService.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns TemperatureConversionService
     */
    @WebEndpoint(name = "TemperatureConversionServicePort")
    public TemperatureConversionService getTemperatureConversionServicePort(WebServiceFeature... features) {
        return super.getPort(new QName("http://SOAPServices/", "TemperatureConversionServicePort"), TemperatureConversionService.class, features);
    }

    private static URL __getWsdlLocation() {
        if (TEMPERATURECONVERSIONSERVICE_EXCEPTION!= null) {
            throw TEMPERATURECONVERSIONSERVICE_EXCEPTION;
        }
        return TEMPERATURECONVERSIONSERVICE_WSDL_LOCATION;
    }

}
