/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchUpdateImages implements Database.Batchable<ECS__Image__c> {
    global List<ECS__Image__c> images {
        get;
        set;
    }
    global BatchUpdateImages() {

    }
    global void execute(Database.BatchableContext BC, List<ECS__Image__c> scope) {

    }
    global void finish(Database.BatchableContext info) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
