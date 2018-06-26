/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SalesforceApiUtil {
    global SalesforceApiUtil() {

    }
    global static ECS.SalesforceApiUtil.CheckDeployStatusResponse checkDeployStatus(ECS.SalesforceApiUtil.CheckDeployStatusRequest request) {
        return null;
    }
    global static ECS.SalesforceApiUtil.CreateCustomFieldResponse createCustomField(List<ECS.SalesforceApiUtil.CreateCustomFieldRequest> customFields) {
        return null;
    }
    global static ECS.SalesforceApiUtil.CreateResponse createEmailServicesAddress(ECS.SalesforceApiUtil.CreateEmailServicesAddressRequest request) {
        return null;
    }
    global static ECS.SalesforceApiUtil.CreateResponse createEmailServicesFunction(ECS.SalesforceApiUtil.CreateEmailServicesFunctionRequest request) {
        return null;
    }
    global static ECS.SalesforceApiUtil.CreateRemoteSiteSettingResponse createRemoteSiteSetting(ECS.SalesforceApiUtil.CreateRemoteSiteSettingRequest request) {
        return null;
    }
global class CheckDeployStatusRequest {
    global String asyncProcessId {
        get;
        set;
    }
    global CheckDeployStatusRequest() {

    }
}
global class CheckDeployStatusResponse {
    global Boolean result {
        get;
        set;
    }
    global CheckDeployStatusResponse() {

    }
}
global class CreateCustomFieldRequest {
    global String defaultValue {
        get;
        set;
    }
    global String description {
        get;
        set;
    }
    global String fieldLabel {
        get;
        set;
    }
    global String fieldName {
        get;
        set;
    }
    global Integer fieldSize {
        get;
        set;
    }
    global String fieldType {
        get;
        set;
    }
    global String helpText {
        get;
        set;
    }
    global String objectName {
        get;
        set;
    }
    global List<String> pickListVals {
        get;
        set;
    }
    global Integer precision {
        get;
        set;
    }
    global Boolean required {
        get;
        set;
    }
    global Integer scale {
        get;
        set;
    }
    global String sessionId {
        get;
        set;
    }
    global CreateCustomFieldRequest() {

    }
}
global class CreateCustomFieldResponse {
    global List<String> resultStrList {
        get;
        set;
    }
    global CreateCustomFieldResponse() {

    }
}
global class CreateEmailServicesAddressRequest {
    global String emailServicesFunctionId {
        get;
        set;
    }
    global String localPart {
        get;
        set;
    }
    global CreateEmailServicesAddressRequest() {

    }
}
global class CreateEmailServicesFunctionRequest {
    global String emailServiceClassName {
        get;
        set;
    }
    global String functionName {
        get;
        set;
    }
    global CreateEmailServicesFunctionRequest() {

    }
}
global class CreateRemoteSiteSettingRequest {
    global String description {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global String url {
        get;
        set;
    }
    global CreateRemoteSiteSettingRequest() {

    }
}
global class CreateRemoteSiteSettingResponse {
    global String asyncId {
        get;
        set;
    }
    global String response {
        get;
        set;
    }
    global CreateRemoteSiteSettingResponse() {

    }
}
global class CreateResponse {
    global String emailAddress {
        get;
        set;
    }
    global String id {
        get;
        set;
    }
    global String response {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global CreateResponse() {

    }
}
}
