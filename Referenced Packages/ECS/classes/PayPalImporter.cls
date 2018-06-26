/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PayPalImporter implements Database.AllowsCallouts, Database.Batchable<ECS.PaymentTypes.ImportDetail>, Database.Stateful {
    global List<ECS.PaymentTypes.ImportDetail> importDetails {
        get;
        set;
    }
    global String transactionClass {
        get;
        set;
    }
    global PayPalImporter() {

    }
    global void execute(Database.BatchableContext bc, List<ECS.PaymentTypes.ImportDetail> importDetails) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
