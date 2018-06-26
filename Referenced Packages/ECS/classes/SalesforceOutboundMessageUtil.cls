/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SalesforceOutboundMessageUtil {
    global SalesforceOutboundMessageUtil() {

    }
    global static String getXMLResponse(Boolean result) {
        return null;
    }
    global static Boolean isOutboundMessageValid(String xml) {
        return null;
    }
    global static ECS.SalesforceOutboundMessageUtil.OutboundMessage parseOutboundMessageXML(String xml) {
        return null;
    }
global class Notification {
    global Map<String,String> fieldMap {
        get;
        set;
    }
    global String sObjectId {
        get;
        set;
    }
    global String sObjectType {
        get;
        set;
    }
    global Notification() {

    }
}
global class OutboundMessage {
    global String actionId {
        get;
        set;
    }
    global List<ECS.SalesforceOutboundMessageUtil.Notification> notifications {
        get;
        set;
    }
    global String orgId {
        get;
        set;
    }
    global String sessionId {
        get;
        set;
    }
    global OutboundMessage() {

    }
}
}
