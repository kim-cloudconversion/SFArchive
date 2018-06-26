/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MassUpdate implements Database.Batchable<SObject> {
    global Map<String,String> nvMap {
        get;
        set;
    }
    global String query;
    global MassUpdate() {

    }
    global void execute(Database.BatchableContext BC, List<SObject> records) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return null;
    }
}
