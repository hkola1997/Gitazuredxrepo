public with sharing class AccountService {
    public static List<Account> getAllAccounts() {
        return [SELECT Id, Name, Industry FROM Account LIMIT 100];
    }
}