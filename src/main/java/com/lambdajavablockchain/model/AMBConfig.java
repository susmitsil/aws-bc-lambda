package com.lambdajavablockchain.model;

public class AMBConfig {

    public static final String REGION = System.getenv("AMB_REGION").isEmpty() ? "ap-southeast-1" : System.getenv("AMB_REGION");
    public static final String NETWORKID = System.getenv("NETWORK_ID").isEmpty() ? "n-XXXXXXXXXXXXXX" : System.getenv("NETWORK_ID");
    public static final String MEMBERNAME = System.getenv("MEMBER_NAME").isEmpty() ? "member1" : System.getenv("MEMBER_NAME");
    public static final String MEMBERID = System.getenv("MEMBER_ID").isEmpty() ? "m-XXXXXXXXXXXXXXX" : System.getenv("MEMBER_ID");
    public static final String PEERID = System.getenv("PEER_ID").isEmpty() ? "nd-XXXXXXXXXXXXXXX" : System.getenv("PEER_ID");

    public static final String MEMBERNAMEORG2 = System.getenv("MEMBER_NAMEORG2").isEmpty() ? "member2" : System.getenv("MEMBER_NAMEORG2");
    public static final String MEMBERIDORG2 = System.getenv("MEMBER_IDORG2").isEmpty() ? "m-XXXXXXXXXXXXXXX" : System.getenv("MEMBER_IDORG2");
    public static final String PEERIDORG2 = System.getenv("PEER_IDORG2").isEmpty() ? "nd-XXXXXXXXXXXXXXX" : System.getenv("PEER_IDORG2");

    // CA Properties
    public static final String ADMINUSER = System.getenv("ADMIN_USER").isEmpty() ? "admin" : System.getenv("ADMIN_USER");
    public static final String ADMINPWD = System.getenv("ADMIN_PWD").isEmpty() ? "Password123" : System.getenv("ADMIN_PWD");
    public static final String CA_ORG1_URL = "https://" + System.getenv("CA_ENDPOINT");
    public static final String AMB_CERT_PATH = "managedblockchain-tls-chain.pem";

    public static final String CA_ORG2_URL = "https://" + System.getenv("CA_ENDPOINTORG2");
	

    // Fabric user used by Lambda function
    public static final String LAMBDAUSER = System.getenv("LAMBDA_USER").isEmpty() ? "lambdaUser" : System.getenv("LAMBDA_USER");
    public static final String LAMBDAUSERPWD = System.getenv("LAMBDA_USER_PWD").isEmpty() ? "LambdaUserPwd1" : System.getenv("LAMBDA_USER_PWD");

    // Ordering service properties
    public static final String ORDERER_NAME = NETWORKID;
    public static final String ORDERER_URL = "grpcs://" + System.getenv("ORDERER_ENDPOINT");

    // ORG1 properties
    public static final String ORG1 = MEMBERNAME; // affiliation
    public static final String ORG1_MSP = MEMBERID;

    // ORG2 properties
    public static final String ORG2 = MEMBERNAMEORG2; // affiliation
    public static final String ORG2_MSP = MEMBERIDORG2;

    // ORG1 Peer properties
    public static final String ORG1_PEER_0 = PEERID;
    public static final String ORG1_PEER_0_URL = "grpcs://" + System.getenv("PEER_ENDPOINT");
    public static final String ORG1_PEER_0_EVENTHUB_URL = "grpcs://" + System.getenv("PEER_EVENT_ENDPOINT");

    // ORG1 Peer properties
    public static final String ORG2_PEER_0 = PEERIDORG2;
    public static final String ORG2_PEER_0_URL = "grpcs://" + System.getenv("PEER_ENDPOINTORG2");
    public static final String ORG2_PEER_0_EVENTHUB_URL = "grpcs://" + System.getenv("PEER_EVENT_ENDPOINTORG2");

    // Channel & Chaincode info
    public static final String CHANNEL_NAME = System.getenv("CHANNEL_NAME").isEmpty() ? "mychannel" : System.getenv("CHANNEL_NAME");
    public static final String CHAINCODE_NAME = System.getenv("CHAINCODE_NAME").isEmpty() ? "asset" : System.getenv("CHAINCODE_NAME");
}

