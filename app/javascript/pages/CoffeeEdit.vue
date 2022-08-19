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
            placeholder="(例)Summer Blend"
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
            label="重さ"
            placeholder="(例)250g"
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
        <v-btn text @click="updateCoffee(coffee.id)">編集完了</v-btn>
      </v-row>
    </v-container>
  </v-form>
</template>

<script>
import axios from 'axios';
export default {
  name: 'CoffeeEdit',
  data: function() {
    return {
      id: this.$route.params.id,
      coffee: {
        id: '',
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
      },
    }
  },
  mounted: function() {
    this.setcoffeeEdit(this.id);
  },
  methods: {
    setcoffeeEdit(id) {
      axios.get(`/api/coffees/${id}.json`).then(res => {
        this.coffee.id = res.data.id;
        this.coffee.product_name = res.data.product_name;
        this.coffee.producing_area = res.data.producing_area;
        this.coffee.price = res.data.price;
        this.coffee.weight = res.data.weight;
        this.coffee.purchashing_system = res.data.purchashing_system;
        this.coffee.degree_of_roasting = res.data.degree_of_roasting;
        this.coffee.grind = res.data.grind;
        this.coffee.brew = res.data.brew;
        this.coffee.shop = res.data.shop;
        this.coffee.comment = res.data.comment;
      });
    },
    updateCoffee(id) {
      if (!this.coffee.product_name) return;
      axios.put(`/api/coffees/${id}`, { coffee: this.coffee })
      .then(res => {
        this.$router.push({ path: '/' });
      })
      .catch(error => {
        console.log(error);
      });
    },
  }
}
</script>

<style>

</style>