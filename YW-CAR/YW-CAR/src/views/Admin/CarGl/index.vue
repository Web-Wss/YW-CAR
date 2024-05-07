<script setup>
import { useCarGl } from "./composables/useCarGl";
import { ref } from "vue";

const {
  carList,
  show,
  showCarInfo,
  editcarinfobtn,
  deletecarbycarid,
  carInfo,
} = useCarGl();

// 燃油类型
const columns = [
  { text: "汽油", value: "汽油" },
  { text: "柴油", value: "柴油" },
  { text: "电车", value: "电车" },
  { text: "油电混合", value: "油电混合" },
];
const showPicker = ref(false);
const onConfirm = ({ selectedOptions }) => {
  showPicker.value = false;
  carInfo.carOil = selectedOptions[0].text;
};
// 变速箱
const columns1 = [
  { text: "手动", value: "手动" },
  { text: "自动", value: "自动" },
  { text: "手自一体", value: "手自一体" },
];
const showPicker1 = ref(false);
const onConfirm1 = ({ selectedOptions }) => {
  showPicker1.value = false;
  carInfo.carBsx = selectedOptions[0].text;
};
// 排放
const columns2 = [
  { text: "国Ⅵ", value: "国Ⅵ" },
  { text: "国Ⅴ", value: "国Ⅴ" },
  { text: "国Ⅳ", value: "国Ⅳ" },
  { text: "国Ⅲ", value: "国Ⅲ" },
  { text: "国Ⅱ", value: "国Ⅱ" },
  { text: "国Ⅰ", value: "国Ⅰ" },
];
const showPicker2 = ref(false);
const onConfirm2 = ({ selectedOptions }) => {
  showPicker2.value = false;
  carInfo.carPf = selectedOptions[0].text;
};
// 保险到期时间
const showPicker3 = ref(false);
const currentDate = ref(["2024", "01"]);
const columnsType = ["year", "month"];
const minDate = new Date(2024, 0, 1);
const maxDate = new Date(2030, 5, 1);
const onConfirm3 = () => {
  showPicker3.value = false;
  carInfo.carInsureTime = currentDate.value.toString();
};
// 是否面包车
const columns4 = [
  { text: "是", value: "1" },
  { text: "否", value: "0" },
];
const showPicker4 = ref(false);
const onConfirm4 = ({ selectedOptions }) => {
  showPicker4.value = false;
  carInfo.carIsMb = selectedOptions[0].value;
};
</script>

<template>
  <div class="cargl">
    <van-divider
      :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }"
    >
      车辆管理
    </van-divider>
    <!-- 汽车列表 -->
    <van-grid :gutter="16" icon-size="100px">
      <van-grid-item
        v-for="i in carList"
        @click="showCarInfo(i)"
        :icon="'http://' + i.carImg"
        :text="
          '编号:' +
          i.carId +
          '-' +
          i.carBrand +
          '-' +
          i.carSeries +
          '-' +
          i.carYear +
          '年'
        "
        :key="i.carId"
      />
    </van-grid>

    <!-- 编辑车辆 -->
    <van-dialog
      v-model:show="show"
      title="编辑车辆"
      show-cancel-button
      confirmButtonText="修改"
      @confirm="editcarinfobtn"
    >
      <div class="scrollable-content">
        <van-cell-group>
          <van-field label="汽车id" v-model="carInfo.carId" disabled />
          <van-field
            v-model="carInfo.carBrand"
            label="汽车品牌"
            placeholder="请输入汽车品牌"
          />

          <van-field
            v-model="carInfo.carSeries"
            label="汽车系列"
            placeholder="请输入汽车系列"
          />

          <van-field
            v-model="carInfo.carYear"
            label="汽车年份(年)"
            placeholder="请输入汽车年份"
          />
          <van-field
            v-model="carInfo.carPl"
            label="排量(L)"
            placeholder="请输入汽车排量"
          />
          <!-- <van-field
            v-model="carInfo.carOil"
            label="燃油"
            placeholder="请输入燃油"
          /> -->
          <van-field
            v-model="carInfo.carOil"
            is-link
            readonly
            label="燃油类型"
            placeholder="选择燃油类型"
            @click="showPicker = true"
          />
          <van-popup v-model:show="showPicker" round position="bottom">
            <van-picker
              :columns="columns"
              @cancel="showPicker = false"
              @confirm="onConfirm"
            />
          </van-popup>
          <!-- <van-field
            v-model="carInfo.carBsx"
            label="变速箱"
            placeholder="请输入变速箱"
          /> -->
          <van-field
            v-model="carInfo.carBsx"
            is-link
            readonly
            label="变速箱"
            placeholder="选择变速箱类型"
            @click="showPicker1 = true"
          />
          <van-popup v-model:show="showPicker1" round position="bottom">
            <van-picker
              :columns="columns1"
              @cancel="showPicker1 = false"
              @confirm="onConfirm1"
            />
          </van-popup>
          <!-- <van-field
            v-model="carInfo.carPf"
            label="排放"
            placeholder="请输入汽车排放"
          /> -->
          <van-field
            v-model="carInfo.carPf"
            is-link
            readonly
            label="排放标准"
            placeholder="选择排放标准"
            @click="showPicker2 = true"
          />
          <van-popup v-model:show="showPicker2" round position="bottom">
            <van-picker
              :columns="columns2"
              @cancel="showPicker2 = false"
              @confirm="onConfirm2"
            />
          </van-popup>
          <van-field
            v-model="carInfo.carSpTime"
            label="上牌时间(年)"
            placeholder="请输入汽车上牌时间"
          />
          <van-field
            v-model="carInfo.carKm"
            label="公里数(KM)"
            placeholder="请输入汽车公里数"
          />

          <van-field
            v-model="carInfo.carAddress"
            label="地址"
            placeholder="请输入汽车所在地"
          />
          <van-field
            v-model="carInfo.carPrice"
            label="售价(万)"
            placeholder="请输入汽车售价"
          />
          <van-field
            v-model="carInfo.carOldPrice"
            label="指导价(万)"
            placeholder="请输入汽车指导价"
          />
          <!-- <van-field
            v-model="carInfo.carInsureTime"
            label="保险到期时间"
            placeholder="请输入保险到期时间"
          /> -->
          <van-field
            v-model="carInfo.carInsureTime"
            is-link
            readonly
            label="保险到期时间"
            placeholder="选择保险到期时间"
            @click="showPicker3 = true"
          />
          <van-popup v-model:show="showPicker3" round position="bottom">
            <van-date-picker
              v-model="currentDate"
              title="选择年月"
              :min-date="minDate"
              :max-date="maxDate"
              :columns-type="columnsType"
              @confirm="onConfirm3"
            />
          </van-popup>
          <!-- <van-field
            v-model="carInfo.carIsMb"
            label="是否面包车"
            placeholder="是则输入1，不是则输入0"
          /> -->
          <van-field
            v-model="carInfo.carIsMb"
            is-link
            readonly
            required
            label="是否面包车"
            placeholder="选额是或否"
            @click="showPicker4 = true"
          />
          <van-popup v-model:show="showPicker4" round position="bottom">
            <van-picker
              :columns="columns4"
              @cancel="showPicker4 = false"
              @confirm="onConfirm4"
            />
          </van-popup>
        </van-cell-group>
      </div>

      <div style="text-align: center">
        <van-button type="danger" @click="deletecarbycarid()"
          >删除该车辆</van-button
        >
      </div>
    </van-dialog>
  </div>
</template>

<style scoped>
.scrollable-content {
  overflow-y: auto;
  max-height: 300px; /* 适当设置最大高度，以便启用滚动 */
}
</style>
