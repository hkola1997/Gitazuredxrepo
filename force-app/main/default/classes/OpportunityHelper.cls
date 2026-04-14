public class OpportunityHelper {
    public static Decimal calculateTotalAmount(List<Opportunity> opps) {
        Decimal total = 0;
        for(Opportunity opp : opps){
            if(opp.Amount != null){
                total += opp.Amount;
            }
        }
        return total;//Comment
    }
}