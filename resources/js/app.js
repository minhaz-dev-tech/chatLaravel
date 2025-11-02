import { createApp } from 'vue';
import axios from 'axios';
import router from './router';
import App from './App.vue';

// Axios setup
axios.defaults.baseURL = '/api';
axios.interceptors.request.use(config => {
  const token = localStorage.getItem('access_token_employer');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

const app = createApp(App);

app.use(router);
app.config.globalProperties.$axios = axios;
app.mount('#app');
