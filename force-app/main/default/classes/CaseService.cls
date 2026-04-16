public with sharing class CaseService {
    public static List<Case> getOpenCases() {
        return [SELECT Id, Subject, Status FROM Case WHERE Status != 'Closed'];//comment
    }
}