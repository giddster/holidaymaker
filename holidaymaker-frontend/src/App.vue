<template>
  <div id="nav">
    <Header/>
    <Search />
    <router-view />
    <Footer />
  </div>
</template>


<script>
// @ is an alias to /src
import Header from "@/components/Header.vue"
import Footer from "@/components/Footer.vue"
import Search from "@/components/Search.vue"

export default {
  name: "Home",
  components: {
    Header,
    Search,
    Footer,
  },

  created() {
    this.$store.dispatch('fetchDestinations') /*det är nåt jävla fel här */
  }
};
</script>

<style src="./assets/style.css"></style>