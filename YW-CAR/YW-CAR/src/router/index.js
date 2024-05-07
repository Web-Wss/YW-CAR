import { createRouter, createWebHistory } from "vue-router";
// 用户端
import UserHome from "@/views/User/UserHome/index.vue";
import CarDetail from "@/views/User/CarDetail/index.vue";

import Login from "@/views/Login/index.vue";
import AdminHome from "@/views/Admin/AdminHome/index.vue";
import CarRk from "@/views/Admin/CarRk/index.vue";
import CarGl from "@/views/Admin/CarGl/index.vue";
import LxFs from "@/views/Admin/LxFs/index.vue";
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      component: UserHome,
    },
    {
      path: "/login",
      component: Login,
    },
    {
      path: "/cardetail/:id",
      component: CarDetail,
    },

    {
      path: "/adminhome",
      component: AdminHome,
    },
    {
      path: "/carrk",
      component: CarRk,
    },
    {
      path: "/cargl",
      component: CarGl,
    },
    {
      path: "/lxfs",
      component: LxFs,
    },
  ],
});

export default router;
