/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchPrint implements Database.AllowsCallouts, Database.Batchable<ECS.PrintUtil.Print> {
    global List<ECS.PrintUtil.Print> pList {
        get;
        set;
    }
    global String printerId {
        get;
        set;
    }
    global BatchPrint() {

    }
    global void execute(Database.BatchableContext BC, List<ECS.PrintUtil.Print> scope) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
