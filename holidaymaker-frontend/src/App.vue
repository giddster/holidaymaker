<template class="main-template">
  <Header id="header-component" />
  <div id="content-container">
    <div id="bg-container">
      <Search id="search-component" />
    </div>
    <router-view id="router-component"/>
  </div>
  <Footer id="footer-component"/>
</template>

<script>
import Header from '@/components/marginals/Header.vue'
import Footer from '@/components/marginals/Footer.vue'
import Search from './components/search/Search.vue'


export default {
  async created() {
      await this.$store.dispatch('getLoggedInUser')
      await this.$store.dispatch('fetchDestinations')
      await this.$store.dispatch('fetchHotels')
      //Hämta inloggad användare
  },
  components: { Header, Footer, Search}
}
</script>

<style>
#app {
  font-family: Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

body {
  margin: 0px;
  height: 837px;
  background-color: lightgrey;
}

#bg-container {
  background-image: url("../src/assets/background1920.png");
  height: 400px;
  padding: 40px;
  min-height: 400px;
}

#search-component {
  margin-top: 6%;
  opacity: 95%;
  box-shadow: 0px 2px 10px black;
}

#footer-component {
  margin-bottom: 0px;
}

#content-container {
  min-height: 840px;
}

/* BUTTONS */

.btn {
    background: lightcoral;
    border-radius: 5px;
    border: 1px solid lightcoral;
}
.btn:hover {
    background: lightpink;
    border-radius: 5px;
    border: 1px solid lightpink;
    box-shadow: none;
}
.btn:focus {
    background: lightcoral;
    border-radius: 5px;
    border-color: lightcoral;
    box-shadow: none;
}

a {
  color: lightcoral;
}

a:hover {
  color: lightpink;
}
</style>
