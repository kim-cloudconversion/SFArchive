/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class CC_XmlNode {
    global List<CloudConversion.CC_XmlNode> childNodes {
        get;
    }
    global CloudConversion.CC_XmlNode firstChild {
        get;
    }
    global CloudConversion.CC_XmlNode lastChild {
        get;
    }
    global static Integer MAX_ELEMENTS_TILL_LEAF;
    global String namespaceURI {
        get;
        set;
    }
    global CloudConversion.CC_XmlNode nextSibling {
        get;
    }
    global String nodeName {
        get;
    }
    global Integer nodeType {
        get;
    }
    global String nodeValue {
        get;
        set;
    }
    global CloudConversion.CC_XmlNode parentNode {
        get;
    }
    global String prefix {
        get;
    }
    global CloudConversion.CC_XmlNode previousSibling {
        get;
    }
    global CloudConversion.CC_XmlNode root {
        get;
    }
    global String textContent {
        get;
        set;
    }
    global dom.XmlNode xmlNode {
        get;
    }
    global CC_XmlNode(dom.XmlNode node) {

    }
    global virtual CloudConversion.CC_XmlNode appendChild(CloudConversion.CC_XmlNode nodeToAppend) {
        return null;
    }
    global virtual CloudConversion.CC_XmlNode appendChild(dom.XmlNode nodeToAppend) {
        return null;
    }
    global virtual CloudConversion.CC_XmlNode cloneNode(Boolean deep) {
        return null;
    }
    global virtual String getAttribute(String name) {
        return null;
    }
    global virtual CloudConversion.CC_XmlNode getElementByTagName(String nam) {
        return null;
    }
    global virtual List<CloudConversion.CC_XmlNode> getElementsByTagNameNS(String namespaceURI, String nam) {
        return null;
    }
    global virtual List<CloudConversion.CC_XmlNode> getElementsByTagName(String nam) {
        return null;
    }
    global virtual Boolean hasAttributes() {
        return null;
    }
    global virtual Boolean hasChildNodes() {
        return null;
    }
    global virtual Boolean isDefaultNamespace(String uri) {
        return null;
    }
    global virtual String lookupNamespaceURI(String prefix) {
        return null;
    }
    global virtual String lookupPrefix(String nsURI) {
        return null;
    }
    global virtual Boolean removeChild(CloudConversion.CC_XmlNode child) {
        return null;
    }
    global String toXmlString() {
        return null;
    }
}
