import { ref, reactive, onMounted } from "vue";
import { getCarList, editCarInfo, DeleteCar } from "@/apis/admin";

export function useCarGl() {
  // 汽车列表
  const carList = ref([]);

  // 修改汽车
  const show = ref(false);

  const carInfo = reactive({
    carAddress: "",
    carBrand: "",
    carBsx: "",
    carId: 0,
    carImg: "",
    carInsureTime: "",
    carKm: "",
    carOil: "",
    carOldPrice: "",
    carPf: "",
    carPl: "",
    carPrice: "",
    carSeries: "",
    carSpTime: "",
    carYear: "",
    carIsMb: "",
  });

  // 获取汽车列表
  const getAllCarList = async () => {
    console.log("获取汽车列表");
    const res = await getCarList();
    carList.value = res.data;
    console.log(res);
  };

  // 点击某个汽车
  const showCarInfo = (i) => {
    console.log(i);
    Object.assign(carInfo, i);
    show.value = true;
  };

  // 点击修改按钮
  const editcarinfobtn = async () => {
    // console.log(carInfo);
    console.log("修改按钮");
    const res = await editCarInfo(carInfo);
    if (res.data == 1) {
      getAllCarList();
      show.value = false;
    }
  };

  // 删除按钮
  const deletecarbycarid = async () => {
    console.log("删除", carInfo.carId);
    const res = await DeleteCar(carInfo.carId);
    if (res.data >= 1) {
      getAllCarList();
      show.value = false;
    }
  };

  onMounted(() => {
    getAllCarList();
  });

  return {
    carList,
    show,
    showCarInfo,
    editcarinfobtn,
    deletecarbycarid,
    carInfo,
  };
}
