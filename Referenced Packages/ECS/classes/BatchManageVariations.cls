/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchManageVariations implements Database.Batchable<ECS__Product__c> {
    global List<ECS__Product__c> products {
        get;
        set;
    }
    global BatchManageVariations() {

    }
    global void execute(Database.BatchableContext bc, List<ECS__Product__c> prodList) {

    }
    global void finish(Database.BatchableContext bc) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
