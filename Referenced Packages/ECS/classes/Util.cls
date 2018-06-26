/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class Util {
    global Util() {

    }
    global static String buildOrQuery(String keywords) {
        return null;
    }
    global static Boolean createAddressesForOrders() {
        return null;
    }
    global static String escape(String str) {
        return null;
    }
    global static String get(String endpoint, String body, String contentType, String authHeader) {
        return null;
    }
    global static Map<String,String> getCAStateCodeMap() {
        return null;
    }
    global static Map<String,String> getCAStateMap() {
        return null;
    }
    global static String getCountryCode(String country) {
        return null;
    }
    global static Map<String,String> getCountryCodeMap() {
        return null;
    }
    global static Map<String,String> getCountryMap() {
        return null;
    }
    global static String getCurrencySymbol(SObject someObject) {
        return null;
    }
    global static String getCurrencySymbolFromIso(String Iso) {
        return null;
    }
    global static Datetime getLocalDateTime(String dateStr) {
        return null;
    }
    global static Datetime getLocalDateTime(Datetime z) {
        return null;
    }
    global static String getNodeText(dom.XmlNode node) {
        return null;
    }
    global static ECS__eCommSource_Order__c getOrderDetails(String orderId) {
        return null;
    }
    global static List<ECS__eCommSource_Order__c> getOrderDetails(Set<String> orderIds) {
        return null;
    }
    global static List<ECS__eCommSource_Order__c> getOrderDetails(Set<String> orderIds, Boolean getLines) {
        return null;
    }
    global static ECS__Address__c getOrganizationAddress() {
        return null;
    }
    global List<ECS__Payment_Settings__c> getPaymentSettings(String settingName) {
        return null;
    }
    global static Id getPersonAccountRecordTypeId(String recordTypeId) {
        return null;
    }
    global static Integer getPriceDecimalPlaces() {
        return null;
    }
    global static ECS__Product__c getProductInfo(String productId) {
        return null;
    }
    global static ECS__Product__c getProductInfo2(String productId) {
        return null;
    }
    global static List<ECS__Product__c> getProductInfo2(List<String> productIds) {
        return null;
    }
    global static List<ECS__Product__c> getProductInfo(List<String> productIds) {
        return null;
    }
    global static Integer getQtyDecimalPlaces() {
        return null;
    }
    global static ECS__Quote__c getQuoteDetails(String quoteId) {
        return null;
    }
    global static List<ECS__Quote__c> getQuoteDetails(Set<String> quoteIds) {
        return null;
    }
    global static ECS__Shipping_Map__c getShippingMap(String carrier, String shippingClass, String countryCode, String region) {
        return null;
    }
    global static String getState(String stateProvinceRegion) {
        return null;
    }
    global static String getStateCode(String stateProvinceRegion) {
        return null;
    }
    global static Map<String,String> getUSStateCodeMap() {
        return null;
    }
    global static Map<String,String> getUSStateMap() {
        return null;
    }
    global static String get(String endpoint, Map<String,String> params) {
        return null;
    }
    global static ECS.Util.Result handleUpsertResult(Database.UpsertResult result) {
        return null;
    }
    global static ECS.Util.Result handleUpsertResult(List<Database.UpsertResult> result) {
        return null;
    }
    global static Boolean isBatchApexJobRunning(String className) {
        return null;
    }
    global static Boolean isPersonAccount() {
        return null;
    }
    global static String post(String endpoint, String body, String contentType, String authHeader) {
        return null;
    }
    global static String post(String endpoint, String body, String contentType, String authHeader, Boolean compressed) {
        return null;
    }
    global static void printNode(dom.XmlNode node) {

    }
    global static ECS.Util.Result processSaveResult(Database.SaveResult res) {
        return null;
    }
    global static ECS.Util.Result processSaveResults(List<Database.SaveResult> res) {
        return null;
    }
    global static ECS__Product__c putProductVal(ECS__Product__c p, String key, Object val) {
        return null;
    }
    global static ECS__Supplier_Product__c putSupplierProductVal(ECS__Supplier_Product__c sp, String key, Object val) {
        return null;
    }
    global static String removeDelim(String delim, String line) {
        return null;
    }
    global static List<System.SelectOption> selectOptionSortByLabel(List<System.SelectOption> selectOptionsToSort) {
        return null;
    }
    global static List<System.SelectOption> selectOptionSortByValue(List<System.SelectOption> selectOptionsToSort) {
        return null;
    }
    global static void sendEmail(String displayName, String replyTo, String toEmail, String subject, String body) {

    }
    global static Boolean sendEmail(String displayName, String replyTo, List<String> toEmail, String subject, String body, List<Attachment> files) {
        return null;
    }
    global static Boolean sendEmail(String displayName, String replyTo, String toEmail, String subject, String body, List<Attachment> files) {
        return null;
    }
    global static Boolean validateEmail(String email) {
        return null;
    }
global class Error {
    global String errorMessage {
        get;
        set;
    }
    global List<String> fieldList {
        get;
        set;
    }
    global String id {
        get;
        set;
    }
    global Error() {

    }
}
global class Result {
    global List<ECS.Util.Error> errors {
        get;
        set;
    }
    global Integer failures {
        get;
        set;
    }
    global Integer numCreated {
        get;
        set;
    }
    global Integer numUpdated {
        get;
        set;
    }
    global Integer successes {
        get;
        set;
    }
    global List<String> successIds {
        get;
        set;
    }
    global Result() {

    }
}
}
