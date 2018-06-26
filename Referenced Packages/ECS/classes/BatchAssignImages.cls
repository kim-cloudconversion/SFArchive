/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchAssignImages implements Database.Batchable<ECS.ManageProductImagesUtil.AssignImages> {
    global List<ECS.ManageProductImagesUtil.AssignImages> images {
        get;
        set;
    }
    global BatchAssignImages() {

    }
    global void execute(Database.BatchableContext bc, List<ECS.ManageProductImagesUtil.AssignImages> context) {

    }
    global void finish(Database.BatchableContext info) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
