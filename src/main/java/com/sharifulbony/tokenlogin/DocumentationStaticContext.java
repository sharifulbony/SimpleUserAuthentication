package com.sharifulbony.tokenlogin;

public class DocumentationStaticContext {


    final static String userRegisterDescription="These Method Will create a user in the database";
    final static String userRegisterParam="This method will take \"username\" and \"password\" as a parameter to register a" +
            " user in database ";

    final static String userAuthenticationDescription="These Method Will authenticate  a user and in response give a " +
            "token to successfully authenticated user. " +
            "This token should be used as authorization header for validating the session of user";
    final static String userAuthenticationParam="This method will take \"email or personal code \" and \"password\" as a parameter " +
            "to authenticate a user ";

    final static String userInfoDescription="These Method Will return a user by parsing the token from database";
    final static String userInfoParam="This method only take the token as authorization header " ;

    final static String refreshTokenDescription="These Method Will refresh the token by setting up a new token if current token is not expired";
    final static String refreshTokenParam="This method only take the token as  authorization header " ;


    final static String renewTokenDescription="These Method Will renew a token within the policy of token renewal after a token expired";
    final static String renewTokenParam="This method only take the expired token as authorization header " ;

    final static String mainPageDescription="These Method Will return the main page of the project";




}
