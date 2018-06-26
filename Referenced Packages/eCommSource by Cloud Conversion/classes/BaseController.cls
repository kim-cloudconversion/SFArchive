/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class BaseController {
    global Id caseId {
        get;
        set;
    }
    global Id contactId {
        get;
        set;
    }
    global Case newCase;
    global Contact newContact {
        get;
        set;
    }
    global CloudConversion__Message__c newMessage;
    global Id orderId {
        get;
        set;
    }
    global Map<String,String> orderLineIds {
        get;
        set;
    }
    global String orderNumber;
    global System.PageReference cancel() {
        return null;
    }
}
