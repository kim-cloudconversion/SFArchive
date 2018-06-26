/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchGetPaymentDetails implements Database.AllowsCallouts, Database.Batchable<String> {
    global List<String> transactionIds {
        get;
        set;
    }
    global BatchGetPaymentDetails() {

    }
    global void execute(Database.BatchableContext bc, List<String> transactionIds) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
