package com.example.ywcarapi.service.impl;

import com.example.ywcarapi.dao.LoginMapper;
import com.example.ywcarapi.model.User;
import com.example.ywcarapi.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    @Override
    public User Login(User user) {
        return loginMapper.Login(user);
    }
}
