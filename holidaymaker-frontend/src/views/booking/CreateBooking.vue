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

      <div class="bookingdetails-trip"> 
        <h4><i class="fas fa-suitcase"></i> Trip details</h4>
        <p><i class="fas fa-hotel"></i> {{thishotel.name}}</p>
        <p> <i class="fas fa-map-marked-alt"></i> {{thishotel.address}}, {{thishotel.zipCode}} CITY, COUNTRY</p>    
        <p> <i class="far fa-calendar-check"></i> Checkin: {{ dates.checkinDate }}</p>    
        <p> <i class="fas fa-calendar-times"></i> Checkout: {{ dates.checkoutDate }}</p> 
      </div>
      
      <div class="bookingdetails-options"> 
          <h4><i class="fas fa-list"></i> Options: </h4>
          
          <label for="includeFlight"><i class="fas fa-plane"></i> Include flight?</label> &nbsp;
          <select id="includeFlight" class="form-control options-selector">
            <option value="none">None</option>
            <option value="oneway">One way</option>
            <option value="roundtrip">Round-trip</option>
          </select>
        
            <br>

          <label for="mealplan"><i class="fas fa-utensils"></i> Meal plan*</label> &nbsp;
          <select id="mealplan" class="form-control options-selector">
            <option value="none">None</option>
            <option value="halfboard">Half pension</option>
            <option value="fullboard">Full pension</option>
            <option value="opel">All-inclusive</option>
          </select>
          <i>*A continental breakfast is always included at our partner hotels</i>
      </div>

      <div class="bookingdetails-rooms"> 
          <h4><i class="fas fa-door-open"></i> Room(s) </h4>
          <div v-for="(room, index) in selectedRooms" :key="room" class="eachroom-box">
              <i>Room {{index + 1}}</i>
              <p>Room number: <b>{{ room.roomNo }}</b> </p>
                
              <label for="guestsperroom"><i class="fas fa-users"></i> Amount of guests </label> &nbsp;
              <select id="guestsperroom" class="form-control options-selector">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
              </select>

              <label for="sparebedsperroom"><i class="fas fa-bed"></i> Amount of spare beds </label> &nbsp;
              <select id="sparebedsperroom" class="form-control options-selector">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
              </select>
          </div>
      </div>


    </div>

    <div class="booking-price">
        <h4>Payment</h4>
        <p>TOTAL SUM: XXX SEK</p>

        <div class="payment-buttons">
            <router-link to="/" class="btn btn-lg btn-danger">Cancel booking</router-link>
            <Payment />
        </div>
        
    </div>

    
    
</template>


<script>
import Payment from '@/components/payment/Payment.vue'

export default {
  components: { Payment },
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
max-width: 80%;
margin: auto;
border:black;
border-style: solid;
border-width: thin;
border-radius: 10px;
}

.bookingdetails-customer { 
  grid-area: 1 / 1 / 2 / 2; 
  padding: 10px;
}
.bookingdetails-trip { 
  grid-area: 1 / 2 / 2 / 3; 
  padding: 10px;
}
.bookingdetails-options { 
  grid-area: 2 / 1 / 3 / 2; 
  padding: 10px;
}
.bookingdetails-rooms { 
  grid-area: 2 / 2 / 3 / 3;
  padding: 10px;
  margin: auto 0;
  display: inline-flex;
}

.eachroom-box {
border:black;
border-style:hidden;
border-width:thin;
border-radius: 10px;
margin: 0 auto;
}

.options-selector {
  max-width: 210px;
  max-height: 40px;
}

.booking-price {
  padding: 20px;
  margin: auto;
  text-align: center;
}

.payment-buttons {
  
}


</style>