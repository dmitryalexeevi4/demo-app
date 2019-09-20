/**
 * Created by user on 12.09.2019.
 */

public with sharing class YandexEdaOfferController {
    public Offer__c offer {get;set;}

    public String RestName {get;set;}
    public String AccountFullName {get;set;}
    public String City {get;set;}
    public String Index {get;set;}
    public String Street {get;set;}
    public String Apartments {get;set;}
    public String OGRN {get;set;}
    public String INN {get;set;}
    public String KPP {get;set;}
    public String NDS {get;set;}
    public String BankName {get;set;}
    public String BankBIK {get;set;}
    public String CorAcc {get;set;}
    public String CheckingAcc {get;set;}
    public String Accounting_Phone {get;set;}
    public String AccountingEmail {get;set;}
    public String Website {get;set;}
    public String BillingIndexStr {get;set;}
    public String BillingCityStr {get;set;}
    public String BillingAddressStr {get;set;}
    public String SignerName {get;set;}
    public String SignerPosition {get;set;}


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
        RestName = offer.RestName__c;
        AccountFullName = offer.AccountFullName__c;
        City = offer.City__c;
        Index = offer.Index__c;
        Street = offer.Street__c;
        Apartments = offer.Apartments__c;
        OGRN = offer.OGRN__c;
        INN = offer.INN__c;
        KPP = offer.KPP__c;
        NDS = offer.NDS__c;
        BankName = offer.BankName__c;
        BankBIK = offer.BankBIK__c;
        CorAcc = offer.CorAcc__c;
        CheckingAcc = offer.CheckingAcc__c;
        Accounting_Phone = offer.Accounting_Phone__c;
        AccountingEmail = offer.AccountingEmail__c;
        Website = offer.Website__c;
        BillingIndexStr = offer.BillingIndex__c;
        BillingCityStr = offer.BillingCity__c;
        BillingAddressStr = offer.BillingAddress__c;
        SignerName = offer.SignerName__c;
        SignerPosition = offer.SignerPosition__c;
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
        offer.AccountFullName__c = AccountFullName;
        offer.RestName__c = RestName;
        offer.City__c = City;
        offer.Index__c = Index;
        offer.Street__c = Street;
        offer.Apartments__c = Apartments;
        offer.OGRN__c = OGRN;
        offer.INN__c = INN;
        offer.KPP__c = KPP;
        offer.NDS__c = NDS;
        offer.BankName__c = BankName;
        offer.BankBIK__c = BankBIK;
        offer.CorAcc__c = CorAcc;
        offer.CheckingAcc__c = CheckingAcc;
        offer.Accounting_Phone__c = Accounting_Phone;
        offer.AccountingEmail__c = AccountingEmail;
        offer.Website__c = Website;
        offer.BillingIndex__c = BillingIndexStr;
        offer.BillingCity__c = BillingCityStr;
        offer.BillingAddress__c = BillingAddressStr;
        offer.SignerName__c = SignerName;
        offer.SignerPosition__c = SignerPosition;

        update offer;
        return null;
    }
}
