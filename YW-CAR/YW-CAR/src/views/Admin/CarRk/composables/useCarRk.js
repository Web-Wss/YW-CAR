import { addCar } from "@/apis/admin";
import { reactive, toRefs, ref } from "vue";
import { useRouter } from "vue-router";

export function useCarRk() {
  const reouter = useRouter();

  const carInfo = reactive({
    brandName: "",
    seriesName: "",
    year: "",
    pl: "",
    oil: "",
    bsx: "",
    pf: "",
    spTime: "",
    km: "",
    address: "",
    price: "",
    oldPrice: "",
    insureTime: "",
    mb: "",
  });
  const carInfoRef = toRefs(carInfo);
  const file = ref([]);
  const filelist = ref([]);

  const formData = new FormData();
  const afterRead = (file) => {
    // formData.append("file", file.file);
  };
  const afterRead1 = (file) => {
    // file.forEach((item) => {
    //   formData.append("files", item.file);
    // });
  };
  const carpublish = async () => {
    if (file.value.length !== 0 && filelist.value.length !== 0) {
      formData.append("file", file.value[0].file);
      filelist.value.forEach((item) => {
        formData.append("files", item.file);
      });
    }
    formData.append("brandName", carInfo.brandName);
    formData.append("seriesName", carInfo.seriesName);
    formData.append("year", carInfo.year);
    formData.append("pl", carInfo.pl);
    formData.append("oil", carInfo.oil);
    formData.append("bsx", carInfo.bsx);
    formData.append("pf", carInfo.pf);
    formData.append("spTime", carInfo.spTime);
    formData.append("km", carInfo.km);
    formData.append("address", carInfo.address);
    formData.append("price", carInfo.price);
    formData.append("oldPrice", carInfo.oldPrice);
    formData.append("insureTime", carInfo.insureTime);
    formData.append("mb", carInfo.mb);
    // 判断必填项是否全部填写
    if (
      carInfo.brandName == "" ||
      carInfo.seriesName == "" ||
      carInfo.year == "" ||
      carInfo.price == "" ||
      carInfo.oldPrice == "" ||
      carInfo.mb == "" ||
      file.value.length == 0 ||
      filelist.value.length == 0
    ) {
      // 提示未填
      showNotify({ type: "warning", message: "有必填项未填写" });
    } else {
      console.log("发请求", formData);
      const res = await addCar(formData);
      console.log(res);
      if (res.data == 1) {
        reouter.push("/cargl");
      }
    }
  };

  return {
    carInfoRef,
    file,
    filelist,
    afterRead,
    afterRead1,
    carpublish,
  };
}
