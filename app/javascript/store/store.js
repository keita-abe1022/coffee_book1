import Vue from 'vue'
import Vuex from 'vuex'
import router from '../router/router.js'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    coffees: [],
    coffeeInfo: {},
    coffeeInfoBool: false,
    // このステートの[true/false]でログイン状態の表示如何を決定
    signedIn: '',
  },
  mutations: {
    fetchCoffees(state) {
      state.coffees = [];
      axios.get(`/api/coffees`).then((res) => {
        for(let i = 0; i < res.data.coffees.length; i++) {
          state.coffees.push(res.data.coffees[i]);
        }
      }, (error) => {
        console.log(error);
      });
    },
    setCoffeeInfo(state, { id }) {
      axios.get(`/api/coffees/${id}.json`)
      .then(res => {
        state.coffeeInfo = res.data;
        state.coffeeInfoBool = true;
      });
    },
    deleteCoffee(state, { id }) {
      axios.delete(`/api/coffees/${id}`)
      .then(res => {
        state.coffeeInfo = '';
        state.coffeeInfoBool = false;
      })
    },
    fetchSignedIn(state) {
      // ログイン時BooleanがlocalStorageに保存される
      state.signedIn = !!localStorage.signedIn
    },
  },
  actions: {
    // ログイン時等において[$store.dispatch('doFetchSignedIn')]で次のメソッドを呼び出し[signedIn]を更新する
    doFetchSignedIn({ commit }) {
      commit('fetchSignedIn')
    }
  }
})