// axios基础封装
import axios from "axios";
import { useUserStore } from "@/stores/userStore";

const httpInstance = axios.create({
  baseURL: "/api",
  timeout: 5000,
});

// 请求拦截器
httpInstance.interceptors.request.use(
  (config) => {
    // 1. 从pinia获取token数据
    const userStore = useUserStore();
    // 2. 按照后端的要求拼接token数据
    const token = userStore.userInfo.token;
    if (token) {
      config.headers.Authorization = token;
    }

    return config;
  },
  (e) => Promise.reject(e)
);

// 响应式拦截器
httpInstance.interceptors.response.use(
  (res) => res.data,
  (e) => {
    return Promise.reject(e);
  }
);

export default httpInstance;
