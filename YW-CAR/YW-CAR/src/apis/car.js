import request from "@/utils/http";

// 获取汽车列表
export const getCarList = () => {
  return request({
    url: "/user/getcarlist",
  });
};

// 根据筛选id获取汽车列表
export const getSxCarList = (sxId) => {
  return request({
    url: "/user/getsxcarlist",
    method: "POST",
    data: {
      sxId,
    },
  });
};

// 模糊搜索
export const getSearchCarList = (search) => {
  return request({
    url: "/user/searchcar",
    method: "POST",
    data: {
      search,
    },
  });
};

// 获取车辆详情根据汽车id
export const getCarDetail = (carId) => {
  return request({
    url: "/user/getcardetail",
    method: "POST",
    data: {
      carId,
    },
  });
};

// 获取电话列表
export const getPhone = () => {
  return request.get("/user/getphonelist");
};
