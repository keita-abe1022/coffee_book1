<template>
  <v-form>
    <v-container>
      <v-row>
        <v-col
          cols="12"
        >
        <v-text-field
        v-model="user.email"
        label="メールアドレス"
        outlined
        >
        </v-text-field>
        <v-text-field
        v-model="user.password"
        label="パスワード"
        outlined
        >
        </v-text-field>
        </v-col>
        <v-btn text @click="signin">ログイン</v-btn>
        <v-btn text to="/signup">新規登録</v-btn>
      </v-row>
    </v-container>
  </v-form>
</template>

<script>
export default {
  name: 'Signin',
  data() {
    return {
      user: {
        email: '',
        password: '',
        error: ''
      }
    }
  },
  created() {
    this.checkSignedIn()
  },
  updated() {
    this.checkSignedIn()
  },
  methods: {
    signin() {
      this.$http.plain.post('/api/signin', { email: this.email, password: this.password })
        .then(response => this.signinSuccessful(response))
        .catch(error => this.signinFailed(error))
    },
    signinSuccessful(response) {
      if (!response.data.csrf) {
        this.signinFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.$store.dispatch('doFetchSignedIn')
      this.error = '',
      this.$router.replace('/')
    },
    signinFailed(error) {
      this.error = (error.response && error.response.data && error.response.data.error) || ''
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    signinFailed(error) {
      this.error = (error.response && error.response.data && error,response.data.error) || ''
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkSignedIn() {
      if (localStorage.signedIn) {
        this.$router.replace('/')
      }
    }
  }
}
</script>

<style>

</style>