<template>
  <v-app-bar
    app
    elevate-on-scroll
  >
    <v-app-bar-nav-icon>
    </v-app-bar-nav-icon>
    <v-toolbar-title
      @click="$router.push('/')"
      style="cursor:pointer"
    >
    COFFEE BOOK
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items>
      <v-btn to="/">Home</v-btn>
      <v-btn to="">About</v-btn>
      <v-btn to="/create">コーヒーを記録</v-btn>
      <v-btn to="">MyPage</v-btn>
      <v-btn to="/signup" v-if="!signedIn">新規登録</v-btn>
      <v-btn to="/signin" v-if="!signedIn">ログイン</v-btn>
      <v-btn to="/" v-if="signedIn" @click="signOut">ログアウト</v-btn>
    </v-toolbar-items>
      <v-btn icon>
        <!-- Material iconを使用する。mdiをつけると使用可。 -->
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
  </v-app-bar>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'Header',
  computed: mapState([
    'signedIn'
  ]),
  mounted: function() {
    this.$store.dispatch('doFetchSignedIn')
  },
  methods: {
    setError(error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    signOut() {
      this.$http.secured.delete(`/api/signin`)
        .then(response => {
          delete localStorage.csrf
          delete localStorage.signedIn
        })
        .catch(error => this.setError(error, 'Cannot sign out'))
    }
  }
}
</script>

<style>

</style>