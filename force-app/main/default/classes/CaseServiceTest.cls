@isTest
public class CaseServiceTest {

    @testSetup
    static void setup() {
        insert new Case(Subject='Test', Status='New');
    }

    @isTest
    static void testOpenCases_Positive() {
        System.assert(CaseService.getOpenCases().size() > 0);
    }

    @isTest
    static void testClosedCases_Filtered() {
        Case cs = [SELECT Id FROM Case LIMIT 1];
        cs.Status = 'Closed';
        update cs;

        System.assertEquals(0, CaseService.getOpenCases().size());
    }

    @isTest
    static void testOpenCases_Empty() {
        delete [SELECT Id FROM Case];
        System.assertEquals(0, CaseService.getOpenCases().size());//comment
    }
}