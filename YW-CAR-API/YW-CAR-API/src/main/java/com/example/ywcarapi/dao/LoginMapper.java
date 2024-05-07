package com.example.ywcarapi.dao;

import com.example.ywcarapi.model.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {

    //    登录
    User Login(User user);

}
