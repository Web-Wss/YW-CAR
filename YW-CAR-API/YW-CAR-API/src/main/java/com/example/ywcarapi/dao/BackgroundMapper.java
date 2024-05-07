package com.example.ywcarapi.dao;

import com.example.ywcarapi.model.Car;
import com.example.ywcarapi.model.CarImg;
import com.example.ywcarapi.model.Lxfs;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BackgroundMapper {

    //    车辆入库
    Integer AddCar(Car car);
    //    车辆其他图片
    Integer AddCarImg(CarImg carImg);


    //    修改汽车信息
    Integer EditCarInfo(Car car);

    //    获取汽车列表
    List<Car> GetCarList();

    //    删除汽车
//    根据汽车id获取汽车正脸图片地址
    String GetCarImgPathByCarId(Integer carId);
    //    根据汽车id获取汽车其他图片地址
    List<CarImg> GetCarOtherImgPath(Integer carId);

    //    删除本地数据库数据
    Integer DeleteCarInfoByCarId(Integer carId);
    Integer DeleteCarInfoByCarId1(Integer carId);


    //    修改联系方式
    Integer EditLxfs(Lxfs lxfs);

    //    添加联系方式
    Integer AddLx(Lxfs lxfs);

    //    删除联系人
    Integer DeleteLx(@Param("lxId")Integer lxId);
}
