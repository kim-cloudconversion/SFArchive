/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchPCloudSync implements Database.AllowsCallouts, Database.Batchable<String>, Database.Stateful {
    global List<String> imageIds {
        get;
        set;
    }
    global List<String> items;
    global BatchPCloudSync() {

    }
    global void execute(Database.BatchableContext BC, List<String> scope) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
