<template>
    
    <booking-user-details></booking-user-details>
    <hotel-details></hotel-details>
    <room-details></room-details>
    <room-suggestor></room-suggestor>
    <filter-component></filter-component>
</template>


<script>
import BookingUserDetails from '../components/BookingUserDetails.vue'
import HotelDetails from '../components/HotelDetails.vue'
import RoomDetails from '../components/RoomDetails.vue'
import RoomSuggestor from '../components/RoomSuggestor.vue'
import FilterComponent from '../components/FilterComponent.vue'
export default {
  components: { 
      
    BookingUserDetails,
    HotelDetails,
    RoomDetails,
    RoomSuggestor,
    FilterComponent
  
  },
    
}
</script>


<style scoped>

</style>