<template>
  <header>
    <div class="header-parent">
      <!-- <div class="header-div1">
        <img
          src="../assets/logo.png"
          alt="holidayMakerLogo"
          class="companyLogo"
        />
        <router-link to="/"
          ><h5 class="header-title">HolidayMaker.com</h5></router-link
        >
      </div> -->

      <!-- From premain-rel3 -->
      <div class="header-div1">
        <router-link id="logo-link" to="/">
          <img src="@/assets/logoPink.svg" alt="holidayMakerLogo" class="companyLogo">
        </router-link>
      </div>
     

      {{ IsLoggedIn }}

      <div v-if="IsLoggedIn" class="header-div2">
        <ProfileDropdown />
      </div>

      <div v-else class="header-div3">
        <router-link to="/login"
          ><h5 class="header-title">Login</h5>  |</router-link
        >
        
        <router-link to="/register"
          ><h5 class="header-title">Register</h5></router-link
        >
      </div>

    </div>
  </header>
</template>

<script>
import ProfileDropdown from '@/components/marginals/ProfileDropdown.vue';

export default {

  components: { ProfileDropdown },
  computed: {
    isLoggedIn (){
      return !!(this.$store.state.customer && this.$store.state.customer.email)
    }

  },

};
</script>

<style scoped>
header {
  /* background: rgb(233, 232, 253); */
  background:whitesmoke;
  height: 75px;
}

.header-parent {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 1fr;
}

.header-div1 {
  grid-area: 1 / 1 / 2 / 2;
  margin-left: 10px;
  margin-top: 10px;
}
.header-div2 {
  grid-area: 1 / 4 / 2 / 5;
  /*margin-top: 10px;*/
  margin-top: 17px;
  margin-right: 10px;
}
.header-div3 {
  grid-area: 1 / 4 / 2 / 5;
  margin-top: 2em;
  margin-right: 10px;
}


.header-title {
  display: inline;
  margin-left: 10px;
}

.header-title:hover {
  cursor: pointer;
  color: cornflowerblue;
}


.companyLogo {
  /*padding: 5px;
  width: 85px;*/
  height: 60px;

}

</style>
