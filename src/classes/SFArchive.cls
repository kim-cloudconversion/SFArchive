global class SFArchive {
	global String BaseURL = 'http://www.BocaHouseHunters.com/sfarchive/sql.php';
    global String User;
    global String Pass;
    global String Token;
    global boolean AutoArchive;
    global List<String> Messages;
    global List<Map<String, String>> SFFields;
    global String TableFields = 'Id, Name, Table_Name__c, Last_Archived__c, Records_Archived__c, Status__c, Dependent_Objects__c, Selection_Criteria__c, Auto_Archive__c, Temp__c';
    global Integer TestLevel;
    global boolean DoDebug;

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // Class Constructor
    global SFArchive() {
        DoDebug = false;
        TestLevel = 0;
        BaseURL = 'http://www.ictechnologyllc.com/sfarchive/sql.php';
        User = 'kim';
        Pass = 'kimonly';
        Token = 'GqcR5CyKzvK8OzyX0unLoS6HV';
        AutoArchive = false;
        GetSettings(); // Loads variables above from settings
		Messages = new List<String>();
        SFFields = new List<Map<String, String>>();
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global String TestConnection() {
        String Query = 'hello';
        String Result = SendRequest(Query);
        return Result;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global integer ArchiveTable(SFA_Table__c Table) {
        integer count = 0;
		boolean exists = false;

		if (Table.Records_Archived__c > 0) exists = true;
        else if (SendRequest('exists ' + Table.Table_Name__c) == 'true') exists = true;

        if (exists) system.debug('SFArchive::ArchiveTable(): Table = ' + Table.Table_Name__c + ' Already Exists in the Archive');
		else system.debug('SFArchive::ArchiveTable(): Table = ' + Table.Table_Name__c + ' DOES NOT already exist in the archive');

        if (!exists) AddTable(Table.Table_Name__c);
        List<SObject> Records = GetRecords(Table);
		system.debug('SFArchive::ArchiveTable(): ' + Records.size() + ' Records loaded based on selection criteria');
        List<String> CopiedIDs = ArchiveRecords(Table.Table_Name__c, Records);
        count = CopiedIDs.size();
        // we can do a count query here and get a more accurate result
        Table.Records_Archived__c += count;
        // now delete the archived records
        if (CopiedIDs.size() > 0) {
            String Query2 = '';
            for (String Id : CopiedIDs) {
                if (Query2 == '') Query2 = 'SELECT Id FROM ' + Table.Table_Name__c + ' WHERE Id = \'' + Id + '\'';
                else Query2 += ' OR Id = \''+ Id + '\'';
            }
            Records = database.query(Query2);
			//delete Records;
    	}
        update Table;
        return count;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global String AddTable(String Tablename) {
        String Response = '';
        Map<String, String> Refs = new Map<String, String>();
        if (SFFields.size() == 0) SFFields = GetFields(Tablename);
        String Query = '';
        for (Map<String, String> fld : SFFields) {
            if (fld.get('Ref') != null) {
                String Ref = fld.get('Ref');
                Refs.put(Ref.substring(0, Ref.indexOf('.')), Ref.substring(Ref.indexOf('.')+1));
            }
        }
        if (Refs.size() > 0) {
            system.debug(Tablename + ' has ' + Refs.size() + ' References to other objects:');
            for (String Key : refs.keySet()) System.debug(' -- ' + Key + ' : ' + Refs.get(Key));
        }
        Query = '';
        for (Map<String, String> fld : SFFields) {
            String Name = fld.get('Name');
            String Type = fld.get('Type');
            String Len = fld.get('Length');
            String Prec = fld.get('Precision');
            system.debug(Tablename + ' Field: Name=' + Name + ', Type=' + Type + ',Len=' + Len + ',Prec=' + Prec);
            if (Integer.valueOf(Len) > 0 || Prec != null || Type == 'Boolean' || Type == 'Date' || Type == 'DateTime') {
                if (Query == '') Query = 'CREATE TABLE ' + Tablename + ' (';
                else Query += ', ';
                Query += Name;
                if (Type == 'String') Query += ' VARCHAR(' + Len + ')';
                if (Type == 'Decimal') Query += ' DECIMAL(' + fld.get('Precision') + ')';
                if (Type == 'Integer') Query += ' INT(' + fld.get('Precision') + ')';
                if (Type == 'Date') Query += ' DATE';
                if (Type == 'DateTime') Query += ' DATETIME';
                if (Type == 'Boolean') Query += ' BOOL';
            }
        }
        Query += ', SFArchive_Date DATETIME)';
        system.debug('Create Table Query: ' + Query);
        Response = SendRequest(Query);

        return Response;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<SObject> GetRecords(SFA_Table__c Table) {
        List<SObject> Records = new List<SObject>();
        if (SFFields.size() == 0) SFFields = GetFields(Table.Table_Name__c);
        String Query = '';
        for (Map<String, String> Fld : SFFields) {
            if (Query == '') Query = 'SELECT ' + Fld.get('Name');
            else Query += ', ' + Fld.get('Name');
        }
        Query += ' FROM ' + Table.Table_Name__c;
        String wh = ParseCriteria(Table.Table_Name__c, Table.Selection_Criteria__c);
        if (wh != '' && wh != 'invalid') {
            Query += ' WHERE ' + wh;
            Records = database.query(Query);
        }
        return records;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<String> ArchiveRecords(String Tablename, List<sObject> records) {
        Integer Copied = 0;
        String Query = '';
        String IDstr = '';
        String now = DateTime.now().format('yyyy-MM-dd HH:mm:ss');
        List<String> IDs = new List<String>();
        List<String> ResponseString = new List<String>();
		system.debug('ArchiveRecords(): ' + records.size() + ' Records to copy');
        if (SFFields.size() == 0) SFFields = GetFields(Tablename);
        for (sObject Recd : Records) {
            String Query2 = Query;
            String Flds = '';
            String Vals = '';
            String Str = '';
            for (Map<String, String> fld: SFFields) {
                String Name = fld.get('Name');
                String Type = fld.get('Type');
                if (Query2 == '' && Query == '') {
                	if (Flds == '') Flds = 'INSERT INTO ' + Tablename + ' (';
                    else Flds += ', ';
                    Flds += Name;
                } 
                if (Vals == '') Vals = '(';
                else Vals += ', ';
                if (Recd.get(Name) == null) VALS += 'NULL';
                else if (Type == 'Integer' || Type == 'Decimal') Vals += Recd.get(Name);
                else  Vals += '\'' + Recd.get(Name) + '\'';
                if (IDstr != '') IDstr += ',';
                IDstr += Recd.get('Id');
                IDs.add(String.valueOf(Recd.get('Id')));
            }
            // add our SFArchive-Specific fields to the end of the query
            Flds += ', SFArchive_Date';
            Vals += ', \'' + now + '\'';
            
            if (Query2 == '' && Query == '')  Query = Flds += ') VALUES ' + Vals + ')';
            else Query += ', ' + Vals + ')';   
        }
        String Result1 = SendRequest(Query);
        system.debug('Query: ' + Query);
        system.debug('Result: ' + Result1);
		String Query3 = 'validate ' + Tablename + ' ' + IDstr;
        String Result2 = SendRequest(Query3);
        system.debug('Query3: ' + Query3);
        system.debug('Result2: ' + Result2);
        List<String> IDs2 = Result2.split(',');
        List<sObject> DelRecds = new List<sObject>();
        for (String ID1 : IDs) {
            Boolean Found = false;
            for (String ID2 : IDs2) {
                if (ID2 == ID1) Found = true;
            }
            if (Found) { 
                System.debug('Record ID ' + ID1 + ' Validated'); 
                Copied++; 
                for (sObject Recd : Records) {
                    if (Recd.get('Id') == ID1) DelRecds.add(Recd); 
                }
            }
            //else System.debug('Record ID ' + ID1 + ' Failed');
        }
        if (DelRecds.size() > 0 && TestLevel == 0) delete DelRecds;
        return IDs2;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    global List<String> UnArchiveRecords(String TableName, List<String> IDs) {
        List<String> UnArchiveResults = new List<String>();
        List<SObject> NewRecords = new List<SObject>();
        String Query1 = '';
        for (String Id : IDs) {
            if (Query1 == '') Query1 = 'SELECT * FROM ' + TableName + ' WHERE Id = \'' + Id + '\'';
            else Query1 += ' OR Id = \'' + Id + '\'';
        }  
        List<Map<String, String>> Records = CSV2List(SendRequest(Query1));
        String Query2 = '';
        if (SFFields.size() == 0) SFFields = GetFields(Tablename);
        
        for (Map<String, String> fld: SFFields) {
            if (Query2 == '') Query2 = 'SELECT ';
            else Query2 += ', ';
            Query2 += fld.get('Name');
        }
        Query2 += ' FROM ' + TableName + ' LIMIT 1';
        SObject ExistingRecord = database.query(Query2);
        for (Map<String, String> Recd : Records) {
            SObject NewSFRecd = ExistingRecord.clone(false, false, false, false);
            for (Map<String, String> fld: SFFields) {
                if (fld.get('isUpdateable') == 'true') {
                    String Name = fld.get('Name');
                    String Type = fld.get('Type');
                    String Value = Recd.get(Name);
                    if (Type == 'Integer' && Value != '') NewSFRecd.put(Name, Integer.valueOf(Value));
                    else if (Type == 'Integer') NewSFRecd.put(Name,null);
                    else if (Type == 'Decimal' && Value != '') NewSFRecd.put(Name, Decimal.valueOf(Value));
                    else if (Type == 'Decimal') NewSFRecd.put(Name,null);
                    else if (Type == 'Date' && Value != '') NewSFRecd.put(Name, Date.valueOf(Value));
                    else if (Type == 'Date') NewSFRecd.put(Name,null);
                    else if (Type == 'DateTime' && Value != '') NewSFRecd.put(Name, DateTime.valueOf(Value));
                    else if (Type == 'DateTime') NewSFRecd.put(Name,null);
                    else if (Type == 'Boolean') NewSFRecd.put(Name, Boolean.valueOf(Value));
                    else NewSFRecd.put(Name, Value); // String types

                }
            }
            NewRecords.add(NewSFRecd);
        }
		if (TestLevel == 0) insert NewRecords;
        
        return UnArchiveResults;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    global integer count_Archived_Records(String Tablename) {
        String Query = 'SELECT COUNT(*) FROM ' + Tablename + ' WHERE 1';
        String Response = SendRequest(Query);
        List<Map<String, String>> Data = CSV2List(Response);
        //system.debug(Response);
        if (Data.size() > 0) return integer.valueOf(Data[0].get('COUNT(*)'));
        return 0;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<Map<String, String>> Search_Archived_Records(SFA_Table__c Table, String ShowFields, String SearchString, String Off, String Lim) {
        if (ShowFields == null || ShowFields == '') ShowFields = '*';
        if (ShowFields != '*') { // if user specified fields to show, add 'Id' if it's not already there
            List<String> FldNames = ShowFields.replace(', ',',').split(',');
            boolean HasID = false;
            for (String FldName : FldNames) if (FldName == 'Id') HasID = true;
            if (!HasID) ShowFields += ', Id';
        }
        String Query = 'SEARCH ' + ShowFields + ' FROM ' + Table.Table_Name__c;
        //String Query = 'SELECT ' + ShowFields + ' FROM ' + Table.Table_Name__c;
        if (Lim != '' && Lim != null) {
            Query += ' LIMIT ' + Lim;
            if (Off != '' && Off != null) Query += ' OFFSET ' + Off;
        }
        if (SearchString != 'All') Query += ' WHERE ' + SearchString;
        if (DoDebug) Messages.add('Query: ' + Query);
        String Response = SendRequest(Query);
        if (DoDebug) Messages.add('Response: ' + Response);
        List<Map<String, String>> Data = CSV2List(Response);
		//Messages.add('CSV2List returned ' + Data.size() + ' rows of Data.');
        return Data;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


	global String SendRequest(String QueryString) {
		System.debug('SendRequest(): QueryString: ' + QueryString);
		String ResponseText = '';
		HttpRequest req = new HttpRequest();
		Http m_http = new Http();
		HttpResponse resp = new HttpResponse();
		req.setEndpoint(BaseURL);
		req.setBody('user='+EncodingUtil.urlEncode(User, 'UTF-8') + '&pass='+EncodingUtil.urlEncode(Pass, 'UTF-8') + '&token='+EncodingUtil.urlEncode(Token, 'UTF-8') +'&query='+EncodingUtil.urlEncode(QueryString, 'UTF-8'));  
		if (DoDebug) Messages.add('Request: ' + req.getBody());
        req.setMethod('POST');
		req.setTimeout(30000);
		//req.setHeader('Content-Type','application/x-www-form-urlencoded');
		//req.setHeader('Content-Length','10240');
		//req.setCompressed(true);
		system.debug('Request: ' + req.getBody());
		try {
			//if (TestLevel == 2) throw new System.CalloutException('Test Exception for Code Coverage');
            resp = m_http.send(req);
            ResponseText = resp.getBody();
        }  catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            ResponseText = 'Callout error: '+ e;
            System.debug(resp.toString());
            Messages.add('SendRequest() Callout ERROR: ' + e.getMessage() + ' - Query: ' + QueryString);
        }
        System.debug('SendRequest(): Response: ' + ResponseText);
		return ResponseText;
	}
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<Map<String, String>> CSV2List(String CSV) { // converts CSV (Tab delimited for now)
        List<Map<String, String>> resp = new List<Map<String, String>>();
        List<String> Flds = new List<String>();
        List<String> Lines = CSV.split('\n');
        Integer l = -1;
        Integer c = 0;
        for (String Line : Lines) {
            if (l == -1) Flds = Line.split('\t');
            else {
                List<String> Data = Line.split('\t');
                Map<String, String> Row = new Map<String, String>();
                c = 0;
                for (String Col : Data) Row.put(Flds[c++], Col);
                resp.add(Row);
            }
            l++;
        }
        return resp;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<SFA_Table__c> GetArchivedTables() {
        String Query = 'SELECT ' + TableFields + ' FROM SFA_Table__c';
        Query += ' ORDER BY Name';
        List<SFA_Table__c> Tables = database.query(Query);
        return Tables;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global SFA_Table__c GetArchivedTableById(String ID) {
        String Query = 'SELECT ' + TableFields + ' FROM SFA_Table__c';
        Query += ' WHERE Id = \'' + ID + '\' ORDER BY Name';
        SFA_Table__c Table = database.query(Query);
        return Table;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<Map<String, String>> GetAllTables(String SortBy) {
        List<Map<String, String>> Tables = new List<Map<String, String>>();
        List<Map<String, String>> Unsorted = new List<Map<String, String>>();
        List<String> Names = new List<String>();
        List<String> Labels = new List<String>();

        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
           String type = objTyp.getDescribe().isCustom() ? 'Custom' : 'Standard';
           String name = objTyp.getDescribe().getName();
           String label = objTyp.getDescribe().getLabel();
           // Exclude all the unwanted Sobjects e.g. History, Share etc..
        
            if(!name.containsignorecase('history') && !name.containsignorecase('tag')&& !name.containsignorecase('share') && !name.containsignorecase('feed')){      
                //System.debug( 'Name: ' + name + ', Label: ' + label);
                Map<String, String> MyMap = new Map<String, String>();
                MyMap.put('Name', name);
                MyMap.put('Label', label);
                MyMap.put('Type', type);
                Unsorted.add(MyMap);
                Names.add(name);
                Labels.add(label);
            }        
        }
        if (SortBy == 'Name') {
            Names.sort();
            for (String Name : Names) for (Map<String, String> M :Unsorted) if (M.get('Name') == Name) Tables.add(M);
        } else {
            Labels.sort();
            for (String Label : Labels) for (Map<String, String> M :Unsorted) if (M.get('Label') == Label) Tables.add(M);
        }
        return Tables;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    global List<Map<String, String>> GetFields(String ObjName) {
        
		List<String> stdObjectNames = new List<String>();
		for ( Schema.SObjectType typ : Schema.getGlobalDescribe().values() ) {
		    String sobjName = String.valueOf(typ);
		    if ( !sobjName.contains('__c') ) stdObjectNames.add(sobjName);
		}

        List<Map<String, String>> Fields = new List<Map<String, String>>();
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
		Schema.SObjectType leadSchema = schemaMap.get(objName);
        if (leadSchema != null) {
			Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
            for (String fieldName: fieldMap.keySet()) {
                Map<String, String> fld = new Map<String, String>();
                fld.put('Name', fieldName);
                fld.put('Label', fieldMap.get(fieldName).getDescribe().getLabel());
                fld.put('Length', String.valueOf(fieldMap.get(fieldName).getDescribe().getLength()));
                String FldType = schemaDisplayType(fieldMap.get(fieldName).getDescribe().getType());
                fld.put('Type', FldType);
                if (FldType == 'Decimal') fld.put('Precision', String.valueOf(fieldMap.get(fieldName).getDescribe().getPrecision()) + ',' + String.valueOf(fieldMap.get(fieldName).getDescribe().getScale()));
                fld.put('isUpdateable', String.valueOf(fieldMap.get(fieldName).getDescribe().isUpdateable()));
                List <Schema.sObjectType> RefTo = fieldMap.get(fieldName).getDescribe().getReferenceTo();
                if (RefTo.size() > 0) {
                    String RefField = fieldMap.get(fieldName).getDescribe().getReferenceTargetField();
                    if (RefField == null || RefField == 'null') RefField = 'Id';
                    fld.put('Ref', RefTo[0].getDescribe().getName() + '.' + RefField);
                }
                //system.debug('GetFields(): adding ' + Fld.get('Name'));
                Fields.add(fld);
            }
        } else system.debug('WARNING: No leadSchema for "' + ObjName + '"');
                    
        /* This is for debugging purposes ----------------- 
        for (Map<String, String> fld : Fields) {
            String Str = '';
        	for (String Key : fld.keySet()) {
            	if (Str != '') Str += ', ';
            	Str += Key + '="' + fld.get(Key) + '"';
            }
        	system.debug(Str);
        }
        /* ----------------------------------------------- */
        system.debug('GetFields(): ' + Fields.size() + ' Fields being returned for ' + ObjName);
        return Fields;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global static String schemaDisplayType(DisplayType fieldType){
        
        if(fieldType == Schema.DisplayType.String || 
            fieldType == Schema.DisplayType.TextArea ||
            fieldType == Schema.DisplayType.Id ||
            fieldType == Schema.DisplayType.Picklist ||
            fieldType == Schema.DisplayType.Reference ||
            fieldType == Schema.DisplayType.Phone ||
            fieldType == Schema.DisplayType.Email ||
            fieldType == Schema.DisplayType.URL)
                return 'String';
        if(fieldType == Schema.DisplayType.Currency ||
           fieldType == Schema.DisplayType.Double)
            return 'Decimal';
        if(fieldType == Schema.DisplayType.Integer)
            return 'Integer';
        if(fieldType == Schema.DisplayType.Boolean)
            return 'Boolean';
        if(fieldType == Schema.DisplayType.DateTime)
            return 'DateTime';    
        if(fieldType == Schema.DisplayType.Date)
            return 'Date';            
        if(fieldType == Schema.DisplayType.Time)
            return 'Time';
        if(fieldType == Schema.DisplayType.Combobox)
            return 'Combobox';    
        if(fieldType == Schema.DisplayType.MultiPicklist)
            return 'MultiPicklist';
       if(fieldType == Schema.DisplayType.EncryptedString)
            return 'EncryptedString';
       if(fieldType == Schema.DisplayType.DataCategoryGroupReference)
            return 'DataCategoryGroupReference';        
       if(fieldType == Schema.DisplayType.base64 )
            return 'base64';               
       if(fieldType == Schema.DisplayType.address )
            return 'address';               
       //if(fieldType == Schema.DisplayType.contact )
       //     return 'contact';               


       //if(fieldType == Schema.DisplayType.anytype)
       //     return 'anytype';                                  
        return 'UNKNOWN';    
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<String> GetChildRelationships(String TableName) {
        List<String> Childs = new List<String>();
        List<Schema.SObjectType> ObjTypes = Schema.getGlobalDescribe().Values();
        for(Schema.SObjectType objTyp : ObjTypes){
           String name = objTyp.getDescribe().getName();
           // Exclude all the unwanted Sobjects e.g. History, Share etc..
           if(name == TableName){  
               Schema.ChildRelationship[] rels = objTyp.getDescribe().getChildRelationships();
               for (Schema.ChildRelationship rel : rels) {
                   String relName = rel.getChildSObject().getDescribe().getName();
                   if (relName != null) {
               		   //System.debug(Tablename + ' -> ' + rel.getRelationshipName() + ', Object=' + rel.getChildSObject().getDescribe().getName() + ', Field=' + rel.getField().getDescribe().getName());
                       if (isTrueChild(RelName, name)) {
                           boolean Found = false;
                           for (String C : Childs) if (C == RelName) Found = true;
                           if (!Found) Childs.add(RelName);
                       }
                   }
               }
          }
        
        }        
        
        return Childs;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<String> GetParentRelationships(String TableName) {
        List<String> Parents = new List<String>();
		List<Map<String, String>> Fields = GetFields(TableName);
        for (Map<String, String> Fld : Fields) {
            if (Fld.get('Ref') != null) system.debug(Fld.get('Name') + ' - Ref: ' + Fld.get('Ref'));
        }
        return Parents;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global boolean isTrueChild(String ChildTable, String ParentTable) {
        system.debug('isTrueChild(' + ChildTable + ', ' + ParentTable + ')');
        //if (ChildTable.endsWith('__r')) ChildTable = ChildTable.substring(0, ChildTable.length() - 1) + 'c';
        List<Map<String, String>> Fields = GetFields(ChildTable);
        for (Map<String, String> Fld : Fields) {
            if (Fld.get('Ref') != null) {
                system.debug(ChildTable + ' -> ' + Fld.get('Ref') );
                if (Fld.get('Ref') == ParentTable + '.Id') return true;
            }
        }
        return False;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    global List<String> GetRefFields(String ChildTable, String ParentTable) {
        system.debug('GetRef(' + ChildTable + ', ' + ParentTable + ')');
        List<String> RefFields = new List<String>();
        //if (ChildTable.endsWith('__r')) ChildTable = ChildTable.substring(0, ChildTable.length() - 1) + 'c';
        List<Map<String, String>> Fields = GetFields(ChildTable);
        for (Map<String, String> Fld : Fields) {
            if (Fld.get('Ref') != null) {
                system.debug(ChildTable + ' -> ' + Fld.get('Ref') );
                if (Fld.get('Ref') == ParentTable + '.Id') RefFields.add(Fld.get('Name'));
            }
        }
        return RefFields;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


    global void GetSettings() {
        List<SF_Archive_Settings__c> Settings = [SELECT Id, Name, Auto_Archive__c, Username__c, Password__c, Token__c, URL__c FROM SF_Archive_Settings__c];
        if (Settings.size() > 0) {
            SF_Archive_Settings__c Setting = Settings[0];
            if (Setting.Username__c != null && Setting.Username__c != '') User = Setting.Username__c;
            if (Setting.Password__c != null && Setting.Password__c != '') Pass = Setting.Password__c;
            if (Setting.Token__c != null && Setting.Token__c != '') Token = Setting.Token__c;
            if (Setting.URL__c != null && Setting.URL__c != '') BaseURL = Setting.URL__c;
            if (Setting.Auto_Archive__c != null) AutoArchive = Setting.Auto_Archive__c;
        }
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public String ParseCriteria(String Tablename, String Criteria) {
        String WhereClause = '(Invalid)';
        String Temp = '';
		SFFields = GetFields(Tablename);
        system.debug('ParseCriteria(): ' + SFFields.size() + ' Fields Returned for ' + TableName);
        integer i = 0;
        integer j = 0;
        integer len = Criteria.length();
        boolean ok = true;
        
        // first check parentheses ----------------
        while (i < len) {
          if (Criteria.substring(i,i+1) == '(') j++;
          if (Criteria.substring(i,i+1) == ')') j--;
          i++;
        }
        if (j != 0) {
            Messages.add('ERROR: Mismatch in Opening/Closing Parentheses');
            ok=false;
        }
        // check field names -------------------
        if (ok) {
            i=0;
            j=0;
            while (i < len && i != -1 && ok) {
                String ch = Criteria.substring(i,i+1);
                if (Criteria.substring(i,i+1).isWhitespace() || Criteria.substring(i,i+1) == '(') i++;
                else {
                    j = len;
                    if (Criteria.indexOf(' ',i) < j && Criteria.indexOf(' ',i) != -1) j = Criteria.indexOf(' ',i);
                    if (Criteria.indexOf(')',i) < j && Criteria.indexOf(')',i) != -1) j = Criteria.indexOf(')',i);
                    if (Criteria.indexOf('=',i) < j && Criteria.indexOf('=',i) != -1) j = Criteria.indexOf('=',i);
                    String Str = Criteria.substring(i,j);
                    boolean Found = false;
                    for (Map<String, String> Fld : SFFields) {
                        system.debug('Fld: Name="' + Fld.get('Name') + ', Label="' + Fld.get('Label') + '", Str="' + Str + '"');
                        if (Fld.get('Name') == Str || Fld.get('Label') == Str) Found = true;
                    }
                    if (!Found) {
                        ok = false;
                        Messages.add('Invalid Field "' + Str + '" for object ' + Tablename + ' at column ' + i);
                        system.debug('Invalid Field "' + Str + '" for object ' + Tablename + ' at column ' + i);
                        i=-1;
                    } else {
                        system.debug(Tablename + ' field "' + Str + '" validated.');
                        i = j + 1; // skip past field
                        while (Criteria.substring(i,i+1).isWhitespace()) i++; // space after field
                        if (Criteria.substring(i,i+1) == '!') i++; // '!' after space ("!=" ?)
                        if (Criteria.substring(i,i+1) == '<') i++; // '<' after space ("<=" ?)
                        if (Criteria.substring(i,i+1) == '>') i++; // '>' after space (">=" ?)
                        if (Criteria.substring(i,i+1) == '=') i++; // equals after space or '!'
                        if (Criteria.substring(i,i+1) == 'l' || Criteria.substring(i,i+1) == 'L') { // 'LIKE' ?
                            if (Criteria.substring(i,i+4).toLowerCase() == 'like') i += 4;
                            else {
                                ok = false;
                                Messages.add('Bad Comparison operator "l" at column ' + i);
                                i=-1;
                            }
                        }
                        while (Criteria.substring(i,i+1).isWhitespace()) i++; // space after comparison operator
                        if (Criteria.substring(i,i+1) == '\'') { // quoted string
                        	String ch2 = '';
                            while (Criteria.substring(i,i+1) != '\'' || ch2 == '\\') {
                                ch2 = Criteria.substring(i,i+1);
                                i++;
                            }
                        } else if (Criteria.substring(i,i+1) == '{') { // date tag
                            while (Criteria.substring(i,i+1) != '}') i++; // skip past date tag
                            i++; // skip '}'
                        } else { // not a quoted string
                             while (!Criteria.substring(i,i+1).isWhitespace() && Criteria.substring(i,i+1) != ')') i++;
                        }
                        // skip whitespace and see if there's an 'or' or an 'and'
                        if (i < len) {
                            ch = Criteria.substring(i,i+1);
                            while (i < len && ch.isWhitespace()) { 
                                i++;
                            	if(i < len) ch = Criteria.substring(i,i+1);
                            }
                            if (i < len && ch.toLowerCase() == 'o') {
                                if (Criteria.substring(i,i+2).toLowerCase() == 'or') i += 2;
                            } else if (i < len && ch.toLowerCase() == 'a') {  
                                if (Criteria.substring(i,i+3).toLowerCase() == 'and') i += 3;
                            }
                        }
                        
                        
                    }
                }
            } 
        }
        // translate Date Tags -----------------
        if (ok) {
            Temp = Criteria;
            i=0;
            j=0;
            while (i < len && i != -1) {
                i = Criteria.indexOf('{',j);
                if (i > -1) {
                    j = Criteria.indexOf('}',i);
                    if (j > -1) {
                        String Str = Criteria.substring(i,j+1);
                        String dt = CriteriaDate(Str);
                        if (dt == 'invalid') {
                            ok = false;
                            Messages.add('Invalid Date Tag (' + Str + ')');
                            i = -1;
                        } else Temp = Temp.replace(Str, dt);
                    } else {
                        ok = false;
                        Messages.add('Invalid Date Tag (no closing ">")');
                        i = -1;
                    }
                } 
            } 
        }
        if (ok) return Temp;
        return 'invalid';
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    public String CriteriaDate(String Tag) {
        String DateStr = 'invalid';
        integer i = 1; // skip '{';
        integer j = Tag.indexof(' ',i);
        String num = Tag.substring(i,j);
        Integer n = -1;
        i = j + 1;
        j = Tag.indexOf('}',i);
        String per = Tag.substring(i,j).toLowerCase();
        if (num.isNumeric()) {
            n = integer.valueOf(num);
            DateTime dt;
            if (per == 'hours') dt = DateTime.now().addHours(n * -1);
            if (per == 'days') dt = DateTime.now().addDays(n * -1);
            if (per == 'months') dt = DateTime.now().addMonths(n * -1);
            if (per == 'years') dt = DateTime.now().addYears(n * -1);
            if (dt != null) DateStr = dt.format('yyyy-MM-dd HH:mm:ss').replace(' ','T') + '.000Z';
        }
        return DateStr;
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}