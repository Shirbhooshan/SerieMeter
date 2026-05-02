package com.seriemeter.service;

import com.seriemeter.dao.UserDAO;
import com.seriemeter.utils.PasswordUtil;

public class RegisterService {
    private UserDAO dao = new UserDAO();

    public void registerNewUser(String fullName, String username, String email, String password) throws Exception {
        // Hash the password 
        String hashedPassword = PasswordUtil.getHashPassword(password);
        
        //  Send to DAO
        dao.insertUser(fullName, username, email, hashedPassword);
    }
}