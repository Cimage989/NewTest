public with sharing class newlwcAssign {

@AuraEnabled(cacheable = true)
public static list<String> getOpportunityPageLayout()
{ 

string objectName='Opportunity';
string layout='New Page Layout';
string layoutName=String.format('{0}-{1}', new String[]{objectName, layout}); 
    List<Metadata.Metadata> layouts = Metadata.Operations.retrieve(Metadata.MetadataType.Layout, new List<String> {layoutName});
    //get only layput name
    List<string> fields=new List<string>();
    Metadata.Layout layoutMd = (Metadata.Layout)layouts.get(0);
    for (Metadata.LayoutSection section : layoutMd.layoutSections) {
        for (Metadata.LayoutColumn column : section.layoutColumns) {
            if (column.layoutItems != null) {
                for (Metadata.LayoutItem item : column.layoutItems) {
                    fields.add(item.field);
                }
            }
        }
    }
System.debug('fields'+fields);
return fields;
}

@AuraEnabled(cacheable = true)
public static list<String> getLeadLayout()
{ 

string objectName='Lead';
string layout='New Lead Layout';
string layoutName=String.format('{0}-{1}', new String[]{objectName, layout}); 
    List<Metadata.Metadata> layouts = Metadata.Operations.retrieve(Metadata.MetadataType.Layout, new List<String> {layoutName});
    //get only layput name
    List<string> fields=new List<string>();
    Metadata.Layout layoutMd = (Metadata.Layout)layouts.get(0);
    for (Metadata.LayoutSection section : layoutMd.layoutSections) {
        for (Metadata.LayoutColumn column : section.layoutColumns) {
            if (column.layoutItems != null) {
                for (Metadata.LayoutItem item : column.layoutItems) {
                    fields.add(item.field);
                }
            }
        }
    }
System.debug('fields'+fields);
return fields;
}

@AuraEnabled(cacheable = true)
public static String getRecordId(String recordId){
Opportunity opp = new Opportunity();
Lead lead = new Lead();
// System.debug('RecordId'+recordId);
opp = [Select Id,Lead__c From Opportunity Where Id =:recordId];
list<String> apiNameList = new list<String>();
Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
Schema.SObjectType leadSchema = schemaMap.get('Lead');
Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
for (String fName: fieldMap.keySet()) {
    if(fieldMap.get(fName).getDescribe().isUpdateable()){
        apiNameList.add(fName);
    }
} 
    string apiNameWithComma = string.join(apiNameList,',');
    String leadId = opp.Lead__c;
    System.debug('apiwith'+ apiNameWithComma);
//String soqlQuery ='SELECT ID,'+apiNameWithComma+' FROM Lead WHERE Id =: '+leadId;
String soqlQuery ='SELECT ID,'+apiNameWithComma+' FROM Lead WHERE Id =: ';
soqlQuery += 'leadId';
System.debug('Query'+soqlQuery);
List<lead> l2 = database.query(soqlQuery);
List<lead> l = new List<Lead>();
for(Lead l1 : l2){
//l = database.query(soqlQuery);
System.debug('Test'+l1.id);

}
return l2[0].Id;
}
}
