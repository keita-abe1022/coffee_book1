<template>
  <v-form>
    <v-container>
      <v-row>
        <v-col
          cols="12"
        >
          <v-text-field
            v-model="coffee.product_name"
            label="商品名"
          ></v-text-field>
        </v-col>
        <v-col
          cols="12"
        >
          <v-text-field
            v-model="coffee.producing_area"
            label="生産地"
            placeholder="(例)インドネシア"
          ></v-text-field>
        </v-col>
        <v-col
          cols="12"
        >
          <v-text-field
            v-model="coffee.price"
            label="価格"
            placeholder="(例)1280"
          ></v-text-field>
        </v-col>
        <v-col
          cols="12"
        > 
          <v-text-field
            v-model="coffee.weight"
            label="重量"
            placeholder="(例)250"
          ></v-text-field>
        </v-col>
        <v-col
          cols="12"
        >
          <v-text-field
            v-model="coffee.purchashing_system"
            label="購入方式"
            placeholder="(例)豆"
          ></v-text-field>
        </v-col>
        <v-col
          cols="12"
        >
          <v-text-field
            v-model="coffee.degree_of_roasting"
            label="焙煎度"
            placeholder="(例)中煎り"
          ></v-text-field>
        </v-col>
        <v-col
          cols="12"
        >
          <v-text-field
            v-model="coffee.grind"
            label="挽き度合い"
            placeholder="(例)粗挽き"
          ></v-text-field>
        </v-col>
        <v-col
          cols="12"
        >
          <v-text-field
            v-model="coffee.brew"
            label="淹れ方"
            placeholder="(例)ペーパーフィルター"
          ></v-text-field>
        </v-col>
        <v-col
          cols="12"
        >
          <v-text-field
            v-model="coffee.shop"
            label="購入した店"
            placeholder="(例)スターバックスコーヒー"
          ></v-text-field>
        </v-col>
        <v-col
          cols="12"
        >
          <v-text-field
            v-model="coffee.comment"
            label="コメント"
            placeholder="備考、その他コメント"
          ></v-text-field>
        </v-col>
        <v-btn text @click="createCoffee">記録する</v-btn>
      </v-row>
    </v-container>
  </v-form>
</template>

<script>
import axios from "axios";
export default {
  data: function() {
    return {
      coffee: {
        product_name: '',
        producing_area: '',
        price: '',
        weight: '',
        purchashing_system: '',
        degree_of_roasting: '',
        grind: '',
        brew: '',
        shop: '',
        comment: ''
      }
    }
  },
  methods: {
    createCoffee: function () {
      if (!this.coffee.product_name) return;
      axios.post(
        '/api/coffees',
        { coffee: this.coffee })
        .then(res => {
          this.$router.push({ path: '/' });
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
}
</script>

<style>

</style>