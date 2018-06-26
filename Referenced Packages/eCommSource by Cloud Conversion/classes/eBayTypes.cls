/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class eBayTypes {
    global eBayTypes() {

    }
global class EBayCaseInfo {
    global String caseId {
        get;
        set;
    }
    global CloudConversion__Inquiry_Setting__c inquirySetting {
        get;
        set;
    }
    global EBayCaseInfo() {

    }
}
global class EBayReturnsPage {
    global CloudConversion__Inquiry_Setting__c inquirySetting {
        get;
        set;
    }
    global Integer pageLimit {
        get;
        set;
    }
    global Integer pageNumber {
        get;
        set;
    }
    global EBayReturnsPage() {

    }
}
global class EndItemRequest {
    global String eBayUserId {
        get;
        set;
    }
    global String itemId {
        get;
        set;
    }
    global String reason {
        get;
        set;
    }
    global EndItemRequest() {

    }
}
global class GetBestOffers {
    global Integer page {
        get;
        set;
    }
    global CloudConversion__Inquiry_Setting__c setting {
        get;
        set;
    }
    global GetBestOffers() {

    }
}
global class GetCategories {
    global Integer entriesPerPage {
        get;
        set;
    }
    global Integer page {
        get;
        set;
    }
    global CloudConversion__Inquiry_Setting__c setting {
        get;
        set;
    }
    global Datetime startFromDate {
        get;
        set;
    }
    global Datetime startToDate {
        get;
        set;
    }
    global GetCategories() {

    }
}
global class GetCategorySpecifics {
    global Integer categoryId {
        get;
        set;
    }
    global GetCategorySpecifics() {

    }
}
global class GetListings {
    global String itemId {
        get;
        set;
    }
    global CloudConversion__Best_Offer__c offer {
        get;
        set;
    }
    global CloudConversion__Inquiry_Setting__c setting {
        get;
        set;
    }
    global String sku {
        get;
        set;
    }
    global String txnId {
        get;
        set;
    }
    global GetListings() {

    }
}
global class GetSellerList {
    global Integer entriesPerPage {
        get;
        set;
    }
    global Integer page {
        get;
        set;
    }
    global CloudConversion__Inquiry_Setting__c setting {
        get;
        set;
    }
    global List<String> skus {
        get;
        set;
    }
    global Datetime startFromDate {
        get;
        set;
    }
    global Datetime startToDate {
        get;
        set;
    }
    global GetSellerList() {

    }
}
global class GetSellerListings {
    global Integer dayIncrement {
        get;
        set;
    }
    global Integer entriesPerPage {
        get;
        set;
    }
    global CloudConversion__Inquiry_Setting__c inquirySetting {
        get;
        set;
    }
    global Integer numBatches {
        get;
        set;
    }
    global GetSellerListings() {

    }
}
global class GetTransaction {
    global String eBayUserId {
        get;
        set;
    }
    global String itemId {
        get;
        set;
    }
    global Datetime orderTime {
        get;
        set;
    }
    global String txnId {
        get;
        set;
    }
    global GetTransaction() {

    }
}
global class MemberMessage {
    global String anonymousEmail {
        get;
        set;
    }
    global String body {
        get;
        set;
    }
    global String buyerEmail {
        get;
        set;
    }
    global String buyerUserId {
        get;
        set;
    }
    global String caseNumber {
        get;
        set;
    }
    global Datetime creationDate {
        get;
        set;
    }
    global String itemId {
        get;
        set;
    }
    global String itemImageURL {
        get;
        set;
    }
    global String itemTitle {
        get;
        set;
    }
    global Datetime listingEndTime {
        get;
        set;
    }
    global String location {
        get;
        set;
    }
    global String messageId {
        get;
        set;
    }
    global Map<String,String> messageMediaMap {
        get;
        set;
    }
    global String messageType {
        get;
        set;
    }
    global Boolean needToInsert {
        get;
        set;
    }
    global List<String> photos {
        get;
        set;
    }
    global String questionType {
        get;
        set;
    }
    global String sellerId {
        get;
        set;
    }
    global String subject {
        get;
        set;
    }
    global String threadId {
        get;
        set;
    }
    global MemberMessage() {

    }
}
global class RespondToOffers {
    global String action {
        get;
        set;
    }
    global Double amount {
        get;
        set;
    }
    global Integer counterOfferQuantity {
        get;
        set;
    }
    global String eBayUserId {
        get;
        set;
    }
    global String itemId {
        get;
        set;
    }
    global String message {
        get;
        set;
    }
    global String offerId {
        get;
        set;
    }
    global RespondToOffers() {

    }
}
global class SellerListingsResponse {
    global String ack {
        get;
        set;
    }
    global Boolean hasMoreItems {
        get;
        set;
    }
    global List<String> itemIds {
        get;
        set;
    }
    global String timestamp {
        get;
        set;
    }
    global Integer totalNumberOfEntries {
        get;
        set;
    }
    global Integer totalNumberOfPages {
        get;
        set;
    }
    global SellerListingsResponse() {

    }
}
}
