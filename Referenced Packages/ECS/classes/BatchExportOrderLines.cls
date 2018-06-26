/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchExportOrderLines implements Database.AllowsCallouts, Database.Batchable<ECS__eCommSource_Order_Line__c> {
    global Integer days {
        get;
        set;
    }
    global Integer endDays {
        get;
        set;
    }
    global BatchExportOrderLines() {

    }
    global void execute(Database.BatchableContext bc, List<ECS__eCommSource_Order_Line__c> orderLines) {

    }
    global void finish(Database.BatchableContext bc) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
