/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchCreatePaymentProfile implements Database.AllowsCallouts, Database.Batchable<SObject> {
    global String ccGatewayName {
        get;
        set;
    }
    global List<String> profileIds {
        get;
        set;
    }
    global BatchCreatePaymentProfile() {

    }
    global void execute(Database.BatchableContext bc, List<ECS__Payment_Profile__c> paymentProfileList) {

    }
    global void finish(Database.BatchableContext bc) {

    }
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return null;
    }
}
