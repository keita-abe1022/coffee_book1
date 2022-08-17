import Vue from 'vue'
import VueRouter from 'vue-router'
import CoffeeHome from '../pages/CoffeeHome.vue'

Vue.use(VueRouter)

export default new VueRouter( {
  mode: 'history',
  routes: [
  { path: '/', name: 'CoffeeHome', component: CoffeeHome },
  { path: '/create', name: 'CoffeeCreate', component: CoffeeCreate },
  ],
});
