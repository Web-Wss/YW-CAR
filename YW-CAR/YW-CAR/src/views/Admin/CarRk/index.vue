<script setup>
import { reactive, ref, toRefs } from "vue";
import { useCarRk } from "./composables/useCarRk";

const { carInfoRef, file, filelist, afterRead, afterRead1, carpublish } =
  useCarRk();

const {
  brandName,
  seriesName,
  year,
  pl,
  oil,
  bsx,
  pf,
  spTime,
  km,
  address,
  price,
  oldPrice,
  insureTime,
  mb,
} = carInfoRef;

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
  oil.value = selectedOptions[0].text;
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
  bsx.value = selectedOptions[0].text;
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
  pf.value = selectedOptions[0].text;
};
// 保险到期时间
const showPicker3 = ref(false);
const currentDate = ref(["2024", "01"]);
const columnsType = ["year", "month"];
const minDate = new Date(2024, 0, 1);
const maxDate = new Date(2030, 5, 1);
const onConfirm3 = () => {
  showPicker3.value = false;
  insureTime.value = currentDate.value.toString();
};
// 是否面包车
const columns4 = [
  { text: "是", value: "1" },
  { text: "否", value: "0" },
];
const showPicker4 = ref(false);
const onConfirm4 = ({ selectedOptions }) => {
  showPicker4.value = false;
  mb.value = selectedOptions[0].value;
};
</script>

<template>
  <div class="carrk">
    <van-divider
      :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }"
    >
      车辆入库
    </van-divider>
    <van-cell-group>
      <van-field
        label="品牌"
        v-model="brandName"
        placeholder="例如:奥迪"
        required
      />

      <van-field
        label="型号"
        v-model="seriesName"
        placeholder="例如:A6L"
        required
      />

      <van-field
        v-model="year"
        label="哪一年车"
        placeholder="例如:2024"
        required
      >
      </van-field>
      <van-field v-model="pl" label="排量" placeholder="例如:2.0" />
      <!-- <van-field v-model="oil" label="燃油类型" placeholder="例如:汽油" /> -->
      <van-field
        v-model="oil"
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
      <!-- <van-field v-model="bsx" label="变速箱" placeholder="例如:手动" /> -->
      <van-field
        v-model="bsx"
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
      <!-- <van-field v-model="pf" label="排放" placeholder="例如:国Ⅴ" />
       -->
      <van-field
        v-model="pf"
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
        v-model="spTime"
        label="上牌时间(年)"
        placeholder="例如:2024"
      />
      <van-field v-model="km" label="公里数(KM)" placeholder="例如:12345" />
      <van-field v-model="address" label="车辆所在地" placeholder="例如:苏州" />
      <van-field
        v-model="price"
        label="售价(万)"
        placeholder="例如:12.5万，填写1250"
        required
      />
      <van-field
        v-model="oldPrice"
        label="指导价(万)"
        required
        placeholder="例如:35.5，填写3550"
      />
      <!-- <van-field
        v-model="insureTime"
        label="保险到期时间"
        placeholder="例如:2024年5月"
      /> -->
      <van-field
        v-model="insureTime"
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
        v-model="mb"
        label="是否面包车"
        required
        placeholder="是则输入1，不是则输入0"
      /> -->
      <van-field
        v-model="mb"
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
      <van-field label="汽车正脸图片" required disabled />
      <!-- 上传图片 -->
      <van-uploader
        upload-text="限1张(<=10MB)"
        :max-count="1"
        :after-read="afterRead"
        preview-size="120"
        v-model="file"
        multiple
      />
      <van-field label="汽车其他图片" required disabled />
      <!-- 上传图片 -->
      <van-uploader
        upload-text="限8张(<=10MB)"
        :max-count="8"
        :after-read="afterRead1"
        preview-size="120"
        v-model="filelist"
        multiple
      />
    </van-cell-group>

    <!-- 上传按钮 -->
    <div style="text-align: center">
      <van-button type="success" @click="carpublish">车辆入库提交</van-button>
    </div>
  </div>
</template>

<style scoped lang="scss">
@import url("./css/index.scss");
</style>
