/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchGetDropboxFiles implements Database.AllowsCallouts, Database.Batchable<ECS.DropboxTypes.GetFiles>, Database.Stateful {
    global List<ECS.DropboxTypes.GetFiles> gfList {
        get;
        set;
    }
    global BatchGetDropboxFiles() {

    }
    global void execute(Database.BatchableContext bc, List<ECS.DropboxTypes.GetFiles> scope) {

    }
    global void finish(Database.BatchableContext bc) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
