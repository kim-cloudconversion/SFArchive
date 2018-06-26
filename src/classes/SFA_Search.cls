global class SFA_Search {
    global List<SFA_Table__c> Tables {get; set;}
    global String TableName {get; set;}
    global String FieldsToShow {get; set;}
    global String SearchString {get; set;}
    global String QueryLimit {get; set;}
    global String QueryOffset {get; set;}
    global String FieldToAdd {get; set;}
    global String Content {get; set;}
    global String SelIDs {get; set;}
    global String SelCmd {get; set;}
    global List<Map<String, String>> Records {get; set;}
    global String PrevTableName;
    SFArchive SFA;
    global boolean DoDebug {get; set;}
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global SFA_Search() {
        SFA = new SFArchive();
        Tables = [SELECT Id, Name, Table_Name__c, Default_View_Fields__c FROM SFA_Table__c WHERE Records_Archived__c > 0];
        TableName = '';
        FieldsToShow = '';
        SearchString = '';
        QueryLimit = '';
        QueryOffset = '';
        Content = '';
        PrevTableName = '';
        if (DoDebug == null) DoDebug = false;
        Records = new List<Map<String, String>>();
        String paramTable = ApexPages.currentPage().getParameters().get('table');
        if (paramTable != null) {
            TableName = paramTable;
            GetFields();
        }
    }  
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    global List<Map<String, String>> GetRecords() {
        if (TableName != '' && SearchString != '') {
            // debug('Tablename = ' + TableName + ', SearchString = ' + SearchString);
            
            // get a list of the fields to show because we may include 'Id' or other unwanted fields from the archived database
            List<String> FldNames = new List<String>();
            if (FieldsToShow == null || FieldsToShow == '' || FieldsToShow == '*') {
                List<Map<String, String>> Fields = SFA.GetFields(TableName);
                for (Map<String, String> Fld : Fields) FldNames.add(Fld.get('Name'));        
            } else FldNames = FieldsToShow.replace(', ',',').split(',');
            
            SFA_Table__c Table;
            for (SFA_Table__c t : Tables) {
                if (t.Table_Name__c == TableName) {
                    Table = t;
                    // debug('Table ' + Table.Name + ' Found.');
                    SFA.Messages.clear();
                    SFA.DoDebug = DoDebug;
                    Records = SFA.Search_Archived_Records(Table, FieldsToShow, SearchString, QueryOffset, QueryLimit);
                    debug(Records.size() + ' Records Loaded.');
                    for (String Mesg : SFA.Messages) debug(Mesg);
                }
            }
            if (Table != null) {
                Integer r = 0;
                Content = '<div class="bPageBlock brandSecondaryBrd secondaryPalette">\n';
                Content += '<div class="pbHeader"><div class="pbTitle"><h3>Archived ' + TableName + ' Records</h3></div>\n';
                Content += '<table cellpadding="3" cellspacing="0" border="1">\n';
                for (Map<String, String> Recd : Records) {
                    if (r == 0) {
                        Content += '<tr><td>&nbsp;</td>';
                        for (String Key : Recd.keySet()) if (chkName(Key, FldNames)) Content += '<td><b>' + Key + '</b></td>';
                        Content += '</tr>\n';
                    }
                    Content += '<tr bgcolor="#ffffff">';
                    Content += '<td><input type="checkbox" id="chk_' + r + '" value="' + Recd.get('Id') + '"/></td>';
                    for (String Key : Recd.keySet()) if (chkName(Key, FldNames)) Content += '<td>' + Recd.get(Key) + '</td>';
                    Content += '</tr>\n';
                    r++;
                }
                Content += '</table><input type="hidden" name="line_count" id="line_count" value="' + r + '>\n</div></div>';
                Content += '<div id="btnDiv" name="btnDiv">\n';
                Content += '<input type="button" class="btn" value="Un-Archive Selected" onClick="unarchive_multi()"/>\n';
                Content += '<input type="button" class="btn" value="Delete Selected" onClick="delete_multi()"/>\n';
                Content += '</div>\n';

            } else Records.clear();
        }

        return Records;
    }
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<SelectOption> GetTableOpts() {
        List<SelectOption> TableOpts = new List<SelectOption>();
        TableOpts.add(new SelectOption('','(Select)'));
        for (SFA_Table__c Table : Tables) TableOpts.add(New SelectOption(Table.Table_Name__c, Table.Name));
        return TableOpts;
    }

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void GetFields() {
        if (TableName != PrevTableName) {
            Content = '';
            FieldsToShow = '';
            for (SFA_Table__c Table : Tables) {
                if (Table.Table_Name__c == TableName) FieldsToShow = Table.Default_View_Fields__c;
            }
            PrevTableName = TableName;
        }
        GetFieldOpts();
        GetRecords();
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<SelectOption> GetFieldOpts() {
        List<SelectOption> TableFields = new List<SelectOption>();
        if (TableName != '' && TableName != null) {
            try {
                //SFArchive SFA = new SFArchive();
                TableFields.add(new SelectOption('','(Select)'));
                List<Map<String, String>> Fields = SFA.GetFields(TableName);
                for (Map<String, String> Fld : Fields) TableFields.add(New SelectOption(Fld.get('Name'), Fld.get('Name')));        
            } catch (Exception ex) {  }
        }
        return TableFields;
    }

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global void AddField() { // Add a field from the select to the FieldsToShow string
        if (FieldToAdd != null && FieldToAdd != '') {
            if (FieldsToShow.indexOf(FieldToAdd) == -1) {
                if (FieldsToShow != '' && FieldsToShow != null) FieldsToShow += ', ';
                FieldsToShow += FieldToAdd;
            }
        }
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global void SaveFields() { // Save the current FieldsToShow String to the Table's Default_View_Fields
        for (SFA_Table__c Table : Tables) {
            if (Table.Table_Name__c == TableName) {
                Table.Default_View_Fields__c = FieldsToShow;
                update Table;
            }
        }
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


    global void Search() {
        GetRecords();
    }

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public pageReference DoSelected() {
        List<String> IDs = SelIDs.split(',');
        if (SelCmd == 'Unarchive') {
            debug('Un-Archiving ' + IDs.size() + ' Records ...');
            SFA.UnArchiveRecords(TableName, IDs);
        }
        if (SelCmd == 'Delete') {
            debug('Deleting ' + IDs.size() + ' Records ...');
        }
       return null;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public boolean chkName(String Name, List<String> Names) {
        for (String N : Names) if (N == Name) return true;
        return false;
    }
   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   // displays an 'info' message in the pageBlockMessages
    public void debug(string message){
        system.debug(message);
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, message));
    }
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // displays an 'error' message in the pageBlockMessages
    public void error(string message){
        system.debug(message);
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, message));
    }
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}