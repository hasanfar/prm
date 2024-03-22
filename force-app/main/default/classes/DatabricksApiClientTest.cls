@isTest
public class DatabricksApiClientTest {

    // Mock implementation of HttpCalloutMock
    private class DatabricksTokenMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('{"access_token": "fakeAccessToken"}');
            return res;
        }
    }

    @isTest
    static void testGetDatabricksToken() {
        Test.setMock(HttpCalloutMock.class, new DatabricksTokenMock());

        Test.startTest();
        String token = DatabricksApiClient.getDatabricksToken();
        Test.stopTest();

        // Add assertions here
        System.assertNotEquals(null, token, 'Token should not be null');
        System.assertEquals('fakeAccessToken', token, 'Token should be correct');
    }

    @isTest
    static void testCheckForAddressMatch() {
        // Create test data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Address_vod__c testAddress = new Address_vod__c(
            Account_vod__c = testAccount.Id,
            Name = '123 Test St',
            City_vod__c = 'Test City',
            State_vod__c = 'Test State',
            Zip_vod__c = '12345'
        );
        insert testAddress;

        System.debug('ADDY :: '+testAddress);

        // Call the method with existing address
        Boolean result = DatabricksApiClient.checkForAddressMatch('123 Test St', 'Test City', 'Test State', '12345', testAccount.Id);

        // Add assertions
        System.assertEquals(false, result, 'Address match should be found');

        // Call the method with non-existing address
        Boolean result2 = DatabricksApiClient.checkForAddressMatch('456 Nonexistent St', 'Nonexistent City', 'Nonexistent State', '67890', testAccount.Id);

        // Add assertions
        System.assertEquals(false, result2, 'Address match should not be found');
    }

    @isTest
    static void testGetPrimaryAddress() {
        // Create test data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Address_vod__c primaryAddress = new Address_vod__c(
            Account_vod__c = testAccount.Id,
            Name = 'Primary Address',
            City_vod__c = 'Test City',
            State_vod__c = 'Test State',
            Zip_vod__c = '12345',
            Primary_vod__c = true
        );
        insert primaryAddress;

        System.debug('PRIMS :: '+primaryAddress);

        // Call the method
        List<Address_vod__c> addresses = DatabricksApiClient.getPrimaryAddress(testAccount.Id);
        System.debug('PRIMADD :: '+addresses);

        // Add assertions
        System.assertEquals(1, addresses.size(), 'Should retrieve one primary address');
        System.assertEquals('Primary Address', addresses[0].Name, 'Unexpected primary address name');
        System.assertEquals('Test City', addresses[0].City_vod__c, 'Unexpected city');
        System.assertEquals('Test State', addresses[0].State_vod__c, 'Unexpected state');
    }

    @isTest
    static void testSaveAddress() {
        // Create test data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Call the method to save a new address
        Test.startTest();
        Boolean result = DatabricksApiClient.saveAddress('123 Test St', 'Test City', 'Test State', '12345', testAccount.Id, true);
        Test.stopTest();

        // Retrieve the saved address
        Address_vod__c[] savedAddresses = [SELECT Id, Name, City_vod__c, State_vod__c, Postal_Code_NWK__c, Primary_vod__c FROM Address_vod__c WHERE Account_vod__c = :testAccount.Id];

        // Add assertions
        System.assertEquals(true, result, 'Address should be saved successfully');
        System.assertEquals(1, savedAddresses.size(), 'There should be one saved address');
        System.assertEquals('123 Test St', savedAddresses[0].Name, 'Unexpected address name');
        System.assertEquals('Test City', savedAddresses[0].City_vod__c, 'Unexpected city');
        System.assertEquals('Test State', savedAddresses[0].State_vod__c, 'Unexpected state');
        System.assertEquals('12345', savedAddresses[0].Postal_Code_NWK__c, 'Unexpected zip code');
        System.assertEquals(true, savedAddresses[0].Primary_vod__c, 'Address should be primary');
    }

    // Mock implementation of HttpCalloutMock
    private class DatabricksAddressMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('{"result": "fakeResult"}');
            return res;
        }
    }

    @isTest
    static void testGetAddress() {
        // Set up mock callout environment
        Test.setMock(HttpCalloutMock.class, new DatabricksAddressMock());

        // Call the method
        Test.startTest();
        String result = DatabricksApiClient.getAddress('1234567890');
        Test.stopTest();

        // Add assertions
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assertEquals('{"result": "fakeResult"}', result, 'Result should be as expected');
    }

}
