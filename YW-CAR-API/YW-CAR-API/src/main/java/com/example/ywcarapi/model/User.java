package com.example.ywcarapi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class User {

    private Integer userId;
    private String phone;
    private String password;
    private String nickname;

}
