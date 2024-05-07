import { onMounted, reactive, ref } from "vue";
import {
  getCarList,
  getSearchCarList,
  getSxCarList,
  getPhone,
} from "@/apis/car";

export function useCarFun() {
  // 当前筛选位置
  const currentIndex = ref(1);
  // 定义筛选列表数据
  const sxList = ref([
    {
      id: 1,
      text: "全部车源",
    },
    {
      id: 2,
      text: "面包拉货",
    },
    {
      id: 3,
      text: "千元练手",
    },
    {
      id: 4,
      text: "手动挡",
    },
    {
      id: 5,
      text: "1-5万",
    },
    {
      id: 6,
      text: "5-10万",
    },
    {
      id: 7,
      text: "10-20万",
    },
    {
      id: 8,
      text: "20万以上",
    },
  ]);
  // 汽车列表
  const carList = ref([]);
  // 搜索数据
  const search = ref("");
  const searchBtn = async () => {
    const res = await getSearchCarList(search.value);
    carList.value = res.data;
  };

  // 筛选按钮点击
  const sxBtn = async (id) => {
    console.log("点击了", id);
    if (id === currentIndex.value) {
      // 不发请求
    } else {
      currentIndex.value = id;
      // 获取筛选后的汽车列表
      const res = await getSxCarList(id);
      console.log(res);
      carList.value = res.data;
      document.documentElement.scrollTop = 240;
    }
  };

  // 获取车辆列表
  const getAllCarList = async () => {
    const res = await getCarList();
    console.log(res);
    carList.value = res.data;
  };
  // 电话
  const show = ref(false);
  const currentContact = ref([]);
  // 获取电话列表
  const getPhoneList = async () => {
    const res = await getPhone();
    console.log(res);
    currentContact.value = res.data;
  };
  const tels = ref(null);
  const showTel = () => {
    show.value = true;
  };
  const call = (tel) => {
    console.log("打电话");
    console.log(tels);
    tels.value.href = `tel:${tel}`;
    tels.value.click();
  };

  onMounted(() => {
    getAllCarList();
    getPhoneList();
  });

  return {
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
  };
}
