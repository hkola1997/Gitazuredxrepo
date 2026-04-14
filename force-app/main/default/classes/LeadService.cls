public with sharing class LeadService {
    public static void convertLeads(List<Id> leadIds) {
        for(Id leadId : leadIds){
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(leadId);
            lc.setDoNotCreateOpportunity(true); //comment
            Database.convertLead(lc);
        }
    }
}