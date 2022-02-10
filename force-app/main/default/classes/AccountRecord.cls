
public with sharing class AccountRecord {
    @AuraEnabled
  public static void Test(String LastName,String Email,String Phone){
    Contact con = new Contact();
    con.LastName = LastName;
    con.Email = Email;
    con.Phone = Phone;
    insert con;
    System.debug('First Namre'+LastName);
    
  }
}
