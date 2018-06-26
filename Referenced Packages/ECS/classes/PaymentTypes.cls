/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PaymentTypes {
    global PaymentTypes() {

    }
global class AuthAndCaptureRequest {
    global Boolean authOnly {
        get;
        set;
    }
    global ECS__Address__c billingAddress {
        get;
        set;
    }
    global String cardNum {
        get;
        set;
    }
    global String cvv {
        get;
        set;
    }
    global String expirationDate {
        get;
        set;
    }
    global String memo {
        get;
        set;
    }
    global ECS__eCommSource_Order__c order {
        get;
        set;
    }
    global List<ECS__eCommSource_Order_Line__c> orderLines {
        get;
        set;
    }
    global ECS__Address__c shippingAddress {
        get;
        set;
    }
    global AuthAndCaptureRequest() {

    }
}
global class AuthAndCaptureResponse {
    global String authCode {
        get;
        set;
    }
    global String avsResponse {
        get;
        set;
    }
    global String errorMessage {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global String transactionId {
        get;
        set;
    }
    global AuthAndCaptureResponse() {

    }
}
global class AuthorizeNetServiceConstructor {
    global String merchantId {
        get;
        set;
    }
    global String transactionKey {
        get;
        set;
    }
    global AuthorizeNetServiceConstructor() {

    }
}
global class CaptureRequest {
    global Double amountToCapture {
        get;
        set;
    }
    global String authId {
        get;
        set;
    }
    global ECS__eCommSource_Order__c order {
        get;
        set;
    }
    global CaptureRequest() {

    }
}
global class CaptureResponse {
    global String errorMessage {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global String transactionId {
        get;
        set;
    }
    global CaptureResponse() {

    }
}
global class ChargeCardRequest {
    global Decimal amount;
    global String authCode;
    global String billingCity;
    global String billingCountry;
    global String billingEmail;
    global String billingFirstName;
    global String billingLastName;
    global String billingState;
    global String billingStreet;
    global String billingStreet2;
    global String billingZip;
    global String cardNumber;
    global String cardType;
    global String chargeType;
    global String cvv;
    global String description;
    global String email;
    global String expirationMonth;
    global String expirationYear;
    global String orderNumber;
    global String receiverEmail;
    global Double shippingAmount;
    global String shippingCity;
    global String shippingCountry;
    global String shippingEmail;
    global String shippingFirstName;
    global String shippingLastName;
    global String shippingPhone;
    global String shippingState;
    global String shippingStreet;
    global String shippingStreet2;
    global String shippingZip;
    global Double taxAmount;
}
global class CreateCustomerProfileTransactionRequest {
    global CreateCustomerProfileTransactionRequest() {

    }
}
global class CreateCustomerProfileTransactionResponse {
    global CreateCustomerProfileTransactionResponse() {

    }
}
global class CreateRecurringPaymentRequest {
    global String acct {
        get;
        set;
    }
    global String amt {
        get;
        set;
    }
    global String billingfrequency {
        get;
        set;
    }
    global String billingperiod {
        get;
        set;
    }
    global String creditcardtype {
        get;
        set;
    }
    global String description {
        get;
        set;
    }
    global String email {
        get;
        set;
    }
    global String expdate {
        get;
        set;
    }
    global String firstname {
        get;
        set;
    }
    global String initamt {
        get;
        set;
    }
    global String lastname {
        get;
        set;
    }
    global String profilestartdate {
        get;
        set;
    }
    global String pwd {
        get;
        set;
    }
    global Boolean sandbox {
        get;
        set;
    }
    global String signature {
        get;
        set;
    }
    global String subscribername {
        get;
        set;
    }
    global String user {
        get;
        set;
    }
    global CreateRecurringPaymentRequest() {

    }
}
global class CreateRecurringPaymentResponse {
    global String ack {
        get;
        set;
    }
    global String correlationid {
        get;
        set;
    }
    global String error {
        get;
        set;
    }
    global String profileid {
        get;
        set;
    }
    global String profilestatus {
        get;
        set;
    }
    global String rawresponse {
        get;
        set;
    }
    global String responseexception {
        get;
        set;
    }
    global Boolean result {
        get;
    }
    global CreateRecurringPaymentResponse() {

    }
}
global class CustomerProfileRequest {
    global String customerProfileId {
        get;
        set;
    }
    global CustomerProfileRequest() {

    }
}
global class GetTransactionDetailsRequest {
    global ECS__Payment_Detail__c paymentDetail {
        get;
        set;
    }
    global ECS__Payment_Settings__c paymentSetting {
        get;
        set;
    }
    global String transactionId {
        get;
        set;
    }
    global GetTransactionDetailsRequest() {

    }
}
global class GetTransactionDetailsResponse {
    global Contact customer {
        get;
        set;
    }
    global String errorMessage {
        get;
        set;
    }
    global ECS__eCommSource_Order__c order {
        get;
        set;
    }
    global List<ECS__eCommSource_Order_Line__c> orderLines {
        get;
        set;
    }
    global ECS__Payment_Detail__c paymentDetail {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global GetTransactionDetailsResponse() {

    }
}
global class ImportDetail {
    global Integer timeOffset {
        get;
        set;
    }
    global Integer timeOffsetEnd {
        get;
        set;
    }
    global ImportDetail() {

    }
}
global class InvoiceInfo {
    global String invoiceId {
        get;
        set;
    }
    global String status {
        get;
        set;
    }
    global InvoiceInfo() {

    }
}
global class PayPalServiceConstructor {
    global String receiverEmailAddress {
        get;
        set;
    }
    global PayPalServiceConstructor() {

    }
}
global class PaymentResponse {
    global String authCode {
        get;
        set;
    }
    global String avsResponse {
        get;
        set;
    }
    global String errorMessage {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global String transactionId {
        get;
        set;
    }
    global PaymentResponse() {

    }
}
global class PaymentServiceFactoryConstructor {
    global String orderId {
        get;
        set;
    }
    global PaymentServiceFactoryConstructor() {

    }
}
global class RefundTransactionRequest {
    global Decimal amount {
        get;
        set;
    }
    global String ccNum {
        get;
        set;
    }
    global String expDate {
        get;
        set;
    }
    global String memo {
        get;
        set;
    }
    global String refTxnId {
        get;
        set;
    }
    global String refundType {
        get;
        set;
    }
    global String txnId {
        get;
        set;
    }
    global RefundTransactionRequest() {

    }
}
global class RefundTransactionResponse {
    global String errorMessage {
        get;
        set;
    }
    global String origin {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global String returnTransactionId {
        get;
        set;
    }
    global RefundTransactionResponse() {

    }
}
global class SearchInvoicesRequest {
    global String gateway {
        get;
        set;
    }
    global Boolean isSandbox {
        get;
        set;
    }
    global Datetime paymentEndDate {
        get;
        set;
    }
    global Datetime paymentStartDate {
        get;
        set;
    }
    global SearchInvoicesRequest() {

    }
}
global class SearchInvoicesResponse {
    global String errorMessage {
        get;
        set;
    }
    global List<ECS.PaymentTypes.InvoiceInfo> invoiceInfo {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global SearchInvoicesResponse() {

    }
}
global class SearchTransactionRequest {
    global String orderId {
        get;
        set;
    }
    global String transactionClass {
        get;
        set;
    }
    global String transactionId {
        get;
        set;
    }
    global SearchTransactionRequest() {

    }
}
global class SearchTransactionResponse {
    global String ccLast4 {
        get;
        set;
    }
    global String customerEmail {
        get;
        set;
    }
    global String customerName {
        get;
        set;
    }
    global String errorMessage {
        get;
        set;
    }
    global Double paymentAmount {
        get;
        set;
    }
    global Double paymentFee {
        get;
        set;
    }
    global String paymentStatus {
        get;
        set;
    }
    global Datetime paymentTime {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global String transactionId {
        get;
        set;
    }
    global SearchTransactionResponse() {

    }
}
global class SendInvoiceRequest {
    global Double amount {
        get;
        set;
    }
    global ECS__Address__c billingAddress {
        get;
        set;
    }
    global String currencyCode {
        get;
        set;
    }
    global String description {
        get;
        set;
    }
    global Double discountAmount {
        get;
        set;
    }
    global Double discountPercent {
        get;
        set;
    }
    global String gateway {
        get;
        set;
    }
    global String invoiceNumber {
        get;
        set;
    }
    global Boolean isSandbox {
        get;
        set;
    }
    global String logoUrl {
        get;
        set;
    }
    global String merchantMemo {
        get;
        set;
    }
    global String note {
        get;
        set;
    }
    global ECS__eCommSource_Order__c o {
        get;
        set;
    }
    global List<ECS__eCommSource_Order_Line__c> orderLines {
        get;
        set;
    }
    global String paymentTerms {
        get;
        set;
    }
    global ECS__Address__c shippingAddress {
        get;
        set;
    }
    global Double shippingAmount {
        get;
        set;
    }
    global String subject {
        get;
        set;
    }
    global Double taxAmount {
        get;
        set;
    }
    global Double taxRate {
        get;
        set;
    }
    global String terms {
        get;
        set;
    }
    global SendInvoiceRequest() {

    }
}
global class SendInvoiceResponse {
    global String errorMessage {
        get;
        set;
    }
    global String invoiceId {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global SendInvoiceResponse() {

    }
}
global class VoidTransactionRequest {
    global String receiverEmail {
        get;
        set;
    }
    global String txnId {
        get;
        set;
    }
    global VoidTransactionRequest() {

    }
}
global class VoidTransactionResponse {
    global String errorMessage {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global VoidTransactionResponse() {

    }
}
}
