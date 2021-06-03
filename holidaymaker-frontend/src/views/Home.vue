<template>
  <div class="home">
    <div class="seedestinations">
      <router-link :to="'/destinations/'"> 
          <i class="fas fa-route showdestinations-icon"></i>
          <h3>Our destinations</h3>
      </router-link>
    </div>
  </div>
</template>

<script>


export default {
  name: 'Home',
  components: {
  }
}
</script>

<style scoped>
.showdestinations-icon {
margin-top: 20px;
font-size: 200px;
}

.seedestinations{
margin-left: 45%;
}
</style>
