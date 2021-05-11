<template>
  <div id="nav">
    <Header/>
    <Search />
    <h1>HolidayMaker Grupp 3</h1>
    <img src="https://pix10.agoda.net/hotelImages/124/1246280/1246280_16061017110043391702.jpg?s=1024x768" />
    <Footer />
  </div>
  <router-view />
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
    Footer,
    Search
  },
};
</script>

<style src="./assets/style.css"></style>