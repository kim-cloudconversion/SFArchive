/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchExportOrders implements Database.AllowsCallouts, Database.Batchable<ECS__eCommSource_Order__c> {
    global Integer days {
        get;
        set;
    }
    global Integer endDays {
        get;
        set;
    }
    global String exportType {
        get;
        set;
    }
    global BatchExportOrders() {

    }
    global void execute(Database.BatchableContext bc, List<ECS__eCommSource_Order__c> orders) {

    }
    global void finish(Database.BatchableContext bc) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
