import { onMounted, ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { getCarDetail } from "@/apis/car";
export function useCarDetail() {
  const route = useRoute();
  const router = useRouter();
  // 车辆详情
  const carInfo = ref({});
  // 图片预览
  const images = ref([]);
  const show = ref(false);
  const index = ref(0);
  const onChange = (newIndex) => {
    index.value = newIndex;
  };
  const showImg = (index1) => {
    index.value = index1;
    show.value = true;
  };
  // 获取车辆信息
  const getCarInfo = async (carId) => {
    const res = await getCarDetail(carId);
    console.log(res);
    carInfo.value = res.data;
    for (let i = 0; i < res.data.carImgList.length; i++) {
      images.value.push("http://" + res.data.carImgList[i].carImgPath);
    }
  };

  // 回退
  const goBack = () => {
    router.back();
  };

  onMounted(() => {
    getCarInfo(route.params.id);
  });

  return {
    carInfo,
    goBack,
    show,
    index,
    images,
    onChange,
    showImg,
  };
}
