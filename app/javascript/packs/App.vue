<template>
<!-- 一番外に必須。 -->
  <v-app>
    <Header/>
    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>
import Header from '../components/Header.vue'

export default {  
  name: 'App',
  components: {
    Header
  },
}
</script>

<style scoped>
</style>
