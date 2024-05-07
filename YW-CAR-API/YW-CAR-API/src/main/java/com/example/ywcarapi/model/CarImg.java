package com.example.ywcarapi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class CarImg {

    private Integer carImgId;
    private Integer carId;
    private String carImgPath;

}