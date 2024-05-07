<script setup>
import { useCarDetail } from "./composables/useCarDetail";

const { carInfo, goBack, show, index, images, onChange, showImg } =
  useCarDetail();
</script>

<template>
  <div class="header">
    <!-- 头部 -->
    <van-nav-bar placeholder @click-left="goBack">
      <template #left>
        <span class="header_wz"><b>返回</b></span>
      </template>
      <template #title>
        <!-- <input type="text" placeholder="搜索您想看的车" v-model="search" /> -->
        <span class="header_wz"><b>车辆详情</b></span>
      </template>
      <template #right>
        <span class="header_wz">电话联系</span>
      </template>
    </van-nav-bar>
  </div>
  <!-- 汽车图片轮播 -->
  <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
    <van-swipe-item v-for="i in carInfo.carImgList" :key="i.carImgPath">
      <img :src="'http://' + i.carImgPath" alt=""
    /></van-swipe-item>
  </van-swipe>
  <div class="detail">
    <!-- 背景图 -->
    <div class="detailbg">
      <img src="@/assets/detailbg.png" alt="" srcset="" />
      <!-- 多边形 -->
      <div class="dbx">
        <img src="@/assets/jx.png" alt="" srcset="" />
        <div class="priceinfo">
          <div class="price">
            <b>{{ carInfo.carPrice / 100 }}万</b
            ><span>指导价:{{ carInfo.carOldPrice / 100 }}万</span>
          </div>
          <div class="dec">
            <img
              src="https://image-pub.guazistatic.com/qnbdp169063153510605af1bbb3439d9bda0b515e3146a51066.png"
              alt=""
            />价格超值
          </div>
        </div>
      </div>
    </div>
    <div class="content">
      <div class="innerbox">
        <!-- 汽车品牌等信息 -->
        <div class="name">
          {{ carInfo.carBrand }} {{ carInfo.carSeries }} {{ carInfo.carYear }}款
        </div>

        <van-grid :border="true" :column-num="3">
          <van-grid-item>
            <div class="top">排量</div>
            <div class="bottom">{{ carInfo.carPl }}</div>
          </van-grid-item>
          <van-grid-item>
            <div class="top">燃油类型</div>
            <div class="bottom">{{ carInfo.carOil }}</div>
          </van-grid-item>
          <van-grid-item>
            <div class="top">变速箱</div>
            <div class="bottom">{{ carInfo.carBsx }}</div>
          </van-grid-item>
          <van-grid-item>
            <div class="top">排放</div>
            <div class="bottom">{{ carInfo.carPf }}</div>
          </van-grid-item>
          <van-grid-item>
            <div class="top">上牌时间</div>
            <div class="bottom">{{ carInfo.carSpTime }}</div>
          </van-grid-item>
          <van-grid-item>
            <div class="top">公里数</div>
            <div class="bottom">{{ carInfo.carKm }}</div>
          </van-grid-item>
        </van-grid>
      </div>
    </div>
    <!-- 实拍列表 -->
    <div class="carimglist">
      <!-- 车辆实拍 -->
      <van-divider
        :style="{
          color: '#ff874b',
          borderColor: '#ff874b',
          padding: '0 16px',
        }"
      >
        车辆实拍
      </van-divider>
      <img
        v-for="(item, index) in carInfo.carImgList"
        @click="showImg(index)"
        :src="'http://' + item.carImgPath"
        alt=""
      />
    </div>
  </div>

  <!-- 图片预览组件 -->
  <van-image-preview v-model:show="show" :images="images" @change="onChange">
    <template v-slot:index>第{{ index + 1 }}张</template>
  </van-image-preview>
</template>

<style scoped lang="scss">
@import url("./css/index.scss");
</style>
