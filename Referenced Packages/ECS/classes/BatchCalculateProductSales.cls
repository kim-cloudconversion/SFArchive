/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchCalculateProductSales implements Database.Batchable<SObject> {
    global Boolean isDropShip {
        get;
        set;
    }
    global BatchCalculateProductSales() {

    }
    global void execute(Database.BatchableContext bc, List<ECS__Product__c> context) {

    }
    global void finish(Database.BatchableContext bc) {

    }
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return null;
    }
}
