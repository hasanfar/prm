/*
 * secret:  dose648ca4cd908bcd574864d339177e89d1
 * clientid:  6078b52b-d44f-4e6a-bd3f-7692f96f35b7
*/
public class DatabricksApiClient {

    // Databricks workspace URL
    private static String DATABRICKS_URL = 'https://wayfinder-immunovant.cloud.databricks.com';

    // Databricks API execute query endpoint
    private static String QUERY_ENDPOINT = '/api/2.0/sql/statements';

    // Databricks API token endpoint
    private static String TOKEN_ENDPOINT = 'https://accounts.cloud.databricks.com/oidc/accounts/2b449622-9a62-4ff1-a07c-02d70e2dd275/v1/token';

    private static final String CLIENT_ID = '6078b52b-d44f-4e6a-bd3f-7692f96f35b7';
    private static final String CLIENT_SECRET = 'dose648ca4cd908bcd574864d339177e89d1';

    public static String getDatabricksToken() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(TOKEN_ENDPOINT);
        request.setMethod('POST');
        
        // Set the authorization header with client ID and client secret
        String authHeader = 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(CLIENT_ID + ':' + CLIENT_SECRET));
        request.setHeader('Authorization', authHeader);
        request.setBody('grant_type=client_credentials&scope=all-apis');
        
        // Set the request body if needed (e.g., for additional parameters)
        // request.setBody('grant_type=password&username=<your-username>&password=<your-password>');
        
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            // Successfully obtained the token
            Map<String, Object> tokenResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(tokenResponse.get('access_token'));
            return (String) tokenResponse.get('access_token');
        } else {
            // Handle the error
            System.debug('Error retrieving token. Status Code: ' + response.getStatusCode());
            System.debug('Response Body: ' + response.getBody());
            return null;
        }
    }
    
    @AuraEnabled
    public static Boolean checkForAddressMatch(String street, String city, String state, String zip, String acctId){
        //SELECT Id, Name, City_vod__c, State_vod__c, Zip_vod__c FROM Address_vod__c WHERE Account_vod__c = '0018c00002UL9WjAAL'
        List<Address_vod__c> address = [SELECT Id FROM Address_vod__c 
                                        WHERE Account_vod__c =: acctId 
                                        AND Name =: street
                                        AND City_vod__c =: city
                                        AND State_vod__c =: state
                                        AND Zip_vod__c =: zip
                                        LIMIT 1];
        String query = 'SELECT Id FROM Address_vod__c WHERE Account_vod__c = '+acctId+' AND Name = '+street+' AND City_vod__c = '+city+' AND State_vod__c = '+state+' AND Zip_vod__c = '+zip+' LIMIT 1';
        System.debug('QUERY :: '+query);
        System.debug('ADDY :: '+address);
        if(address.isEmpty()){
            System.debug('no match :: '+address);
            return false;
        }else{
            System.debug('has match :: '+address);
            return true;
        }
    }

    @AuraEnabled
    public static List<Address_vod__c> getPrimaryAddress(String acctId){
        List<Address_vod__c> address = [SELECT Name, City_vod__c, State_vod__c, Zip_vod__c FROM Address_vod__c 
                                        WHERE Account_vod__c =: acctId 
                                        AND Primary_vod__c = true
                                        LIMIT 1];

        return address;
    }

    @AuraEnabled
    public static Boolean saveAddress(String street, String city, String state, String zip, String acctId, Boolean primary){
        Address_vod__c newAddress = new Address_vod__c();
        newAddress.Account_vod__c = acctId;
        newAddress.Name = street;
        newAddress.City_vod__c = city;
        newAddress.State_vod__c = state;
        newAddress.Postal_Code_NWK__c = zip;
        newAddress.Primary_vod__c = primary;

        System.debug('ZIP :: '+zip);
        System.debug('ADDY :: '+newAddress);

        try {
            insert newAddress;
        } catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
            return false;
        }

        return true;
        
    }

    // Method to execute a query against Databricks API
    @AuraEnabled
    public static String getAddress(String npi) {
        // Get the Databricks API token
        String authToken = DatabricksApiClient.getDatabricksToken();
        System.debug('TOKEN ::: '+authToken);

        // Construct the full URL for the query endpoint
        String apiUrl = DATABRICKS_URL + QUERY_ENDPOINT;

        String query = 'SELECT mailingstreet, mailingcity, mailingstate, mailingzippostalcode FROM immunovant.directory.practitioner WHERE npi = '+npi;

        // Create a JSON payload with the query
        String payload = '{"wait_timeout": "30s", "warehouse_id": "6fb8e4bf61c159a1", "statement": "' + query + '"}';

        System.debug('PAYLOAD :: '+payload);

        // Make a POST request to the Databricks API
        HttpRequest req = new HttpRequest();
        req.setEndpoint(apiUrl);
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer ' + authToken);
        req.setHeader('Content-Type', 'application/json');
        req.setBody(payload);

        HttpResponse res;

        String result;

        try{
            // Create an HTTP object to send the request
            Http http = new Http();
            res = http.send(req);

            // Parse the response and extract the query result
            String queryResult = '';
            if (res.getStatusCode() == 200) {
                //Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                //queryResult = (String) responseMap.get('result');
            } else {
                System.debug('Failed to execute Databricks query. Response: ' + res.getBody());
            }

            System.debug('RESULT :: '+res.getBody());
            result = res.getBody();
        }catch(Exception e){
            System.debug(e);
            result = 'timed out';
        }

        return result;
    }
}
