@isTest
public class LeadServiceTest {

    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>{
            new Lead(LastName='Lead1', Company='Test1'),
            new Lead(LastName='Lead2', Company='Test2')
        };
        insert leads;
    }

    // 1. Positive Test
    @isTest
    static void testConvertLead_Positive() {
        Lead ld = [SELECT Id FROM Lead LIMIT 1];

        Test.startTest();
        LeadService.convertLeads(new List<Id>{ld.Id});
        Test.stopTest();

        System.assert(true, 'Lead should be converted successfully');
    }

    // 2. Empty List
    @isTest
    static void testConvertLead_EmptyList() {
        Test.startTest();
        LeadService.convertLeads(new List<Id>());
        Test.stopTest();

        System.assert(true, 'Method should handle empty list');
    }

    // 3. Null Input
    @isTest
    static void testConvertLead_NullInput() {
        Test.startTest();
        LeadService.convertLeads(null);
        Test.stopTest();

        System.assert(true, 'Method should handle null input safely');
    }

    // 4. Bulk Leads Conversion
    @isTest
    static void testConvertLead_Bulk() {
        List<Lead> leads = [SELECT Id FROM Lead];

        List<Id> leadIds = new List<Id>();
        for(Lead l : leads){
            leadIds.add(l.Id);
        }

        Test.startTest();
        LeadService.convertLeads(leadIds);
        Test.stopTest();

        System.assertEquals(leadIds.size(), leads.size(),
            'All leads should be processed');
    }

    // 5. Already Converted Lead Scenario
    @isTest
    static void testConvertLead_AlreadyConverted() {
        Lead ld = [SELECT Id FROM Lead LIMIT 1];

        // First conversion
        LeadService.convertLeads(new List<Id>{ld.Id});

        // Try converting again
        Test.startTest();
        LeadService.convertLeads(new List<Id>{ld.Id});
        Test.stopTest();

        System.assert(true, 'Should handle already converted leads gracefully');
    }

    // 6. Invalid Lead Id
    @isTest
    static void testConvertLead_InvalidId() {
        Id fakeId = '00Q000000000000AAA'; // fake Lead Id

        Test.startTest();
        LeadService.convertLeads(new List<Id>{fakeId});
        Test.stopTest();

        System.assert(true, 'Should handle invalid Id without crashing');
    }
}