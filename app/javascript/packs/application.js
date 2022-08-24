require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import Vue from 'vue'
import App from './App.vue'
import router from '../router/router.js'
import store from '../store/store.js'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import VueAxios from 'vue-axios'
import { securedAxiosInstance, plainAxiosInstance } from '../backend/axios/axios.js'

Vue.use(Vuetify)
const vuetify = new Vuetify();

Vue.config.productionTip = false
Vue.use(VueAxios, {
  secured: securedAxiosInstance,
  plain: plainAxiosInstance
})

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    store,
    vuetify,
    securedAxiosInstance,
    plainAxiosInstance,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
