<template>
  <header>
      <div class="header-parent">
          <div class="header-div1"> 
            <router-link id="logo-link" to="/">
              <img src="../assets/logoPink.svg" alt="holidayMakerLogo" class="companyLogo">
            </router-link>
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
  margin-top: 17px;
  margin-right: 10px;
}

.companyLogo {
  height: 60px;
}


</style>