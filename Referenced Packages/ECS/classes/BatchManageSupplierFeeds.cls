/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchManageSupplierFeeds implements Database.AllowsCallouts, Database.Batchable<ECS__FTP_Setting__c>, Database.Stateful {
    global List<ECS__FTP_Setting__c> settings {
        get;
        set;
    }
    global BatchManageSupplierFeeds() {

    }
    global void execute(Database.BatchableContext BC, List<ECS__FTP_Setting__c> scope) {

    }
    global void finish(Database.BatchableContext info) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
