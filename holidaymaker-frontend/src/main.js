import { createApp } from "vue";
import App from "./App.vue";

import router from "./router";
import store from "./store";

import StarRating from './components/StarRating.vue'
export default StarRating

createApp(App).use(store).use(router).mount("#app");
