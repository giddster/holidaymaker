


<template>
  <header>
      <div class="header-parent">
          <div class="header-div1"> 
            <img src="../assets/logo.png" alt="holidayMakerLogo" class="companyLogo">
            <router-link to="/"><h5 class="header-title">HolidayMaker.com</h5></router-link>
          </div>
          {{IsLoggedIn}}
          <div v-if="IsLoggedIn" class="header-div2"> 
              <ProfileDropdown />
          </div>
          <div v-else>
            <router-link to="/login"><h5 class="header-title">login</h5></router-link>
            <router-link to="/register"><h5 class="header-title">register</h5></router-link>
          </div>
      </div>
  </header>
</template>

<script>
    import ProfileDropdown from '@/components/ProfileDropdown.vue'
    import {mapGetters} from "vuex";
export default {
    components: { ProfileDropdown },
    computed:{
      ...mapGetters(["IsLoggedIn"])
      // IsLoggedIn(){
      //   return this.$store.state.loggedInUser.IsLoggedIn
     //}
    }
}
</script>

<style>

header {
  background:rgb(233, 232, 253);
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
  margin-top: 10px;
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
  padding: 5px; 
  width: 85px; 
}


</style>