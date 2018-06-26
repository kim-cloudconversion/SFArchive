/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BatchGetSellerList implements Database.AllowsCallouts, Database.Batchable<CloudConversion.eBayTypes.GetSellerList>, Database.Stateful {
    global Integer dayIncrement {
        get;
        set;
    }
    global Integer entriesPerPage {
        get;
        set;
    }
    global List<CloudConversion.eBayTypes.GetSellerList> gslList {
        get;
        set;
    }
    global Integer numBatches {
        get;
        set;
    }
    global BatchGetSellerList() {

    }
    global BatchGetSellerList(CloudConversion.BatchGetSellerList.Constructor c) {

    }
    global void execute(Database.BatchableContext BC, List<CloudConversion.eBayTypes.GetSellerList> scope) {

    }
    global void finish(Database.BatchableContext info) {

    }
    global System.Iterable start(Database.BatchableContext BC) {
        return null;
    }
global class Constructor {
    global Integer dayIncrement {
        get;
        set;
    }
    global Integer entriesPerPage {
        get;
        set;
    }
    global List<CloudConversion.eBayTypes.GetSellerList> gslList {
        get;
        set;
    }
    global Integer numBatches {
        get;
        set;
    }
    global Constructor() {

    }
}
}
