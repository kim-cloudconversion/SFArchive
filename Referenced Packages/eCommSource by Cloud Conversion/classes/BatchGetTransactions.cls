/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchGetTransactions implements Database.AllowsCallouts, Database.Batchable<CloudConversion.eBayTypes.GetTransaction> {
    global List<CloudConversion.eBayTypes.GetTransaction> gtList {
        get;
        set;
    }
    global BatchGetTransactions() {

    }
    global void execute(Database.BatchableContext BC, List<CloudConversion.eBayTypes.GetTransaction> scope) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
