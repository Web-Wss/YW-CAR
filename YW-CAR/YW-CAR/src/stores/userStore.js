// 管理用户数据
import { defineStore } from "pinia";
import { ref } from "vue";
import { userLogin } from "@/apis/admin";
import { useRouter } from "vue-router";

export const useUserStore = defineStore(
  "user",
  () => {
    // 定义用户数据 - state
    const userInfo = ref([]);
    const router = useRouter();

    // 定义获取数据的函数 - action
    const getUserInfo = async (user) => {
      const res = await userLogin(user);
      console.log(res);
      if (res.code == 200) {
        showNotify({ type: "success", message: "登录成功" });
        userInfo.value = res.data;
        router.push("/adminhome");
      } else {
        showNotify({ type: "danger", message: "登录失败，请重新登录！" });
      }
    };

    // 退出登录
    const clearUserInfo = () => {
      userInfo.value = {};
    };

    return {
      userInfo,
      getUserInfo,
      clearUserInfo,
    };
  },
  {
    persist: true,
  }
);
