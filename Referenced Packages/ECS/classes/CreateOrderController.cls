/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CreateOrderController {
    global String completeOrderRedirectURL {
        get;
        set;
    }
    global Boolean displayAddOrderLine {
        get;
        set;
    }
    global Boolean displayAddresses {
        get;
        set;
    }
    global Boolean displayBillingAddress {
        get;
        set;
    }
    global Boolean displayCustomerSearch {
        get;
        set;
    }
    global Boolean displayDollarPromo {
        get;
        set;
    }
    global Boolean displayLineDollarPromo {
        get;
        set;
    }
    global Boolean displayLinePercentPromo {
        get;
        set;
    }
    global Boolean displayLineShipping {
        get;
        set;
    }
    global Boolean displayNotes {
        get;
        set;
    }
    global Boolean displayOrderSettings {
        get;
        set;
    }
    global Boolean displayOrderType {
        get;
        set;
    }
    global Boolean displayPercentPromo {
        get;
        set;
    }
    global Boolean displayPricebooks {
        get;
        set;
    }
    global Boolean displayPromoCode {
        get;
        set;
    }
    global Boolean displayRecurringOrder {
        get;
        set;
    }
    global Boolean displayShippingAddress {
        get;
        set;
    }
    global Boolean displayShippingOptions {
        get;
        set;
    }
    global Boolean displayTaxExempt {
        get;
        set;
    }
    global Boolean priceReadOnly {
        get;
        set;
    }
    global Boolean productReadOnly {
        get;
        set;
    }
    global Boolean quantityReadOnly {
        get;
        set;
    }
    global CreateOrderController(ApexPages.StandardController sc) {

    }
    @RemoteAction
    global static List<Contact> getCustomerSuggestions(String query) {
        return null;
    }
    @RemoteAction
    global static List<ECS__Product__c> getProductSuggestions(String query) {
        return null;
    }
    global void init() {

    }
    global void initEdit() {

    }
    global void initEditQuote() {

    }
    global void initQuote() {

    }
}
