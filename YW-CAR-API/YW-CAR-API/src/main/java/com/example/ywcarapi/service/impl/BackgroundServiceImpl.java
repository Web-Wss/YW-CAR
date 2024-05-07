package com.example.ywcarapi.service.impl;

import com.example.ywcarapi.dao.BackgroundMapper;
import com.example.ywcarapi.model.Car;
import com.example.ywcarapi.model.CarImg;
import com.example.ywcarapi.model.Lxfs;
import com.example.ywcarapi.service.BackgroundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BackgroundServiceImpl implements BackgroundService {
    @Autowired
    private BackgroundMapper backgroundMapper;


    @Override
    public Integer AddCar(Car car) {
        return backgroundMapper.AddCar(car);
    }

    @Override
    public Integer AddCarImg(CarImg carImg) {
        return backgroundMapper.AddCarImg(carImg);
    }

    @Override
    public Integer EditCarInfo(Car car) {
        return backgroundMapper.EditCarInfo(car);
    }

    @Override
    public List<Car> GetCarList() {
        return backgroundMapper.GetCarList();
    }

    @Override
    public String GetCarImgPathByCarId(Integer carId) {
        return backgroundMapper.GetCarImgPathByCarId(carId);
    }

    @Override
    public List<CarImg> GetCarOtherImgPath(Integer carId) {
        return backgroundMapper.GetCarOtherImgPath(carId);
    }

    @Override
    public Integer DeleteCarInfoByCarId(Integer carId) {
        return backgroundMapper.DeleteCarInfoByCarId(carId);
    }

    @Override
    public Integer DeleteCarInfoByCarId1(Integer carId) {
        return backgroundMapper.DeleteCarInfoByCarId1(carId);
    }

    @Override
    public Integer EditLxfs(Lxfs lxfs) {
        return backgroundMapper.EditLxfs(lxfs);
    }

    @Override
    public Integer AddLx(Lxfs lxfs) {
        return backgroundMapper.AddLx(lxfs);
    }

    @Override
    public Integer DeleteLx(Integer lxId) {
        return backgroundMapper.DeleteLx(lxId);
    }


}
