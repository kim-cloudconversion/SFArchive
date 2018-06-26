/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchMakeEBayCalls implements Database.AllowsCallouts, Database.Batchable<CloudConversion__Inquiry_Setting__c>, Database.Stateful {
    global Datetime endDay {
        get;
        set;
    }
    global Datetime startDay {
        get;
        set;
    }
    global BatchMakeEBayCalls() {

    }
    global void execute(Database.BatchableContext BC, List<CloudConversion__Inquiry_Setting__c> scope) {

    }
    global void finish(Database.BatchableContext info) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
