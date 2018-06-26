/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchGetPaymentFees implements Database.AllowsCallouts, Database.Batchable<ECS__Payment_Detail__c> {
    global List<ECS__Payment_Detail__c> paymentDetails {
        get;
        set;
    }
    global BatchGetPaymentFees() {

    }
    global void execute(Database.BatchableContext bc, List<ECS__Payment_Detail__c> pdList) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
