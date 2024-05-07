package com.example.ywcarapi.service.impl;

import com.example.ywcarapi.dao.UserMapper;
import com.example.ywcarapi.model.Car;
import com.example.ywcarapi.model.Lxfs;
import com.example.ywcarapi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper useMapper;

    @Override
    public List<Car> GetCarList() {
        return useMapper.GetCarList();
    }

    @Override
    public List<Lxfs> GetLxfs() {
        return useMapper.GetLxfs();
    }

    @Override
    public List<Car> GetSxCarList(Integer sxId) {
        List<Car> cars = null;
        if (sxId == 1){
//            获取全部车辆
            cars = useMapper.GetCarList();
        } else if (sxId == 2) {
            cars = useMapper.GetSxCarList(sxId);
        } else if (sxId == 3) {
            cars = useMapper.GetSxCarList(sxId);
        } else if (sxId == 4) {
            cars = useMapper.GetSxCarList(sxId);
        } else if (sxId == 5) {
            cars = useMapper.GetSxCarList(sxId);
        } else if (sxId == 6) {
            cars = useMapper.GetSxCarList(sxId);
        } else if (sxId == 7) {
            cars = useMapper.GetSxCarList(sxId);
        } else if (sxId == 8) {
            cars = useMapper.GetSxCarList(sxId);
        }
        return cars;
    }

    @Override
    public List<Car> SearchCar(String search) {
        return useMapper.SearchCar(search);
    }

    @Override
    public Car getCarDetail(Integer carId) {
        return useMapper.getCarDetail(carId);
    }
}
