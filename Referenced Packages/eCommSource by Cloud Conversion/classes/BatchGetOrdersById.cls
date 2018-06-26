/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchGetOrdersById implements Database.AllowsCallouts, Database.Batchable<String> {
    global List<String> orderIds {
        get;
        set;
    }
    global CloudConversion__Inquiry_Setting__c s {
        get;
        set;
    }
    global BatchGetOrdersById() {

    }
    global void execute(Database.BatchableContext BC, List<String> scope) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
