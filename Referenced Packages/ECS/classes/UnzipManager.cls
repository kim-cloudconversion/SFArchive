/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class UnzipManager implements Database.AllowsCallouts, Database.Batchable<String>, Database.Stateful {
    global List<Attachment> atts;
    global Boolean print;
    global List<String> targetIds;
    global UnzipManager(List<String> tids, Boolean doPrint) {

    }
    global void execute(Database.BatchableContext BC, List<String> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global System.Iterable start(Database.BatchableContext info) {
        return null;
    }
}
