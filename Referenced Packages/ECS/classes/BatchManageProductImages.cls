/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchManageProductImages implements Database.Batchable<String>, Database.Stateful {
    global List<String> batchIdentifiers {
        get;
        set;
    }
    global BatchManageProductImages() {

    }
    global void execute(Database.BatchableContext bc, List<String> context) {

    }
    global void finish(Database.BatchableContext info) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
