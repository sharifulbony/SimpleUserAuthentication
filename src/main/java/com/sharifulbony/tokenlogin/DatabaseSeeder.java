package com.sharifulbony.tokenlogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
import java.util.*;

@Component
public class DatabaseSeeder implements CommandLineRunner {


    @Autowired
    public DatabaseSeeder(

    ) {

    }


    @Override
    @Transactional
    public void run(String... args) throws Exception {

        int dataSize =5;
        int maxCategoryForProduct=3;


    }

    protected String getSaltString(int size) {
        String SALTCHARS = "abcdefghijklmnopqrstuvwxyz1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < size) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }


}
