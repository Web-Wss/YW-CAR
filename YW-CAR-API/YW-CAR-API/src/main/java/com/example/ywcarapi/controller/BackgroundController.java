package com.example.ywcarapi.controller;

import com.example.ywcarapi.model.*;
import com.example.ywcarapi.service.BackgroundService;
import com.example.ywcarapi.utils.QiniuUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/background")
public class BackgroundController {

    @Autowired
    private BackgroundService backgroundService;


    @PostMapping("/addcar")
    public Result AddCar(@Param("brandName")String brandName,
                             @Param("seriesName")String seriesName,
                             @Param("year")String year,
                             @Param("pl")String pl,
                             @Param("oil")String oil,
                             @Param("bsx")String bsx,
                             @Param("pf")String pf,
                             @Param("spTime")String spTime,
                             @Param("km")String km,
                             @Param("address")String address,
                             @Param("price")Integer price,
                             @Param("oldPrice")Integer oldPrice,
                             @Param("insureTime")String insureTime,
                             @Param("mb")Integer mb,

                             @Param("file")MultipartFile file,
                             @Param("files")MultipartFile[] files) throws IOException {
        Result result = new Result();
        Car car = new Car();
        CarImg carImg = new CarImg();
        Integer carId = null;
        car.setCarBrand(brandName);
        car.setCarSeries(seriesName);
        car.setCarYear(year);
        car.setCarPl(pl);
        car.setCarOil(oil);
        car.setCarBsx(bsx);
        car.setCarPf(pf);
        car.setCarSpTime(spTime);
        car.setCarKm(km);
        car.setCarAddress(address);
        car.setCarPrice(price);
        car.setCarOldPrice(oldPrice);
        car.setCarInsureTime(insureTime);
        car.setCarIsMb(mb);
        //        汽车正脸照片
        String originalFilename = file.getOriginalFilename();//获取图片原始文件名
        int index = originalFilename.lastIndexOf(".");
        String extention = originalFilename.substring(index);//获得图片后缀名  .jpg
        String fileName =  brandName + seriesName + UUID.randomUUID().toString() + extention; //进行拼接
        fileName = fileName.replace("-",""); //将文件路径中的-替换掉
        //                使用工具类将文件上传到七牛云服务器
        String filePath = QiniuUtils.upload2Qiniu(file.getBytes(),fileName);
        //        将汽车数据存入数据库并获取carId
        car.setCarImg(filePath);
        backgroundService.AddCar(car);
//        获取车辆入库后的id
        carId = car.getCarId();
        car.setCarId(carId);
        //        遍历汽车其他图片并存储到服务器和本地数据库
        for (int i = 0; i < files.length; i ++) {
            String originalFilename1 = files[i].getOriginalFilename();//获取图片原始文件名
            int index1 = originalFilename1.lastIndexOf(".");
            String extention1 = originalFilename1.substring(index1);//获得图片后缀名  .jpg
            String fileName1 = brandName + seriesName + UUID.randomUUID().toString() + extention1; //进行拼接
            fileName1 = fileName1.replace("-",""); //将文件路径中的-替换掉
            //                使用工具类将文件上传到七牛云服务器
            String filePath1 = QiniuUtils.upload2Qiniu(files[i].getBytes(),fileName1);
//            将汽车其他图片存入数据库
            carImg.setCarId(carId);
            carImg.setCarImgPath(filePath1);
            Integer integer = backgroundService.AddCarImg(carImg);
            result.setData(integer);
        }
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("车辆入库");
        return result;
    }


//    获取汽车列表
    @GetMapping("/getcarlist")
    public Result GetCarList(){
        Result result = new Result();
        List<Car> cars = backgroundService.GetCarList();
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("获取汽车列表信息");
        result.setData(cars);
        return result;
    }

//    编辑车辆信息
    @PostMapping("/editcarinfo")
    public Result EditCarInfo(@RequestBody CarDto car) {
        Result result = new Result();
        Integer integer = backgroundService.EditCarInfo(car.getCar());
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("汽车信息修改");
        result.setData(integer);
        return result;
    }

//    删除车辆
    @PostMapping("/deletecar")
    public Result DeleteCar(@Param("carId")Integer carId){
        Result result = new Result();
//        根据carId获取汽车正脸照片地址名称
        String car_img = backgroundService.GetCarImgPathByCarId(carId);
//        处理地址信息，只获取斜杠后的数据
        int index = car_img.lastIndexOf("/");
        String imgPath = car_img.substring(index + 1);//汽车正脸图片地址
        System.out.println(imgPath);
//        删除服务器图片
        QiniuUtils.deleteFileFromQiniu(imgPath);
//        根据carId获取汽车其他图片地址名称
        List<CarImg> carImgs = backgroundService.GetCarOtherImgPath(carId);
        System.out.println(carImgs);
        for (int i = 0; i < carImgs.size(); i ++) {
//            System.out.println(carImgs.get(i).getCarImgPath());
            String carotherimg = carImgs.get(i).getCarImgPath();
            int index1 = carotherimg.lastIndexOf("/");
            String imgPath1 = carotherimg.substring(index1 + 1);//汽车正脸图片地址
//            删除服务器图片
            QiniuUtils.deleteFileFromQiniu(imgPath1);
        }
//        删除本地数据库数据
        Integer integer = backgroundService.DeleteCarInfoByCarId(carId);
        Integer integer1 = backgroundService.DeleteCarInfoByCarId1(carId);
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("车辆删除成功");
        result.setData(integer + integer1);
        return result;
    }


    //    修改联系方式
    @PostMapping("/editlx")
    public Result EditLx(@Param("lxId")Integer lxId,
                         @Param("name")String name,
                         @Param("tel")String tel){
        Result result = new Result();
        Lxfs lxfs = new Lxfs();
        lxfs.setLxfsId(lxId);
        lxfs.setName(name);
        lxfs.setTel(tel);
        Integer integer = backgroundService.EditLxfs(lxfs);
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("修改联系方式");
        result.setData(integer);
        return result;
    }

//    添加联系方式
    @PostMapping("/addlx")
    public Result AddLx(@Param("name")String name,
                        @Param("tel")String tel){
        Result result = new Result();
        Lxfs lxfs = new Lxfs();
        lxfs.setName(name);
        lxfs.setTel(tel);
        Integer integer = backgroundService.AddLx(lxfs);
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("添加联系方式");
        result.setData(integer);
        return result;
    }

//    删除联系人
    @PostMapping("/deletelx")
    public Result DeleteLx(@Param("lxId")Integer lxId){
        Result result = new Result();
        Integer integer = backgroundService.DeleteLx(lxId);
        result.setCode(200);
        result.setSuccess(true);
        result.setMsg("删除联系人");
        result.setData(integer);
        return result;
    }



}
