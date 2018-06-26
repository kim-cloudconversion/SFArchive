/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class CreateRMAController extends CloudConversion.CreateCaseController {
    global Id customerId {
        get;
        set;
    }
    global Boolean displayESN {
        get;
        set;
    }
    global Boolean displayTax {
        get;
        set;
    }
    global Boolean embeddedEdition {
        get;
        set;
    }
    global Boolean exchangeSKURendered {
        get;
        set;
    }
    global String internalComment {
        get;
        set;
    }
    global Integer numCols {
        get;
        set;
    }
    global ECS__eCommSource_Order__c order {
        get;
        set;
    }
    global String orderNote {
        get;
        set;
    }
    global Map<String,String> reasonMap {
        get;
        set;
    }
    global Boolean replacementAmountRendered {
        get;
        set;
    }
    global Map<String,String> resolutionMap {
        get;
        set;
    }
    global List<CloudConversion.CreateRMAController.RMAInfo> rmainfo;
    global String stockUnitLabel {
        get;
        set;
    }
    global CreateRMAController() {

    }
    global List<CloudConversion.CreateRMAController.RMAInfo> getNewRMAInfo() {
        return null;
    }
    global List<System.SelectOption> getRMAReasonOptions() {
        return null;
    }
    global List<System.SelectOption> getResolutionOptions() {
        return null;
    }
    global System.PageReference handleExchanges() {
        return null;
    }
    global Boolean isValid() {
        return null;
    }
    global System.PageReference removeLine() {
        return null;
    }
global class RMAInfo {
    global Double discounts {
        get;
        set;
    }
    global String ESN {
        get;
        set;
    }
    global String id {
        get;
        set;
    }
    global Integer lineNumber {
        get;
        set;
    }
    global ECS__eCommSource_Order_Line__c orderLine {
        get;
        set;
    }
    global Double replacementAmount {
        get;
        set;
    }
    global CloudConversion__RMA_Line__c rma {
        get;
        set;
    }
    global String SKU {
        get;
        set;
    }
    global RMAInfo(CloudConversion__RMA_Line__c ra) {

    }
}
}
