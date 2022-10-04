import Vue from 'vue'
import VueRouter from 'vue-router'
// コーヒー投稿一覧(ホーム画面)
import CoffeeHome from '../pages/CoffeeHome.vue'
// コーヒーページ
import CoffeeCreate from '../pages/CoffeeCreate.vue'
// コーヒー投稿編集
import CoffeeEdit from '../pages/CoffeeEdit.vue'
// 新規登録・ログインページ
import Signup from '../pages/Signup.vue'
import Signin from '../pages/Signin.vue'
// ユーザーマイページ
import UserMypage from '../pages/UserMypage.vue'

Vue.use(VueRouter)

export default new VueRouter( {
  mode: 'history',
  routes: [
  { path: '/', name: 'CoffeeHome', component: CoffeeHome },
  { path: '/create', name: 'CoffeeCreate', component: CoffeeCreate },
  { path: '/edit/:id', name: 'CoffeeEdit', component: CoffeeEdit },
  { path: '/signup', name: 'Signup', component: Signup },
  { path: '/signin', name: 'Signin', component: Signin },
  { path: '/users', name: 'UserMypage', component: UserMypage }
  ]
});

