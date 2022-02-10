public with sharing class newlwcAssign1 {

    @AuraEnabled(cacheable = true)

public static list<String> getFieldListWithTypeData1()
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

  
}
