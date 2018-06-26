/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ProductImagesController {
    global String pid {
        get;
        set;
    }
    global ApexPages.StandardController product;
    global ProductImagesController() {

    }
    global ProductImagesController(ApexPages.StandardController cntrl) {

    }
    @RemoteAction
    global static List<ECS__Image__c> getImages(String productId) {
        return null;
    }
}
