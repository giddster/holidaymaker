<template>
    
    <booking-user-details></booking-user-details>
    <hotel-details></hotel-details>
    <room-details></room-details>
    <room-suggestor></room-suggestor>
</template>


<script>
import BookingUserDetails from '../components/BookingUserDetails.vue'
import HotelDetails from '../components/HotelDetails.vue'
import RoomDetails from '../components/RoomDetails.vue'
import RoomSuggestor from '../components/RoomSuggestor.vue'
export default {
  components: { 
      
    BookingUserDetails,
    HotelDetails,
    RoomDetails,
    RoomSuggestor
  
  },
    
}
</script>


<style scoped>

</style>