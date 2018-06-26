/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchManageImageStats implements Database.Batchable<ECS__Product__c> {
    global List<ECS__Product__c> prods {
        get;
        set;
    }
    global BatchManageImageStats() {

    }
    global void execute(Database.BatchableContext BC, List<ECS__Product__c> scope) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
