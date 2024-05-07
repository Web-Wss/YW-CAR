<script setup>
import { ref } from "vue";
import { useCarFun } from "./composables/useCarFun";
import { useRouter } from "vue-router";

const {
  search,
  searchBtn,
  carList,
  currentIndex,
  sxList,
  sxBtn,
  show,
  currentContact,
  call,
  tels,
  showTel,
} = useCarFun();

const router = useRouter();

// 去车辆详情
const goCarDetail = (carId) => {
  console.log(carId);
  router.push({
    path: `/cardetail/${carId}`,
  });
};
</script>

<template>
  <div class="header">
    <!-- 头部 -->
    <van-nav-bar placeholder>
      <template #left>
        <span class="header_wz"><b>永旺</b></span>
      </template>
      <template #title>
        <input
          type="text"
          placeholder="搜索您想看的车"
          v-model="search"
          @keyup.enter="searchBtn"
        />
      </template>
      <template #right>
        <span class="header_wz" @click="showTel">电话联系</span>
      </template>
    </van-nav-bar>
  </div>
  <!-- 图片底板背景 -->
  <div class="img_bottom">
    <img src="@/assets/bg.png" alt="" />
  </div>

  <!-- 好车安心购 -->
  <div class="all_car">
    <!-- 标题 -->
    <div class="cockloft-header-wrap cockloft-header-even">
      <span class="cockloft-header-text">好车安心购</span>
    </div>
    <!-- 筛选按钮 -->
    <div class="sxbtn">
      <div class="btn" v-for="i in sxList" :key="i.id">
        <van-button
          type="default"
          :class="{ active: currentIndex == i.id }"
          @click="sxBtn(i.id)"
          >{{ i.text }}</van-button
        >
      </div>
    </div>

    <!-- 车子列表 -->

    <div class="car_list" v-if="carList.length">
      <div class="list" v-for="i in carList" @click="goCarDetail(i.carId)">
        <!-- 汽车头图 -->
        <img :src="'http://' + i.carImg" alt="" />
        <!-- 品牌 型号等信息 -->
        <div class="name">
          {{ i.carBrand }} {{ i.carSeries }} {{ i.carYear }}款 {{ i.carPl }}
          {{ i.carBsx }}
        </div>
        <!-- 上牌等信息 -->
        <div class="sp">
          {{ i.carSpTime }}上牌 | {{ i.carKm }}公里 | {{ i.carAddress }}
        </div>
        <!-- 售价和指导价 -->
        <div class="price">
          <span>{{ i.carPrice / 100 }}万</span>
          <span>指导价:{{ i.carOldPrice }}万</span>
        </div>
      </div>
    </div>

    <!-- 空状态 -->
    <div v-show="carList.length == 0">
      <van-empty description="没有筛选到相关车辆" />
    </div>
  </div>

  <!-- 电话 -->
  <van-dialog
    v-model:show="show"
    title="点击拨打电话"
    confirm-button-text="取消"
  >
    <van-contact-card
      v-for="i in currentContact"
      :key="i.id"
      type="edit"
      :name="i.name"
      :tel="i.tel"
      @click="call(i.tel)"
    />
    <!--  -->
    <!-- <div class="call" @click="call">拨打电话</div> -->
    <a href="" v-show="false" ref="tels"></a>
  </van-dialog>
</template>

<style scoped lang="scss">
@import url("./css/index.scss");
</style>
