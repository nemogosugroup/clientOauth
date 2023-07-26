require('./bootstrap');
// import BootstrapVue from 'bootstrap-vue';
import {  createApp } from 'vue';
// import Vuex from 'vuex';
import App from './App.vue';
import SimpleTypeahead from 'vue3-simple-typeahead';
import 'vue3-simple-typeahead/dist/vue3-simple-typeahead.css'; //Optional default CSS
const app = createApp(App);
app.use(SimpleTypeahead);
import {BootstrapVue3} from 'bootstrap-vue-3';
// import 'bootstrap/scss/bootstrap.scss';
import 'bootstrap-vue-3/dist/bootstrap-vue-3.css';
// import 'vue3-toastify/dist/vue3-toastify.css';
import router from './router/index';
import config from './config';
import VueAxios from 'vue-axios';
import axios from 'axios';
import { store } from './store/store';
import Swal from 'sweetalert2';

import { toast } from 'vue3-toastify';
import 'vue3-toastify/dist/index.css';



app.config.globalProperties.$swal = Swal;
app.config.globalProperties.$config = config;
app.config.globalProperties.$toast = toast;
// app.use(Vuex);
app.use(VueAxios, axios);
app.use(store);
app.use(BootstrapVue3);
// app.use(toast);
app.use(router).mount('#app');

const accessToken = localStorage.getItem('accessToken');
if (accessToken) {
  store.commit('changeAccessToken', accessToken);
}
const infoUser = localStorage.getItem('infoUser');
if (infoUser) {
  store.commit('changeInfoUser', infoUser);
}