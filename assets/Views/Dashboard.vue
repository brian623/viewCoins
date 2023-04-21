<template>
     <div class="container">
    <div class="row">
        <b-col><h1 class="my-3">Dashboard</h1></b-col>
        <b-col>
            <b-container class="bv-example-row">
                <b-row class="justify-content-md-end">
                    <b-media left-align vertical-align="center">
                        <template #aside>
                        <b-img blank blank-color="#ccc" :src="user.image" width="80" alt="placeholder"></b-img>
                        </template>
                        <b-list-group-item disabled>Nombre: {{ user.name }}</b-list-group-item>
                        <b-list-group-item disabled>Email: {{ user.email }}</b-list-group-item>
                    </b-media>
                </b-row>
            </b-container>
        </b-col>
      <input
        type="text"
        class="form-control text-light bg-dark rounded-0 border-0 my-4"
        placeholder="Search"
        v-model="textSearch"
        @keyup="searchCoin()"
        autofocus
      />

      <table class="table table-hover table-dark text-light">
        <thead>
          <tr>
            <th v-for="(title, index) in titles" :key="index">
              {{ title }}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(coin, index) in filteredCoins" :key="coin.id">
            <td class="text-muted">{{ index }}</td>
            <td>
              <img :src="coin.image" :alt="coin.name" style="width: 2rem" class="me-2" />
              <span>
                {{ coin.name }}
              </span>
              <span class="ms-2 text-muted text-uppercase">
                {{ coin.symbol }}
              </span>
            </td>
            <td>{{ coin.current_price.toLocaleString() }}</td>
            <td
              :class="[
                coin.price_change_percentage_24h > 0
                  ? 'text-success'
                  : 'text-danger',
              ]"
            >
              {{ coin.price_change_percentage_24h }}
            </td>
            <td>{{ coin.total_volume.toLocaleString() }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "App",
  components: {},
  computed: {
    ...mapGetters({
        user: "auth/getUser",
    })
  },
  data() {
    return {
      coins: [],
      filteredCoins: [],
      titles: ["#", "Coin", "Price", "Price Change", "24h Volume"],
      textSearch: "",
    };
  },
  async mounted() {
    const res = await fetch(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
    );
    const data = await res.json();
    this.coins = data;
    this.filteredCoins = data;
  },
  methods: {
    searchCoin() {
      this.filteredCoins = this.coins.filter(
        (coin) =>
          coin.name.toLowerCase().includes(this.textSearch.toLowerCase()) ||
          coin.symbol.toLowerCase().includes(this.textSearch.toLowerCase())
      );
    },
  },
};
</script>