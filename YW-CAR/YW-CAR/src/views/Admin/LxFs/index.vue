<script setup>
import { onMounted, ref } from "vue";
import { getPhone } from "@/apis/car";
import { ediLx, addLx, deleteLx } from "@/apis/admin";

const lxfsId = ref(0);
const show = ref(false);
const name = ref("");
const tel = ref("");
const currentContact = ref([]);

// 获取联系方式
const getPhoneList = async () => {
  const res = await getPhone();
  currentContact.value = res.data;
};

// 新增联系人
const show1 = ref(false);
const onAdd = () => (show1.value = true);
const addBtn = async () => {
  const res = await addLx(name.value, tel.value);
  console.log(res);
  if (res.data == 1) {
    getPhoneList();
    show1.value = false;
  }
};

// 修改联系方式
const onEdit = (i) => {
  console.log(i);
  lxfsId.value = i.lxfsId;
  name.value = i.name;
  tel.value = i.tel;
  show.value = true;
};

// 编辑提交按钮
const editlxfs = async () => {
  console.log("修改");
  const res = await ediLx(lxfsId.value, name.value, tel.value);
  console.log(res);
  if (res.data == 1) {
    getPhoneList();
    show.value = false;
  }
};

onMounted(() => {
  getPhoneList();
});

// 删除联系人
const deleteLxr = async () => {
  const res = await deleteLx(lxfsId.value);
  console.log(res);
  if (res.data == 1) {
    getPhoneList();
    show.value = false;
  }
};
</script>

<template>
  <div class="LxFs">
    <!-- 新增联系人 -->
    <van-contact-card type="add" @click="onAdd" />

    <!-- 联系列表 -->
    <van-divider
      :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }"
    >
      联系方式,点击可修改
    </van-divider>
    <van-contact-card
      v-for="i in currentContact"
      :key="i.id"
      type="edit"
      :name="i.name"
      :tel="i.tel"
      @click="onEdit(i)"
    />

    <!-- 弹框 -->
    <van-dialog
      v-model:show="show"
      title="编辑联系方式"
      show-cancel-button
      @confirm="editlxfs()"
    >
      <van-field v-model="name" required label="称呼" />
      <van-field v-model="tel" required label="手机号" />
      <div class="btn">
        <van-button type="danger" @click="deleteLxr">删除该联系人</van-button>
      </div>
    </van-dialog>

    <van-dialog
      v-model:show="show1"
      title="新增联系人"
      show-cancel-button
      @confirm="addBtn()"
    >
      <van-field v-model="name" required label="称呼" />
      <van-field v-model="tel" required label="手机号" />
    </van-dialog>
  </div>
</template>

<style scoped>
.btn {
  margin: 50px 0;
  text-align: center;
}
</style>
