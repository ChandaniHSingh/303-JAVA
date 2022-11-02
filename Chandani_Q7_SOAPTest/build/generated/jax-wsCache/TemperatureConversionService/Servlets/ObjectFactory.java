
package Servlets;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the Servlets package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _DegCtoDegF_QNAME = new QName("http://SOAPServices/", "DegCtoDegF");
    private final static QName _DegCtoDegFResponse_QNAME = new QName("http://SOAPServices/", "DegCtoDegFResponse");
    private final static QName _DegFtoDegC_QNAME = new QName("http://SOAPServices/", "DegFtoDegC");
    private final static QName _DegFtoDegCResponse_QNAME = new QName("http://SOAPServices/", "DegFtoDegCResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: Servlets
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link DegCtoDegF }
     * 
     */
    public DegCtoDegF createDegCtoDegF() {
        return new DegCtoDegF();
    }

    /**
     * Create an instance of {@link DegCtoDegFResponse }
     * 
     */
    public DegCtoDegFResponse createDegCtoDegFResponse() {
        return new DegCtoDegFResponse();
    }

    /**
     * Create an instance of {@link DegFtoDegC }
     * 
     */
    public DegFtoDegC createDegFtoDegC() {
        return new DegFtoDegC();
    }

    /**
     * Create an instance of {@link DegFtoDegCResponse }
     * 
     */
    public DegFtoDegCResponse createDegFtoDegCResponse() {
        return new DegFtoDegCResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DegCtoDegF }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://SOAPServices/", name = "DegCtoDegF")
    public JAXBElement<DegCtoDegF> createDegCtoDegF(DegCtoDegF value) {
        return new JAXBElement<DegCtoDegF>(_DegCtoDegF_QNAME, DegCtoDegF.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DegCtoDegFResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://SOAPServices/", name = "DegCtoDegFResponse")
    public JAXBElement<DegCtoDegFResponse> createDegCtoDegFResponse(DegCtoDegFResponse value) {
        return new JAXBElement<DegCtoDegFResponse>(_DegCtoDegFResponse_QNAME, DegCtoDegFResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DegFtoDegC }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://SOAPServices/", name = "DegFtoDegC")
    public JAXBElement<DegFtoDegC> createDegFtoDegC(DegFtoDegC value) {
        return new JAXBElement<DegFtoDegC>(_DegFtoDegC_QNAME, DegFtoDegC.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DegFtoDegCResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://SOAPServices/", name = "DegFtoDegCResponse")
    public JAXBElement<DegFtoDegCResponse> createDegFtoDegCResponse(DegFtoDegCResponse value) {
        return new JAXBElement<DegFtoDegCResponse>(_DegFtoDegCResponse_QNAME, DegFtoDegCResponse.class, null, value);
    }

}
