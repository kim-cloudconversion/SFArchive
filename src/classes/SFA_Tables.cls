public with sharing class SFA_Tables {
    public SFArchive SFA;
    public List<SFA_Table__c> ArchiveTables {get; set;}
    public String TablesVisible {get; set;}
    public String EditVisible {get; set;}
    public String DeleteVisible {get; set;}
    public String DeleteButtonVisible {get; set;}
    public String EditTitle {get; set;}
    public String EditMode {get; set;}
    public String TableFields;
    public String TablesSort;
    public Map<String, String> TablesMap;
    public String SelIDs {get; set;}
    public String SelCmd {get; set;}

   
    // add/edit/delete fields
    public String Edit_ID {get; set;}
    public String Edit_Name {get; set;}
    public String Edit_TableName {get; set;}
    public String Edit_Dependent {get; set;}
    public String Edit_Criteria {get; set;}
    public boolean Edit_Auto {get; set;}
    public String Edit_Disabled {get; set;}
    public String Delete_Message {get; set;}
    public String FieldToAdd {get; set;}
    public boolean Add_Dependents {get; set;}
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public SFA_Tables() {
        SFA = new SFArchive();
        TableFields = SFA.TableFields;
        ArchiveTables = SFA.GetArchivedTables();
        TablesMap = new Map<String, String>();
        TablesVisible = 'visible';
        EditVisible = 'hidden';
        Edit_Disabled = 'false';
        DeleteVisible = 'hidden';
        DeleteButtonVisible = 'hidden';
        Delete_Message = '';
        TablesSort = 'Label';
    }
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void AddTable() {
        EditMode = 'Add';
        EditTitle = 'Add a New Table to Archive';
        Edit_ID = '';
        Edit_Name = '';
        Edit_TableName = '';
        Edit_Dependent = '';
        Edit_Criteria = '';
        Edit_Auto = false;
        Add_Dependents = true;
        Edit_Disabled = 'false';
        EditVisible = 'visible';
        TablesVisible = 'hidden';
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void EditTable() {
        if (Edit_ID != null && Edit_ID != '') {
            SFA_Table__c Tbl = SFA.GetArchivedTableById(Edit_ID);
            //SFA_Table__c Tbl = [SELECT Id, Name, Table_Name__c, Records_Archived__c, Status__c, Selection_Criteria__c, Auto_Archive__c FROM SFA_Table__C WHERE Id = :Edit_ID];
            EditMode = 'Edit';
            Edit_Name = Tbl.Name;
            Edit_TableName = Tbl.Table_Name__c;
            Edit_Dependent = Tbl.Dependent_Objects__c;
            Edit_Criteria = Tbl.Selection_Criteria__c;
            Edit_Auto = Tbl.Auto_Archive__c;
            EditTitle = 'Edit Existing Archive Table';
            TablesVisible = 'hidden';
            EditVisible = 'visible';
            Edit_Disabled = 'true';
        } else error('No Edit_ID Specified !');
    }

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void DeleteTable() {
        if (Edit_ID != null && Edit_ID != '') {
            SFA_Table__c Tbl = SFA.GetArchivedTableById(Edit_ID);
            EditMode = 'Edit';
            Edit_Name = Tbl.Name;
            Edit_TableName = Tbl.Table_Name__c;
            Edit_Dependent = Tbl.Dependent_Objects__c;
            Edit_Criteria = Tbl.Selection_Criteria__c;
            Edit_Auto = Tbl.Auto_Archive__c;
            EditTitle = 'Edit Existing Archive Table';
            TablesVisible = 'hidden';
            EditVisible = 'hidden';
            DeleteVisible = 'visible';
            Edit_Disabled = 'true';
            if (Tbl.Records_Archived__c > 0) {
                Delete_Message = '<font size="+1"><b>You CANNOT Delete this Table because<br>there are ' + Tbl.Records_Archived__c + ' Records Already Archived !</b></font>';
                DeleteButtonVisible = 'hidden';
            } else {
                Delete_Message = '<font size="+1"><b>Are You SURE You want t DELETE THIS TABLE ?</b></font>';
                DeleteButtonVisible = 'visible';
            }
        } else error('No Edit_ID Specified !');
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void DeleteTable2() {
        SFA_Table__c Tbl = [SELECT Id, Name FROM SFA_Table__c WHERE id = :Edit_ID];
        delete tbl;
        ArchiveTables = SFA.GetArchivedTables();
        TablesVisible = 'visible';
        EditVisible = 'hidden';
        DeleteVisible = 'hidden';
        DeleteButtonVisible = 'hidden';
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void SaveTable() {
        // TODO: Validate Selection Criteria and Dependent Objects
        ArchiveTables = SFA.GetArchivedTables();
        if (SFA.ParseCriteria(Edit_TableName, Edit_Criteria) == 'invalid') {
            error('Invalid Selection Criteria:');
            for (String Mesg : SFA.Messages) error(Mesg);
        } else {
            if (EditMode == 'Add') {
                boolean Exists = false;
                debug(ArchiveTables.size() + ' existing archive tables loaded.');
                for (SFA_Table__c Tbl : ArchiveTables) if (Tbl.Table_Name__c == Edit_TableName) Exists = true;
                if (Exists) error('Table ' + Edit_TableName + ' is ALREADY SET to be archived !');
                else {
                    if (Edit_Name == '' || Edit_Name == null) { // if user didn't enter a friendly name, use the object's Label
                        for (String label : TablesMap.keySet()) if (TablesMap.get(label) == Edit_TableName) Edit_Name = TablesMap.get(label);
                    }
                    SFA_Table__c Tbl = new SFA_Table__c();
                    Tbl.Name = Edit_Name;
                    Tbl.Table_Name__c = Edit_TableName;
                    Tbl.Dependent_Objects__c = Edit_Dependent;
                    Tbl.Selection_Criteria__c = Edit_Criteria;
                    Tbl.Records_Archived__c = 0;
                    if (Edit_Auto == true) Tbl.Status__c = 'Waiting';
                    else Tbl.Status__c = 'Paused';
                    Tbl.Auto_Archive__c = Edit_Auto;
                    insert Tbl;
                    ArchiveTables.add(Tbl);
                    debug('New Archive Table "' + Edit_Name + '" Inserted Successfully.');
                }
            } else if (EditMode == 'Edit') {
                SFA_TAble__c Tbl = SFA.GetArchivedTableById(Edit_ID);
                Tbl.Name = Edit_Name;
                Tbl.Dependent_Objects__c = Edit_Dependent;
                Tbl.Selection_Criteria__c = Edit_Criteria;
                if (Tbl.Auto_Archive__c == true && Edit_Auto == false) Tbl.Status__c = 'Paused'; // Changed Auto-Archive to false
                if (Tbl.Auto_Archive__c == false && Edit_Auto == true) Tbl.Status__c = 'Waiting'; // Changed Auto-Archive to true
                Tbl.Auto_Archive__c = Edit_Auto;
                update Tbl;
                debug('Existing Archive Table Updated Successfully.');
            }
            String ParentTable = Edit_TableName;
            if (Add_Dependents) { // Automatically add all dependent tables
                AddDependentTables(ParentTable, Edit_Dependent);
                // replace below here with a function
                /*
                List<String> deps1 = Edit_Dependent.split('\\n');
                for (String Dep1 : Deps1) {
                    Dep1 = Dep1.trim();
                    SFA_Table__c ExistingTable = null;
                    boolean Exists = false;
                    for (SFA_Table__c T : ArchiveTables) {
                        if (T.Table_Name__c == Dep1) { 
                            ExistingTable = T; Exists = true; 
                        }
                        //debug(' -- Add_Dependents: (' + Dep1 + '): Existing Table "' + T.Table_Name__c  + '"');
                    }
                    if (Exists) { // the table already exists, add to criteria
                        //debug(Dep1 + ' already exists.');
                        
                        if (ExistingTable.Selection_Criteria__c != null && ExistingTable.Selection_Criteria__c != '') {
                            List<String> ChildFields = SFA.GetRefFields(Dep1, ParentTable); // get this table's fields that reference the parent table
                            Integer r = 0;
                            String ChildCriteria = '';
                            for (String Field : ChildFields) {
                                if (r > 0) ChildCriteria += ' OR ';
                                if (ChildFields.size() > 0) ChildCriteria += '(';
                                ChildCriteria += child_criteria(Field, Edit_Criteria);
                                if (ChildFields.size() > 0) ChildCriteria += ')';
                                r++;
                            }
                            ExistingTable.Selection_Criteria__c = '(' + ExistingTable.Selection_Criteria__c + ') AND (' + ChildCriteria + ')';
                            update ExistingTable;
                            debug('Archive Table "' + Dep1 + '" Already Existed, Added Selection Criteria and Updated.');
                        } else {
                            debug('Archive Table "' + Dep1 + '" Already Existed but ' + ParentTable + ' had no Selection Criteria.');
                        }
						
                        
                    } else { // the table does not exist, add it 
                        //debug(Dep1 + ' does not exist and needs to be added.');
                        
                        // Set the name to the table's label
                        for (String label : TablesMap.keySet()) if (TablesMap.get(label) == Dep1) Edit_Name = label;
                        Edit_TableName = Dep1; // set the TableName to this dependent table
                        GetDependents(); // get this table's dependents
                        String criteria = Edit_Criteria; // Modify the selection criteria to include a reference to the parent
                        List<String> ChildFields = SFA.GetRefFields(Dep1, ParentTable); // get this table's fields that reference the parent table
                        Integer r = 0;
                        String ChildCriteria = '';
                        if (Edit_Criteria != null && Edit_Criteria != '') {
                            for (String Field : ChildFields) {
                                if (r > 0) ChildCriteria += ' OR ';
                                if (ChildFields.size() > 0) ChildCriteria += '(';
                                ChildCriteria += child_criteria(Field, Edit_Criteria);
                                if (ChildFields.size() > 0) ChildCriteria += ')';
                                r++;
                            }
                        }
                        SFA_Table__c Tbl = new SFA_Table__c();
                        Tbl.Name = Dep1;
                        Tbl.Table_Name__c = Dep1;
                        Tbl.Dependent_Objects__c = Edit_Dependent;
                        Tbl.Selection_Criteria__c = ChildCriteria;
                        Tbl.Records_Archived__c = 0;
                        if (Edit_Auto == true) Tbl.Status__c = 'Waiting';
                        else Tbl.Status__c = 'Paused';
                        Tbl.Auto_Archive__c = Edit_Auto;
                        insert Tbl;
                        ArchiveTables.add(Tbl);
                        debug(' -- New Dependent Table "' + Dep1 + '" Inserted Successfully.');
                    }

                }
				*/
                // replace above here with a function
            }
            ArchiveTables = SFA.GetArchivedTables();
            TablesVisible = 'visible';
            EditVisible = 'hidden';
            DeleteVisible = 'hidden';
            debug(CountRecordsToArchive() + ' ' + Edit_TableName + ' Records would be archived based on this selection criteria.');
        }

    }

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void AddDependentTables(String ParentTable, String Dependents) {
        List<String> deps1 = Dependents.split('\\n');
        for (String Dep1 : Deps1) {
            Dep1 = Dep1.trim();
            SFA_Table__c ExistingTable = null;
            boolean Exists = false;
            for (SFA_Table__c T : ArchiveTables) {
                if (T.Table_Name__c == Dep1) { 
                    ExistingTable = T; Exists = true; 
                }
                //debug(' -- Add_Dependents: (' + Dep1 + '): Existing Table "' + T.Table_Name__c  + '"');
            }
            if (Exists) { // the table already exists, add to criteria
                //debug(Dep1 + ' already exists.');
                
                if (ExistingTable.Selection_Criteria__c != null && ExistingTable.Selection_Criteria__c != '') {
                    List<String> ChildFields = SFA.GetRefFields(Dep1, ParentTable); // get this table's fields that reference the parent table
                    Integer r = 0;
                    String ChildCriteria = '';
                    for (String Field : ChildFields) {
                        if (r > 0) ChildCriteria += ' OR ';
                        if (ChildFields.size() > 0) ChildCriteria += '(';
                        ChildCriteria += child_criteria(Field, Edit_Criteria);
                        if (ChildFields.size() > 0) ChildCriteria += ')';
                        r++;
                    }
                    ExistingTable.Selection_Criteria__c = '(' + ExistingTable.Selection_Criteria__c + ') AND (' + ChildCriteria + ')';
                    update ExistingTable;
                    debug('Archive Table "' + Dep1 + '" Already Existed, Added Selection Criteria and Updated.');
                } else {
                    debug('Archive Table "' + Dep1 + '" Already Existed but ' + ParentTable + ' had no Selection Criteria.');
                }
                
                
            } else { // the table does not exist, add it 
                //debug(Dep1 + ' does not exist and needs to be added.');
                
                // Set the name to the table's label
                for (String label : TablesMap.keySet()) if (TablesMap.get(label) == Dep1) Edit_Name = label;
                Edit_TableName = Dep1; // set the TableName to this dependent table
                GetDependents(); // get this table's dependents (into Edit_Criteria)
                String criteria = Edit_Criteria; // Modify the selection criteria to include a reference to the parent
                List<String> ChildFields = SFA.GetRefFields(Dep1, ParentTable); // get this table's fields that reference the parent table
                Integer r = 0;
                String ChildCriteria = '';
                if (Edit_Criteria != null && Edit_Criteria != '') {
                    for (String Field : ChildFields) {
                        if (r > 0) ChildCriteria += ' OR ';
                        if (ChildFields.size() > 0) ChildCriteria += '(';
                        ChildCriteria += child_criteria(Field, Edit_Criteria);
                        if (ChildFields.size() > 0) ChildCriteria += ')';
                        r++;
                    }
                }
                SFA_Table__c Tbl = new SFA_Table__c();
                Tbl.Name = Dep1;
                Tbl.Table_Name__c = Dep1;
                Tbl.Dependent_Objects__c = Edit_Dependent;
                Tbl.Selection_Criteria__c = ChildCriteria;
                Tbl.Records_Archived__c = 0;
                if (Edit_Auto == true) Tbl.Status__c = 'Waiting';
                else Tbl.Status__c = 'Paused';
                Tbl.Auto_Archive__c = Edit_Auto;
                insert Tbl;
                ArchiveTables.add(Tbl);
                debug(' -- New Dependent Table "' + Dep1 + '" Inserted Successfully.');
                if (Edit_Dependent != '') AddDependentTables(Dep1, Edit_Dependent);
            }
            
        }

    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public String child_criteria(String FieldName, String ParentCriteria) {
        String ChildCriteria = '';
        Integer i = 0;
        Integer j = 0;
        Integer len = ParentCriteria.length();
        //system.debug('child_criteria(): ParentCriteria="' + ParentCriteria + '" (' + len + '), Fieldname="' + FieldName + '"');
        while (i < len && i > -1) {
            //system.debug('top of while: i=' + i);
            String ch = ParentCriteria.substring(i,i+1);
            if (ch == ' ' || ch == '(' || ch == ')') {
                ChildCriteria += ch;
                i++;
            } else if ((i+4) <= len && ParentCriteria.substring(i,i+4).toLowerCase() == 'and ') { 
                ChildCriteria += ParentCriteria.substring(i,i+4);
                i += 4;
            } else if ((i+3) <= len && ParentCriteria.substring(i,i+3).toLowerCase() == 'or ') { 
                ChildCriteria += ParentCriteria.substring(i,i+3);
                i += 3;
            } else {
                j = ParentCriteria.indexOf(' ',i); // skip past field name
                
                //system.debug('before getting field name: i=' + i + ', j=' + j);
                //system.debug('processing field "' + ParentCriteria.substring(i,j) + '"');
                while (ParentCriteria.substring(j,j+1) == ' ') j++; // skip any spaces after field name
                j++;
                j = ParentCriteria.indexOf(' ',j); // skip past operator ('=','<','>','LIKE', etc...)
                //system.debug('after operator "' + ParentCriteria.substring(i,j) + '"');
                while (ParentCriteria.substring(j,j+1) == ' ') j++; // skip any spaces after operator
                if (ParentCriteria.substring(j,j+1) == '\'') { // the value is enclosed in single quotes
                    j++;
                    while (ParentCriteria.substring(j,j+1) != '\'') j++; // skip until closing quote
                    j++; //skip the closing quote
                    //system.debug('value is enclosed in quotes (j=' + j + ')');
                } else if (ParentCriteria.substring(j,j+1) == '{') { // the value is enclosed in curly braces
                    j++;
                    while (ParentCriteria.substring(j,j+1) != '}') j++; // skip until closing curly brace
                    j++; //skip the closing curly brace
                    //system.debug('value is enclosed in curly braces (j=' + j + ')');
                } else { // the value is not enclosed in quotes
                    while (j < len && ParentCriteria.substring(j,j+1) != ' ' && ParentCriteria.substring(j,j+1) != ')') j++;
                    //system.debug('value is enclosed in quotes (j=' + j + ')');
                }
                ChildCriteria += FieldName.replace('__c','__r') + '.' + ParentCriteria.substring(i,j);
                //system.debug('ChildCriteria="' + ChildCriteria + '"');
                i = j;
            }
        }
        return ChildCriteria;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void ArchiveTable() {
        //debug('Archive-Now Function is not enabled yet !');
        if (Edit_ID != null && Edit_ID != '') {
            String Query = 'SELECT ' + TableFields + ' FROM SFA_Table__c WHERE id = \'' + Edit_ID + '\'';
            SFA_Table__c Table = database.query(Query);
            Integer c = SFA.ArchiveTable(Table);
            debug(c + ' ' + Table.Table_Name__c + ' Records Archived.');
        }
        
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void CountRecords() {
        if (Edit_ID != null && Edit_ID != '') {
            //SFA_Table__c Tbl = [SELECT Id, Name, Table_Name__c, Records_Archived__c, Status__c, Dependent_Objects__c, Selection_Criteria__c, Auto_Archive__c FROM SFA_Table__C WHERE Id = :Edit_ID];
            SFA_Table__c Tbl = SFA.GetArchivedTableById(Edit_ID);

            Tbl.Records_Archived__c = SFA.count_Archived_Records(Tbl.Table_Name__c);
            update Tbl;
            String Query = 'SELECT ' + TableFields + ' FROM SFA_Table__c ORDER BY Name';
            ArchiveTables = database.query(Query);
        } else error('No Edit_ID Specified !');
    }

     // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void Cancel() {
        EditMode = '';
        EditVisible = 'hidden';
        DeleteVisible = 'hidden';
        TablesVisible = 'visible';
    }

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void Toggle_TablesSort() {
        if (TablesSort == 'Label') TablesSort = 'Name';
        else TablesSort = 'Label';
        getTables(); 
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public void GetDependents() {
        system.debug('GetDependents() called: Edit_TableName=' + Edit_TableName);
        Edit_Dependent = '';
        if (Edit_TableName != null && Edit_TableName != '') {
            List<String> Deps = GetDependentTables(Edit_TableName);
            for (String Dep : Deps) {
                if (Edit_Dependent != '') Edit_Dependent += '\n';
                Edit_Dependent += Dep;
                //system.debug(Edit_TableName + ' has dependency ' + Dep);
            }
        } else system.debug('GetDependents(): No TableName Specified.');
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public List<String> GetDependentTables(String TableName) {
        List<String> Deps = new List<String>();
        system.debug('GetDependentTables() called: TableName=' + TableName);
        if (TableName != null && TableName != '') {
            Deps = SFA.GetChildRelationships(TableName);
        } else system.debug('GetDependentTables(): No TableName Specified.');
        return Deps;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // Populates the 'Tables' drop-down in the add new table dialogue
    public List<SelectOption> getTables() {
        List<SelectOption> Tables = new List<SelectOption>();
        
        TablesMap.clear();
        List<String> Labels = new List<String>();
        Map<String, String> TypesMap = new Map<String, String>();
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
           String type = objTyp.getDescribe().isCustom() ? 'Custom' : 'Standard';
           String name = objTyp.getDescribe().getName();
           String label = objTyp.getDescribe().getLabel();
           if (TablesSort == 'Name') label = name;
           // Exclude all the unwanted Sobjects e.g. History, Share etc..
        
         if(!name.containsignorecase('history') && !name.containsignorecase('tag')&& !name.containsignorecase('share') && !name.containsignorecase('feed')){      
              //System.debug( 'Name: ' + name + ', Label: ' + label);
              TablesMap.put(label, name);
              TypesMap.put(name, type);
              Labels.add(label);
          }
        
        }        
        Labels.sort();
        for (String label : Labels) {
            String name = TablesMap.get(label);
            String type = TypesMap.get(name);
            Tables.add(New SelectOption(name, label + ' (' + type + ')'));
        }
        //Tables.sort();
        return Tables;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public List<SelectOption> getTableFields() {
        List<SelectOption> TableFields = new List<SelectOption>();
        if (Edit_TableName != '' && Edit_TableName != null) {
            try {
                //SFArchive SFA = new SFArchive();
                List<Map<String, String>> Fields = SFA.GetFields(Edit_TableName);
                for (Map<String, String> Fld : Fields) TableFields.add(New SelectOption(Fld.get('Name'), Fld.get('Name')));        
            } catch (Exception ex) {  }
        }
        return TableFields;
    }
   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   public void AddFieldToCriteria() {
       if (FieldToAdd != '' && FieldToAdd != null) {
           Edit_Criteria += FieldToAdd; 
           //SFArchive SFA = new SFArchive();
           List<Map<String, String>> Fields = SFA.GetFields(Edit_TableName);
           for (Map<String, String> Fld : Fields) {
               if (Fld.get('Name') == FieldToAdd) {
                   if (Fld.get('Type') == 'DateTime' || Fld.get('Type') == 'Date') Edit_Criteria += ' < {90 days}';
               } 
           }
       }
   }
   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   public void TestCriteria() {
       debug(CountRecordsToArchive() + ' ' + Edit_TableName + ' Records would be archived based on this selection criteria.');
   }
   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   public integer CountRecordsToArchive() {
       integer count = 0;
       boolean ok = true;
       String Query = 'SELECT COUNT() FROM ' + EDIT_TableName;
       if (Edit_Criteria != '' && Edit_Criteria != null) {
           String wh = SFA.ParseCriteria(Edit_TableName, Edit_Criteria);
           if (wh != 'invalid') {
               Query += ' WHERE ' + wh;
               debug('Selection Criteria Validated.');
           }else {
               error ('Invalid Selection Criteria:');
               for (String Mesg : SFA.Messages) error(mesg); 
               ok = false;
           }
       }
       //debug('Query: ' + Query);
       if (ok) {
           try {
               count = database.countQuery(Query);
           } catch (Exception ex) { 
               error('Count Query Failed: ' + ex.getMessage() + ', Query: ' + Query);
           }
       }
           
       return count;
   }
   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   public void DoCommand() { // process the menu options command from javascript
       Edit_ID = SelIDs;
       if (SelCmd == 'Archive') ArchiveTable();
       if (SelCmd == 'Edit') EditTable();
       if (SelCmd == 'Delete') DeleteTable();
       if (SelCmd == 'Count') CountRecords();
       
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