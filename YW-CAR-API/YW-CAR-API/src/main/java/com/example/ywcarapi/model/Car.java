package com.example.ywcarapi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class Car {

    private Integer carId;
    private String carBrand;
    private String carSeries;
    private String carYear;
    private String carPl;
    private String carOil;
    private String carBsx;
    private String carPf;
    private String carSpTime;
    private String carKm;
    private String carAddress;
    private Integer carPrice;
    private Integer carOldPrice;
    private String carInsureTime;
    private String carImg;
    private Integer carIsMb;

    private List<CarImg> carImgList;


}