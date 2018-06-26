/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AutoCompleteV2_Con {
    global Object cacheField {
        get;
    }
    global String labelFieldVar {
        get;
        set;
    }
    global Integer randomJsIden {
        get;
        set;
    }
    global String sObjVal {
        get;
        set;
    }
    global String valueFieldVar {
        get;
        set;
    }
    global AutoCompleteV2_Con() {

    }
    @RemoteAction
    global static List<Map<String,String>> getData2(String sObjVal, String labelFieldVar, String valueFieldVar, String whereClauseVar, String param) {
        return null;
    }
    @RemoteAction
    global static List<ECS.AutoCompleteV2_Con.AutoCompleteData> getData(String sObjVal, String labelFieldVar, String valueFieldVar, String param) {
        return null;
    }
global class AutoCompleteData {
    global String id;
    global String text;
    global AutoCompleteData(Object id, Object text) {

    }
}
}
