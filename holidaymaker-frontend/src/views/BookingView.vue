<template>
    
    <booking-user-details></booking-user-details>
    <hotel-details></hotel-details>
    <room-details></room-details>
    
</template>


<script>
import BookingUserDetails from '../components/BookingUserDetails.vue'
import HotelDetails from '../components/HotelDetails.vue'
import RoomDetails from '../components/RoomDetails.vue'

export default {
  components: { 
      
    BookingUserDetails,
    HotelDetails,
    RoomDetails,
    
   
  
  },
    
}
</script>


<style scoped>

</style>