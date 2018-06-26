/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchProcessImageBarcodes implements Database.AllowsCallouts, Database.Batchable<ECS__Image__c>, Database.Stateful {
    global List<ECS__Image__c> imageList {
        get;
        set;
    }
    global BatchProcessImageBarcodes() {

    }
    global void execute(Database.BatchableContext BC, List<ECS__Image__c> scope) {

    }
    global void finish(Database.BatchableContext info) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
