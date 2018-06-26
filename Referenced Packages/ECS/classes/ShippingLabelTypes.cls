/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ShippingLabelTypes {
    global ShippingLabelTypes() {

    }
    global static ECS.ShippingLabelTypes.Shipment getTestShipment() {
        return null;
    }
global class BuyLabelForLowestRateRequest {
    global ECS.ShippingLabelTypes.Shipment s {
        get;
        set;
    }
    global BuyLabelForLowestRateRequest() {

    }
}
global class CreatePickupRequest {
    global ECS__Address__c address {
        get;
        set;
    }
    global String instructions {
        get;
        set;
    }
    global Datetime maxPickupDate {
        get;
        set;
    }
    global Datetime minPickupDate {
        get;
        set;
    }
    global String reference {
        get;
        set;
    }
    global String shipmentId {
        get;
        set;
    }
    global CreatePickupRequest() {

    }
}
global class CreatePickupResponse {
    global Boolean result {
        get;
        set;
    }
    global CreatePickupResponse() {

    }
}
global class Dimension {
    global Decimal height {
        get;
        set;
    }
    global Decimal length {
        get;
        set;
    }
    global Decimal width {
        get;
        set;
    }
    global Dimension() {

    }
    global Dimension(Decimal h, Decimal l, Decimal w) {

    }
}
global class GetLabelRequest {
    global String rateId {
        get;
        set;
    }
    global String shipmentId {
        get;
        set;
    }
    global GetLabelRequest() {

    }
}
global class GetRatesResponse {
    global Map<Double,ECS.ShippingLabelTypes.Rate> rates {
        get;
        set;
    }
    global String response {
        get;
        set;
    }
    global GetRatesResponse() {

    }
}
global class LabelInfo {
    global String label {
        get;
        set;
    }
    global String labelUrl {
        get;
        set;
    }
    global ECS.ShippingLabelTypes.Rate rate {
        get;
        set;
    }
    global String response {
        get;
        set;
    }
    global String trackingNumber {
        get;
        set;
    }
    global LabelInfo() {

    }
}
global class OrderPackage {
    global ECS.ShippingLabelTypes.Dimension dimension {
        get;
        set;
    }
    global Boolean isCylinder {
        get;
        set;
    }
    global Boolean isGift {
        get;
        set;
    }
    global String unitType {
        get;
        set;
    }
    global Decimal weight {
        get;
        set;
    }
    global OrderPackage() {

    }
}
global class Rate {
    global String carrier {
        get;
        set;
    }
    global Double rate {
        get;
        set;
    }
    global String rateId {
        get;
        set;
    }
    global String service {
        get;
        set;
    }
    global String shipmentId {
        get;
        set;
    }
    global Rate() {

    }
}
global class Shipment {
    global String customsInfoId {
        get;
        set;
    }
    global Boolean isReturn {
        get;
        set;
    }
    global ECS.ShippingLabelTypes.OrderPackage orderPackage {
        get;
        set;
    }
    global ECS__Address__c sfa {
        get;
        set;
    }
    global ECS__Address__c sta {
        get;
        set;
    }
    global String upsReturnService {
        get;
        set;
    }
    global Shipment(ECS__Address__c shipToAddress, ECS__Address__c shipFromAddress, ECS.ShippingLabelTypes.OrderPackage op, Boolean ret) {

    }
}
}
