<template>
  <div class="home">
    <div class="seedestinations">
      <router-link :to="'/destinations/'"> 
          <i class="fas fa-route showdestinations-icon"></i>
          <h3>Our destinations</h3>
      </router-link>
    </div>

    <div class="seehotels">
      <router-link :to="'/hotels/'"> 
          <i class="fas fa-hotel showhotels-icon"></i>
          <h3>Our hotels</h3>
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
.seedestinations{
float: left;
margin-left: 700px;
}

.seehotels {
float: right;
margin-right: 700px;
}

.showdestinations-icon {
margin-top: 20px;
font-size: 200px;
}

.showhotels-icon {
margin-top: 20px;
font-size: 200px;
float: right;
}

</style>
