<template>
        <h4 class="profile-title">Hello, USERNAME</h4>
    
    <ProfileNavbar />
    <EditUserProfile />
</template>


<script>
import EditUserProfile from '../components/EditUserProfile.vue'
import ProfileNavbar from '../components/ProfileNavbar.vue'

export default {
  components: { 
      
    ProfileNavbar,
    EditUserProfile 
  
  },
    
}
</script>

<style>

.profile-title {
  margin: 0 auto;
  text-align: center;
}

</style>