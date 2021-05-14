<template>
    <profile-navbar></profile-navbar>
    <edit-user-profile></edit-user-profile>
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

<style scoped>

</style>