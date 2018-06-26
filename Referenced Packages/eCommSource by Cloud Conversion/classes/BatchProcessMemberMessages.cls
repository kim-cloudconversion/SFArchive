/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchProcessMemberMessages implements Database.Batchable<CloudConversion.eBayTypes.MemberMessage> {
    global List<CloudConversion.eBayTypes.MemberMessage> mmList {
        get;
        set;
    }
    global BatchProcessMemberMessages() {

    }
    global void execute(Database.BatchableContext BC, List<CloudConversion.eBayTypes.MemberMessage> scope) {

    }
    global void finish(Database.BatchableContext info) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
}
