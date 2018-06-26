/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PrintController {
    global static Boolean print(ECS.PrintController.PrintAttributes pa) {
        return null;
    }
    @Future(callout=true)
    global static void printAsync(Map<String,String> parameters) {

    }
    @Future(callout=true)
    global static void printAsync(Map<String,String> parameters, Map<String,String> options) {

    }
global class PrintAttributes {
    global Blob content {
        get;
        set;
    }
    global Map<String,String> options {
        get;
        set;
    }
    global String pageName {
        get;
        set;
    }
    global Map<String,String> parameters {
        get;
        set;
    }
    global String printerId {
        get;
        set;
    }
    global Integer qty {
        get;
        set;
    }
    global String title {
        get;
        set;
    }
    global PrintAttributes() {

    }
}
}
