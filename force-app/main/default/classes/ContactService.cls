public with sharing class ContactService {
    public static List<Contact> getContactsByAccount(Id accId) {
        return [SELECT Id, Name, Email FROM Contact WHERE AccountId = :accId];
    }
}