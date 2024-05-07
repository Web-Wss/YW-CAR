package com.example.ywcarapi.controller;

import com.example.ywcarapi.model.Car;
import com.example.ywcarapi.model.Lxfs;
import com.example.ywcarapi.model.Result;
import com.example.ywcarapi.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

//    获取车辆列表
    @GetMapping("/getcarlist")
    public Result getCarList(){
        Result result = new Result();
        List<Car> cars = userService.GetCarList();
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("获取所有车辆数据");
        result.setData(cars);
        return result;
    }

//    获取电话列表
    @GetMapping("/getphonelist")
    public Result GetPhoneList(){
        Result result = new Result();
        List<Lxfs> lxfs = userService.GetLxfs();
        result.setSuccess(true);
        result.setCode(200);
        result.setMsg("获取联系方式");
        result.setData(lxfs);
        return result;
    }

//    获取筛选列表根据筛选id
    @PostMapping("/getsxcarlist")
    public Result GetSxCarList(@RequestBody Map<String,Integer> map){
        Result result = new Result();
        int sxId = map.get("sxId");
        List<Car> cars = userService.GetSxCarList(sxId);
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("获取筛选后的车辆数据");
        result.setData(cars);
        return result;
    }

//    模糊搜索
    @PostMapping("/searchcar")
    public Result SearchCar(@RequestBody Map<String,String> map){
        Result result = new Result();
        String search = map.get("search");
        List<Car> cars = userService.SearchCar(search);
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("搜索到的车辆列表");
        result.setData(cars);
        return result;
    }

//    获取车辆详情根据车辆id
    @PostMapping("/getcardetail")
    public Result getCarDetail(@RequestBody Map<String,Integer> map){
        Result result = new Result();
        Integer carId = map.get("carId");
        Car carDetail = userService.getCarDetail(carId);
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("获取车辆详情");
        result.setData(carDetail);
        return result;
    }


}
