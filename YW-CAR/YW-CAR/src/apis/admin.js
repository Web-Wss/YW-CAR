import request from "@/utils/http";

// 登录
export const userLogin = (user) => {
  return request({
    url: "/login",
    method: "POST",
    params: user,
  });
};

// 车辆入库
export const addCar = (formData) => {
  return request.post("/background/addcar", formData);
};

// 获取汽车列表
export const getCarList = () => {
  return request("/background/getcarlist");
};

// 编辑汽车
export const editCarInfo = (car) => {
  return request({
    url: "/background/editcarinfo",
    method: "POST",
    data: {
      car,
    },
  });
};

// 删除汽车
export const DeleteCar = (carId) => {
  return request({
    url: "/background/deletecar",
    method: "POST",
    params: {
      carId,
    },
  });
};

// 修改联系方式
export const ediLx = (lxId, name, tel) => {
  return request({
    url: "/background/editlx",
    method: "POST",
    params: {
      lxId,
      name,
      tel,
    },
  });
};

// 新增联系人
export const addLx = (name, tel) => {
  return request({
    url: "/background/addlx",
    method: "POST",
    params: {
      name,
      tel,
    },
  });
};

// 删除联系人
export const deleteLx = (lxId) => {
  return request({
    url: "/background/deletelx",
    method: "POST",
    params: {
      lxId,
    },
  });
};
