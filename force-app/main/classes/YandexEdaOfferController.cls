/**
 * Created by user on 12.09.2019.
 */

public with sharing class YandexEdaOfferController {
    public Offer__c offer {get;set;}
    public Boolean coincidesLegal {get;set;}

    public String sRestName {get;set;}
    public String sAccountFullName {get;set;}
    public String sCity {get;set;}
    public String sIndex {get;set;}
    public String sStreet {get;set;}
    public String sApartments {get;set;}
    public String sOGRN {get;set;}
    public String sINN {get;set;}
    public String sKPP {get;set;}
    public String sNDS {get;set;}
    public String sBankName {get;set;}
    public String sBankBIK {get;set;}
    public String sCorAcc {get;set;}
    public String sCheckingAcc {get;set;}
    public String sAccounting_Phone {get;set;}
    public String sAccountingEmail {get;set;}
    public String sWebsite {get;set;}
    public String sBillingIndex {get;set;}
    public String sBillingCity {get;set;}
    public String sBillingAddress {get;set;}
    public String sSignerName {get;set;}
    public String sSignerPosition {get;set;}


    public YandexEdaOfferController() {

        String accId = ApexPages.currentPage().getParameters().get('id');
        Account account = [
                SELECT AccountOffer__c
                FROM Account
                WHERE Id = :accId
        ];

        offer = [
                SELECT RestName__c, AccountFullName__c, City__c, Index__c, Street__c,
                        Apartments__c, OGRN__c, INN__c, KPP__c, NDS__c, BankName__c,
                        CheckingAcc__c, BankBIK__c, CorAcc__c, Accounting_Phone__c,
                        AccountingEmail__c, Website__c, BillingIndex__c, BillingCity__c,
                        BillingAddress__c, SignerName__c, SignerPosition__c
                FROM Offer__c
                WHERE Id = :account.AccountOffer__c
        ];
        sRestName = offer.RestName__c;
        sAccountFullName = offer.AccountFullName__c;
        sCity = offer.City__c;
        sIndex = offer.Index__c;
        sStreet = offer.Street__c;
        sApartments = offer.Apartments__c;
        sOGRN = offer.OGRN__c;
        sINN = offer.INN__c;
        sKPP = offer.KPP__c;
        sNDS = offer.NDS__c;
        sBankName = offer.BankName__c;
        sBankBIK = offer.BankBIK__c;
        sCorAcc = offer.CorAcc__c;
        sCheckingAcc = offer.CheckingAcc__c;
        sAccounting_Phone = offer.Accounting_Phone__c;
        sAccountingEmail = offer.AccountingEmail__c;
        sWebsite = offer.Website__c;
        sBillingIndex = offer.BillingIndex__c;
        sBillingCity = offer.BillingCity__c;
        sBillingAddress = offer.BillingAddress__c;
        sSignerName = offer.SignerName__c;
        sSignerPosition = offer.SignerPosition__c;
    }

    public List<SelectOption> getTypes() {
        Schema.sObjectType sobject_type = Offer__c.getSObjectType();
        Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe();
        Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap();
        List<Schema.PicklistEntry> pick_list_values = field_map.get('NDS__c').getDescribe().getPickListValues();
        List<selectOption> options = new List<selectOption>();

        for (Schema.PicklistEntry a : pick_list_values) {
            options.add(new selectOption(a.getLabel(), a.getValue()));
        }
        return options;
    }

    public PageReference save() {
        offer.AccountFullName__c = sAccountFullName;
        offer.RestName__c = sRestName;
        offer.City__c = sCity;
        offer.Index__c = sIndex;
        offer.Street__c = sStreet;
        offer.Apartments__c = sApartments;
        offer.OGRN__c = sOGRN;
        offer.INN__c = sINN;
        offer.KPP__c = sKPP;
        offer.NDS__c = sNDS;
        offer.BankName__c = sBankName;
        offer.BankBIK__c = sBankBIK;
        offer.CorAcc__c = sCorAcc;
        offer.CheckingAcc__c = sCheckingAcc;
        offer.Accounting_Phone__c = sAccounting_Phone;
        offer.AccountingEmail__c = sAccountingEmail;
        offer.Website__c = sWebsite;
        offer.BillingIndex__c = sBillingIndex;
        offer.BillingCity__c = sBillingCity;
        offer.BillingAddress__c = sBillingAddress;
        offer.SignerName__c = sSignerName;
        offer.SignerPosition__c = sSignerPosition;

        update offer;
        return null;
    }
}
