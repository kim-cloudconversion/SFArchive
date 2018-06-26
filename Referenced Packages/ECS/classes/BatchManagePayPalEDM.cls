/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchManagePayPalEDM implements Database.AllowsCallouts, Database.Batchable<ECS.PayPalEdmService.DisputeInfo> {
    global List<ECS.PayPalEdmService.DisputeInfo> disputeList {
        get;
        set;
    }
    global ECS__FTP_File__c file {
        get;
        set;
    }
    global String partnerId {
        get;
        set;
    }
    global BatchManagePayPalEDM() {

    }
    global void execute(Database.BatchableContext bc, List<ECS.PayPalEdmService.DisputeInfo> scope) {

    }
    global void finish(Database.BatchableContext bc) {

    }
    global System.Iterable start(Database.BatchableContext bc) {
        return null;
    }
}
