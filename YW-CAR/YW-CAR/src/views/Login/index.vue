<script setup>
import { ref } from "vue";
import { useUserStore } from "@/stores/userStore";

const userStore = useUserStore();

const user = ref({
  phone: "",
  password: "",
});
// 登录按钮
const onSubmit = async () => {
  // console.log(user.value);
  await userStore.getUserInfo(user.value);
};
</script>

<template>
  <div id="login">
    <div class="logo">
      <van-image
        width="100"
        height="100"
        :src="'http://ywesc-img.webwss.cn/car/logo1.png'"
      />
      <br />
      <span>永旺二手车后台登录</span>
    </div>
    <!-- 输入康 -->
    <van-form @submit="onSubmit">
      <van-field
        v-model="user.phone"
        name="phone"
        label="手机号"
        placeholder="请输入手机号"
        :rules="[{ required: true, message: '请填写用户名' }]"
      />
      <van-field
        v-model="user.password"
        type="password"
        name="password"
        label="密码"
        placeholder="请输入密码"
        :rules="[{ required: true, message: '请填写密码' }]"
      />

      <div style="margin: 36px">
        <van-button round block type="primary" native-type="submit"
          >点击登录</van-button
        >
      </div>
    </van-form>
  </div>
</template>

<style scoped lang="scss">
@import url("./css/index.scss");
</style>
