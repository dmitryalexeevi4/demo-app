/**
 * Created by user on 20.09.2019.
 */

public with sharing class YandexEdaCreateOfferController {
    @AuraEnabled
    public static List<Contact> getContact(String ID) {
        return [SELECT ID, Name, Account.Name, Email FROM Contact WHERE AccountId = :ID];
    }

    @AuraEnabled
    public static Boolean createOffer(String accID) {
        Account acc = [SELECT ID, AccountOffer__c FROM Account WHERE ID = :accID];
        if (acc.AccountOffer__c == null) {
            Offer__c offer = new Offer__c();
            insert offer;
            acc.AccountOffer__c = offer.Id;
            update acc;
        } else return false;
        return true;
    }

    @AuraEnabled
    public static void sendMail(String ID) {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{
                'Contact.Email'
        };
        message.setToAddresses(toAddresses);
        message.subject = 'Opt Out Test Message';
        message.plainTextBody = 'This is the message body.';
        Messaging.SingleEmailMessage[] messages =
                new List<Messaging.SingleEmailMessage>{
                        message
                };
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: '
                    + results[0].errors[0].message);
        }
    }


}
