<template>
  <v-form>
    <v-container>
      <v-row>
        <v-col
          cols="12"
        >
        <v-text-field
          v-model="user.user_name"
          label="名前"
        >
        </v-text-field>
        <v-text-field
          v-model="user.email"
          label="メールアドレス"
        >
        </v-text-field>
        <v-text-field
          v-model="user.password"
          label="パスワード"
        >
        </v-text-field>
        <v-text-field
          v-model="user.password_confirmation"
          label="パスワードの確認"
        >
        </v-text-field>
        </v-col>
        <v-btn text @click="signUp">登録</v-btn>
        <v-btn text to="/signin" >ログイン</v-btn>
      </v-row>
    </v-container>
  </v-form>
</template>

<script>
export default {
  name: 'Signup',
  data() {
    return {
      user: {
        user_name: '',
        email: '',
        password: '',
        password_confirmation: '',
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
    signUp() {
      this.$http.plain.post('/api/signup', { user_name: this.user_name, email: this.email, password: this.password, password_confirmation: this.password_confirmation })
        .then(response => this.signupSuccessful(response))
        .catch(error => this.signupFailed(error))
    },
    signupSuccessful(response) {
      if (!response.data.csrf) {
        this.signupFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.$store.dispatch('doFetchSignedIn')
      this.error= ''
      this.$roter.replace('/')
    },
    signupFailed(error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
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