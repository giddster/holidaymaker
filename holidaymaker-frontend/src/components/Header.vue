<template>
  <header>
      <div class="header-parent">
          <div class="header-div1"> 
            <img src="../assets/logo.png" alt="holidayMakerLogo" class="companyLogo">
            <router-link to="/"><h5 class="header-title">HolidayMaker.com</h5></router-link>
          </div>
          <div class="header-div2"> 
              <ProfileDropdown />
          </div>
      </div>
  </header>
</template>

<script>
    import ProfileDropdown from '@/components/ProfileDropdown.vue'

export default {
    components: { ProfileDropdown }
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