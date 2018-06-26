/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchSyncTaxJarTransactions implements Database.AllowsCallouts, Database.Batchable<String> {
    global List<String> orderIds {
        get;
        set;
    }
    global BatchSyncTaxJarTransactions() {

    }
    global void execute(Database.BatchableContext bc, List<String> scope) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
