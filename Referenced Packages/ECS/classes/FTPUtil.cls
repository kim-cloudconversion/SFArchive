/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FTPUtil {
    global FTPUtil() {

    }
    global static ECS.FTPUtil.FTPInfo deleteFile(ECS.FTPUtil.FTPInfo ftp) {
        return null;
    }
    global static ECS.FTPUtil.FTPInfo get(ECS.FTPUtil.FTPInfo ftp) {
        return null;
    }
    global static ECS.FTPUtil.FTPInfo getFTPInfo(Id ftpSettingId) {
        return null;
    }
    global static ECS.FTPUtil.FTPInfo getFTPInfo(ECS__FTP_Setting__c setting) {
        return null;
    }
    global static ECS.FTPUtil.FTPInfo listContents(ECS.FTPUtil.FTPInfo ftp) {
        return null;
    }
    global static ECS.FTPUtil.FTPInfo moveFile(ECS.FTPUtil.FTPInfo ftp) {
        return null;
    }
    global static List<ECS__FTP_File__c> parseFiles(ECS__FTP_Setting__c ftpSetting, String responseStr) {
        return null;
    }
    global static ECS.FTPUtil.FTPInfo put(ECS.FTPUtil.FTPInfo ftp) {
        return null;
    }
    global static ECS.FTPUtil.FTPInfo validate(ECS.FTPUtil.FTPInfo ftp) {
        return null;
    }
global class FTPInfo {
    global Blob content {
        get;
        set;
    }
    global String error {
        get;
        set;
    }
    global String exceptionStr {
        get;
        set;
    }
    global String filename {
        get;
        set;
    }
    global String host {
        get;
        set;
    }
    global Boolean ignoreFirstLine {
        get;
        set;
    }
    global String newPath {
        get;
        set;
    }
    global Boolean passive {
        get;
        set;
    }
    global String path {
        get;
        set;
    }
    global Integer port {
        get;
        set;
    }
    global String pwd {
        get;
        set;
    }
    global String responseStr {
        get;
        set;
    }
    global Boolean result {
        get;
        set;
    }
    global Boolean sftp {
        get;
        set;
    }
    global String supplierId {
        get;
        set;
    }
    global String username {
        get;
        set;
    }
    global FTPInfo() {

    }
}
}
