<template>
  <v-form>
    <v-container>
      <v-row>
        <v-col
          cols="12"
        >
        <v-text-field
          v-model="user.name"
          label="名前"
          :rules= "[rules.required]"
        >
        </v-text-field>
        <v-text-field
          v-model="user.email"
          label="メールアドレス"
          :rules= "[rules.required]"
        >
        </v-text-field>
        <v-text-field
          v-model="user.password"
          label="パスワード"
          :rules="[rules.required]"
          counter
        >
        </v-text-field>
        <v-text-field
          v-model="user.password_confirmation"
          :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
          :rules="[rules.required, rules.min]"
          :type="showPassword ? 'text' : 'password'"
          label="パスワードの確認"
          hint="最低8文字以上"
          counter
          @click:append= "showPassword = !showPassword"
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
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
        error: ''
      },
      showPassword: false,
      rules: {
        required: value => !!value || '必須',
        min: v => v.length >= 8 || '8文字以上'
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
      this.$http.plain.post('/api/signup', { name: this.name, email: this.email, password: this.password, password_confirmation: this.password_confirmation })
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