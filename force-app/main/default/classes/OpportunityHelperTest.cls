@isTest
public class OpportunityHelperTest {

    @testSetup
    static void setupData() {
        Account acc = new Account(Name='Test Account');
        insert acc;

        List<Opportunity> opps = new List<Opportunity>{
            new Opportunity(
                Name='Opp1',
                StageName='Prospecting',
                CloseDate=Date.today(),
                Amount=100,
                AccountId=acc.Id
            ),
            new Opportunity(
                Name='Opp2',
                StageName='Prospecting',
                CloseDate=Date.today(),
                Amount=200,
                AccountId=acc.Id
            )
        };
        insert opps;
    }

    @isTest
    static void testCalculateTotalAmount_Positive() {
        List<Opportunity> opps = [SELECT Amount FROM Opportunity];

        Test.startTest();
        Decimal total = OpportunityHelper.calculateTotalAmount(opps);
        Test.stopTest();

        System.assertEquals(300, total, 'Total should be sum of all opportunity amounts');
    }

    @isTest
    static void testCalculateTotalAmount_WithNullAmounts() {
        Opportunity opp = new Opportunity(
            Name='No Amount Opp',
            StageName='Prospecting',
            CloseDate=Date.today()
        );
        insert opp;

        List<Opportunity> opps = [SELECT Amount FROM Opportunity];

        Decimal total = OpportunityHelper.calculateTotalAmount(opps);

        System.assert(total >= 300, 'Null amounts should not affect total calculation');
    }

    @isTest
    static void testCalculateTotalAmount_EmptyList() {
        Test.startTest();
        Decimal total = OpportunityHelper.calculateTotalAmount(new List<Opportunity>());
        Test.stopTest();

        System.assertEquals(0, total, 'Total should be 0 for empty input list');//comment
    }

    @isTest
    static void testCalculateTotalAmount_BulkRecords() {
        List<Opportunity> opps = [SELECT Amount FROM Opportunity];

        Decimal total = OpportunityHelper.calculateTotalAmount(opps);

        System.assert(total > 0, 'Bulk records should be processed correctly');
    }
}