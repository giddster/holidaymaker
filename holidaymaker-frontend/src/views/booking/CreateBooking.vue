<template>
    <h2 class="bookingdetails-heading">Your booking details:</h2>
    
    <div class="bookingdetails-parent">
    
      <div class="bookingdetails-customer"> 
        <h4><i class="fas fa-user-alt"></i> Customer details</h4>
        <p>First name: </p>
        <p>Last name: </p>
        <p>Address: </p>
        <p>E-mail: </p>    
      </div>

      <div class="div2"> 
        <h4><i class="fas fa-map-marked"></i> Trip details</h4>
        <p><i class="fas fa-hotel"></i> {{thishotel.name}}</p>
        <p> <i class="fas fa-map-marked-alt"></i>{{thishotel.address}}, {{thishotel.zipCode}} CITY, COUNTRY</p>    
        <p> <i class="far fa-calendar-check"></i> Checkin: {{ dates.checkinDate }}</p>    
        <p> <i class="fas fa-calendar-times"></i> Checkout: {{ dates.checkoutDate }}</p> 
      </div>
      
      <div class="div3"> 
          <h4>Options: </h4>
          
          <label for="includeFlight"> <i class="fas fa-plane"></i> Include flight?</label> &nbsp;
          <select id="includeFlight">
            <option value="none">None</option>
            <option value="oneway">One way</option>
            <option value="roundtrip">Round-trip</option>
          </select>
            
            <br>

          <label for="mealplan"><i class="fas fa-utensils"></i> Meal plan*</label> &nbsp;
          <select id="mealplan">
            <option value="none">None</option>
            <option value="halfboard">Half pension</option>
            <option value="fullboard">Full pension</option>
            <option value="opel">All-inclusive</option>
          </select>
          
          <br>
          <i>*A continental breakfast is always included at our partner hotels</i>
      </div>

      <div class="div4"> 
          <h4>Room(s) </h4>
          <div v-for="(room, index) in selectedRooms" :key="room" class="eachroom-box">
              <i>Room {{index + 1}}</i>
              <p>Room number: <b>{{ room.roomNo }}</b> </p>
              <p>CHOOSE PERSONS PER ROOM</p>
              <p>CHOOSE EXTRA BEDS</p>
          </div>
      </div>


    </div>

    <div class="booking-price">
        <h4>Price</h4>
        <p>TOTAL SUM</p>

        <router-link to="/" class="btn btn-lg btn-danger">Cancel booking</router-link>
        <Payment />
    </div>

    
    
</template>


<script>
import Payment from '@/components/booking/Payment.vue'
import Review from '@/components/Review.vue'

export default {
  components: { Review, Payment },
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

.bookingdetails-parent {
display: grid;
grid-template-columns: repeat(2, 1fr);
grid-template-rows: repeat(2, 1fr);
grid-column-gap: 0px;
grid-row-gap: 0px;
padding: 10px;
}

.bookingdetails-customer { 
  grid-area: 1 / 1 / 2 / 2; 
}
.div2 { 
  grid-area: 1 / 2 / 2 / 3; 
}
.div3 { 
  grid-area: 2 / 1 / 3 / 2; 
}
.div4 { 
  grid-area: 2 / 2 / 3 / 3; 
}


</style>