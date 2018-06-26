/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchGetMessages implements Database.AllowsCallouts, Database.Batchable<CloudConversion__Inquiry_Setting__c>, Database.Stateful {
    global Integer endHour {
        get;
        set;
    }
    global Integer startHour {
        get;
        set;
    }
    global BatchGetMessages() {

    }
    global void execute(Database.BatchableContext BC, List<CloudConversion__Inquiry_Setting__c> scope) {

    }
    global void finish(Database.BatchableContext info) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}