package com.example.ywcarapi.service;

import com.example.ywcarapi.model.Car;
import com.example.ywcarapi.model.Lxfs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {

    //    获取汽车列表
    List<Car> GetCarList();

    //    获取联系方式
    List<Lxfs> GetLxfs();

//    根据筛选id获取车辆列表
    List<Car>GetSxCarList(@Param("sxId")Integer sxId);

//    模糊搜索
    List<Car>SearchCar(@Param("search")String search);

//    根据车辆id获取车辆详情
    Car getCarDetail(@Param("carId")Integer carId);

}
