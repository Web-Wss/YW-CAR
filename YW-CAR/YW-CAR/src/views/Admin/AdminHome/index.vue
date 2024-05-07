<script setup>
import { ref } from "vue";
import { getAssetsFile } from "@/utils/getAssetsFile";
import { useRouter } from "vue-router";
import { useUserStore } from "@/stores/userStore";

const router = useRouter();
const userStore = useUserStore();

const listData = ref([
  {
    id: 1,
    title: "车辆入库",
    icon: "a-Erukuduixiangruku.png",
    path: "carrk",
  },
  {
    id: 2,
    title: "车辆管理",
    icon: "xitongguanliyuanguanli.png",
    path: "cargl",
  },

  {
    id: 3,
    title: "联系方式",
    icon: "lianxiren.png",
    path: "lxfs",
  },
]);

// 去页面
const goPaht = (path) => {
  router.push(path);
};

// 退出登录
const clearuser = () => {
  userStore.clearUserInfo();
  router.push("/login");
};
</script>

<template>
  <div id="background">
    <van-divider
      :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }"
    >
      永旺二手车后台管理界面
    </van-divider>
    <!-- 功能列表 -->
    <div class="list">
      <div
        class="list-item"
        v-for="i in listData"
        :key="i.id"
        @click="goPaht(i.path)"
      >
        <!-- 图片 -->
        <div class="img">
          <img :src="getAssetsFile(i.icon)" alt="" />
        </div>
        <div class="title">{{ i.title }}</div>
      </div>
    </div>

    <!-- 退出登录 -->

    <div class="btn">
      <van-button type="danger" @click="clearuser">退出登录</van-button>
    </div>
  </div>
</template>

<style scoped lang="scss">
@import url("./css/index.scss");
</style>
