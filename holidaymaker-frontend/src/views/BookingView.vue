<template>
    <h2 class="bookingdetails-heading">Your booking details:</h2>
    
    <div class="booking-destination">
        <h4>Destination</h4>
        <p>Country: </p>
        <p>City: </p>    
    </div>

    
    
    <div class="booking-dates">
        <h4>Dates </h4>
        <p>Checkin: {{ dates.checkinDate }}</p>    
        <p>Checkout: {{ dates.checkoutDate }}</p>    
    </div>
    
    <div class="booking-hoteldetails">
        <h4>Hotel </h4>
        <p>Hotel name: {{thishotel.name}}</p>
        <p>Address: {{thishotel.address}}, {{thishotel.zipCode}} CITY</p>
    </div>

    <div class="booking-roomdetails">
        <h4>Room(s) </h4>
          <div v-for="(room, index) in selectedRooms" :key="room">
                <i>Room {{index + 1}}</i>
                <p>Room number: <b>{{ room.roomNo }}</b> </p>
                <p>CHOOSE PERSONS PER ROOM</p>
                <p>CHOOSE EXTRA BEDS</p>
                <hr>
            </div>
    </div>

    <div class="booking-options">
        <h4>Options: </h4>
      <p>INCLUDE FLIGHT (TUR ELLER TUR OCH RETUR)?</p>
      <p>FOOD PREFERENCE (DROPDOWN WITH THE OPTIONS THAT ARE TRUE FOR THIS HOTEL)</p>
    </div>

    <div class="booking-customerdetail">
        <h4>Customer details</h4>
        <p>First name: </p>
        <p>Last name: </p>
        <p>Address: </p>
        <p>E-mail: </p>    
    </div>

    <div class="booking-price">
        <h4>Price</h4>
        <p>TOTAL SUM</p>
    </div>

    <router-link to="/" class="btn btn-lg btn-danger">Cancel booking</router-link>
    <Payment />
    
</template>


<script>
import Payment from '@/components/booking/Payment.vue'
import BookingUserDetails from '../components/BookingUserDetails.vue'
import HotelDetails from '../components/HotelDetails.vue'
import RoomDetails from '../components/RoomDetails.vue'
import Review from '../components/Review.vue'

export default {
  components: { BookingUserDetails, HotelDetails, RoomDetails, Review, Payment },
  computed: {
    dates(){
      return this.$store.state.dates
    },
    thishotel(){
      return this.$store.state.thisHotel;
    },
    selectedRooms(){
      return this.$store.state.selectedRooms
    },
  }
}
</script>


<style scoped>
.bookingdetails-heading {
  text-align: center;
}

</style>