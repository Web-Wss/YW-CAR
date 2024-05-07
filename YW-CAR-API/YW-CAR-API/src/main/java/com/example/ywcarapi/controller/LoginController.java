package com.example.ywcarapi.controller;

import com.example.ywcarapi.model.Result;
import com.example.ywcarapi.model.User;
import com.example.ywcarapi.service.LoginService;
import com.example.ywcarapi.utils.JWTUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;


@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;


    @PostMapping("/login")
    public Result Login(@Param("phone")String phone,
                        @Param("password")String password) {
        Result result = new Result();
        User user = new User();
        Map<String,Object> map = new HashMap<>();
        user.setPhone(phone);
        user.setPassword(password);
        User user1 = loginService.Login(user);
        result.setSuccess(true);
        if (user1 != null){
            String token = JWTUtils.generateToken(phone);
            map.put("user",user1);
            map.put("token",token);
            result.setCode(200);
            result.setMsg("登录成功");
            result.setData(map);
        }else{
            result.setCode(2200);
            result.setMsg("登录失败");
        }
        return result;
    }


}
