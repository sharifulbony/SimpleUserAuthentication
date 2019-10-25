package com.sharifulbony.tokenlogin.constant;

public class DocumentationStaticContext {


    public final static String userRegisterDescription = "These Method Will create a user in the database";
    public final static String userRegisterParam = "This method will take \"username\" and \"password\" as a parameter to register a" +
            " user in database ";

    public final static String userAuthenticationDescription = "These Method Will authenticate  a user and in response give a " +
            "token to successfully authenticated user. " +
            "This token should be used as authorization header for validating the session of user";
    public final static String userAuthenticationParam = "This method will take \"email or personal code \" and \"password\" as a parameter " +
            "to authenticate a user ";

    public final static String userInfoDescription = "These Method Will return a user by parsing the token from database";
    public final static String userInfoParam = "This method only take the token as authorization header ";

    public final static String refreshTokenDescription = "These Method Will refresh the token by setting up a new token if current token is not expired";
    public final static String refreshTokenParam = "This method only take the token as  authorization header ";


    public final static String renewTokenDescription = "These Method Will renew a token within the policy of token renewal after a token expired";
    public final static String renewTokenParam = "This method only take the expired token as authorization header ";

    public final static String mainPageDescription = "These Method Will return the main page of the project";


}
