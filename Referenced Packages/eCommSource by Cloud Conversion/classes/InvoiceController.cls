/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvoiceController {
    global Integer numOrders {
        get;
        set;
    }
    global Id orderId {
        get;
        set;
    }
    global String orderIds {
        get;
        set;
    }
    global String organizationName {
        get;
        set;
    }
    global List<CloudConversion__RMA_Line__c> replacementLines {
        get;
        set;
    }
    global String rmaComment {
        get;
        set;
    }
    global List<CloudConversion__RMA_Line__c> rmaLines {
        get;
        set;
    }
    global CloudConversion__Return_Request_Setting__c rrs {
        get;
        set;
    }
    global ECS__Shipping_Detail__c sd {
        get;
        set;
    }
    global User user {
        get;
        set;
    }
    global InvoiceController() {

    }
    global InvoiceController(ApexPages.StandardController sc) {

    }
    global ECS__eCommSource_Order__c getOrder() {
        return null;
    }
    global List<CloudConversion.InvoiceController.Order> getOrdersObj() {
        return null;
    }
    global List<ECS__eCommSource_Order__c> getOrders() {
        return null;
    }
    global void updateOrders() {

    }
global class Order implements System.Comparable {
    global ECS__Address__c billingAddress {
        get;
        set;
    }
    global String firstWarehouseLocation {
        get;
        set;
    }
    global Integer numLineItems {
        get;
        set;
    }
    global ECS__eCommSource_Order__c o {
        get;
        set;
    }
    global String rmaComment {
        get;
        set;
    }
    global ECS__Shipping_Detail__c sd {
        get;
        set;
    }
    global ECS__Address__c shippingAddress {
        get;
        set;
    }
    global Order() {

    }
    global Integer compareTo(Object compareTo) {
        return null;
    }
}
}
