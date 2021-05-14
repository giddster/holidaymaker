<template>
  <div id="nav">
    <Header/>
    <Search />
    <SiteBody />
    <Footer />
  </div>
  <router-view />
</template>


<script>
// @ is an alias to /src
import Header from "@/components/Header.vue"
import Footer from "@/components/Footer.vue"
import SiteBody from "@/components/SiteBody.vue"
import Search from "@/components/Search.vue"

export default {
  name: "Home",
  components: {
    Header,
    Search,
    SiteBody,
    Footer,
  }
};
</script>

<style src="./assets/style.css"></style>