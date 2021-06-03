<template>
    
    <booking-user-details></booking-user-details>
    <hotel-details></hotel-details>
    <room-details></room-details>
    <review></review>
</template>


<script>
import BookingUserDetails from '../components/BookingUserDetails.vue'
import HotelDetails from '../components/HotelDetails.vue'
import RoomDetails from '../components/RoomDetails.vue'
import Review from '../components/Review.vue';

export default {
  components: { 
      
    BookingUserDetails,
    HotelDetails,
    RoomDetails,
    Review
    
   
  
  },
    
}
</script>


<style scoped>

</style>