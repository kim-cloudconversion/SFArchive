/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class EcsModel {
    global List<ECS.EcsModel.Order> orders;
    global EcsModel() {

    }
global class Address {
    global String city;
    global String company;
    global String countryId;
    global String email;
    global String fax;
    global String firstName;
    global String id;
    global String lastName;
    global String middleName;
    global String phone;
    global String postalCode;
    global String region;
    global String regionId;
    global String street;
    global String street2;
    global String street3;
    global Address() {

    }
}
global class CampaignInfo {
    global String campaignName;
    global String content;
    global String medium;
    global String refererURL;
    global String source;
    global String term;
    global CampaignInfo() {

    }
}
global class Comment {
    global String comment;
    global String commentTime;
    global Comment() {

    }
}
global class CustomField {
    global String field {
        get;
        set;
    }
    global String value {
        get;
        set;
    }
    global CustomField() {

    }
}
global class Customer {
    global String company;
    global String email;
    global String firstName;
    global String id;
    global String lastName;
    global String middleName;
    global String phone;
    global String prefix;
    global String storeId;
    global String websiteId;
    global Customer() {

    }
}
global class Order {
    global ECS.EcsModel.Address billingAddress;
    global ECS.EcsModel.CampaignInfo campaign;
    global Date cancelDate;
    global String clientOrderIdentifier;
    global List<ECS.EcsModel.Comment> comments;
    global String couponCode;
    global String currencyCode;
    global ECS.EcsModel.Customer customer;
    global List<ECS.EcsModel.CustomField> customFields {
        get;
        set;
    }
    global Double discountTotal;
    global String externalOrderNumber;
    global String fulfillmentChannel;
    global String id;
    global String orderChannel;
    global List<ECS.EcsModel.OrderLine> orderLines;
    global String orderNumber;
    global String orderSetting;
    global String orderTime;
    global Double orderTotal;
    global String orderType;
    global String owner;
    global String paymentMethod;
    global List<ECS.EcsModel.PaymentInfo> payments;
    global String paymentStatus;
    global String placedBy;
    global String poNumber;
    global String quoteby;
    global String quotedby;
    global String quoteNumber;
    global String salesChannel;
    global Date shipDate;
    global List<ECS.EcsModel.ShippingInfo> shipping;
    global ECS.EcsModel.Address shippingAddress;
    global String shippingDescription;
    global String shippingInstructions;
    global String shippingMethod;
    global String shippingServiceLevel;
    global Double shippingTotal;
    global String status;
    global String storeId;
    global Double taxTotal;
    global Order() {

    }
}
global class OrderLine {
    global String asin;
    global List<ECS.EcsModel.CustomField> customFields {
        get;
        set;
    }
    global Double discountAmount;
    global Double discountPercent;
    global String fulfillmentPartner {
        get;
        set;
    }
    global String id;
    global String itemDescription;
    global String orderLineId;
    global Double price;
    global String productId;
    global Double quantity;
    global Double shippingAmount;
    global String sku;
    global Double taxAmount;
    global Double taxPercent;
    global String title;
    global Double unitWeight;
    global String upc;
    global String utmSource;
    global OrderLine() {

    }
}
global class PaymentInfo {
    global String ccNum;
    global String ccType;
    global String cvv;
    global String expirationMonth;
    global String expirationYear;
    global String id;
    global String paymentGateway;
    global Datetime paymentTime;
    global String recurrance;
    global String subscriptionId;
    global String transactionId;
    global PaymentInfo() {

    }
}
global class Product {
    global String ASIN;
    global Double availQuantity;
    global String barcode;
    global String bundle;
    global Double bundlePrice;
    global String Category;
    global String classification;
    global String Color;
    global String Condition;
    global String countryOfManufacture;
    global String EAN;
    global Double height;
    global String id;
    global Double length;
    global Double Price;
    global Double quantity;
    global String sku;
    global String title;
    global String UPC;
    global Double weight;
    global Double width;
    global Product() {

    }
}
global class ReturnsData {
    global String asin {
        get;
        set;
    }
    global String detailedDisposition {
        get;
        set;
    }
    global String fnsku {
        get;
        set;
    }
    global String fulfillmentCenterId {
        get;
        set;
    }
    global String orderId {
        get;
        set;
    }
    global String productName {
        get;
        set;
    }
    global String quantity {
        get;
        set;
    }
    global String reason {
        get;
        set;
    }
    global Datetime returnDate {
        get;
        set;
    }
    global String sku {
        get;
        set;
    }
    global ReturnsData() {

    }
}
global class ShippingInfo {
    global String id;
    global Datetime shippedTime;
    global String shippingCarrier;
    global String shippingClass;
    global String shippingStatus;
    global String trackingNumber;
    global ShippingInfo() {

    }
}
}
