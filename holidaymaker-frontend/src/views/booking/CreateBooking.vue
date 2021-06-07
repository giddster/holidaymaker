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
          <h4><i class="fas fa-list"></i> Options </h4>
          
          <label for="include-flight"><i class="fas fa-plane"></i> Include flight?</label> &nbsp;
          <select id="include-flight" class="form-control options-selector" @change="getSelectedFlight">
            <option value="none" id="no-flight">None</option>
            <option value="oneway" id="oneway-flight">One way</option>
            <option value="roundtrip" id="roundtrip-flight">Round-trip</option>
          </select>
        
            <br>

          <label for="mealplan"><i class="fas fa-utensils"></i> Meal plan*</label> &nbsp;
          <select id="mealplan" class="form-control options-selector" @change="getSelectedMealplan">
            <option value="none" id="no-meals">None</option>
            <option value="halfpension" id="half-pension">Half pension</option>
            <option value="fullpension" id="full-pension">Full pension</option>
            <option value="allinclusive" id="all-inclusive">All-inclusive</option>
          </select>
          <i>*A continental breakfast is always included at our partner hotels</i>
      </div>

      <div class="bookingdetails-rooms"> 
          <h4><i class="fas fa-door-open"></i> Room(s) </h4>
          <div v-for="(room, index) in selectedRooms" :key="room" class="eachroom-box">
              <i>Room {{index + 1}}</i>
              <p>Room number: <b>{{ room.roomNo }}</b> </p>
                
              <label for="guestsperroom"><i class="fas fa-users"></i> Amount of guests </label> &nbsp;
              <!-- <select id="guestsperroom" class="form-control options-selector" v-for="index in selectedRooms.roomType.capacity" :key="index">
                  <option>{{index}}</option>
              </select> -->

              <label for="sparebedsperroom"><i class="fas fa-bed"></i> Amount of spare beds </label> &nbsp;
              <select id="sparebedsperroom" class="form-control options-selector">
                  <option value="1">0</option>
                  <option value="2">2</option>
                  <option value="3">{{room.noOfSpareBeds}}</option>
              </select>
          </div>
      </div>


    </div>

    <div class="booking-price">
        <h4>Price for booking</h4>
        <h5>Room(s): {{selectedRooms.length}}</h5>
        <div v-for="(room, index) in selectedRooms" :key="room"> 
        <p>Room {{index + 1}}: {{ room.roomType.price }} SEK * X nights for XY guests = YYY SEK</p> 
        </div>
        <p>Spare beds: </p>
        <hr>
        <h5>Options:</h5>
        <p>Include flight: {{flightCost}} SEK</p>
        <p>Meal plan: xxx SEK</p>
        <h5>TOTAL SUM: {{totalCost}} SEK</h5>

        <div class="payment-buttons">
            <router-link to="/" class="btn btn-lg btn-danger">Cancel booking</router-link>
            <Payment />
        </div>
        
    </div>
    
</template>


<script>
import Payment from '@/components/payment/Payment.vue'

export default {
  data(){
    return {
      flightCost: 0,
      mealplanCost: 0,
    }
  },
  components: { Payment },
  methods: {
    getSelectedFlight(){
        var selectedFlightOption = document.getElementById("include-flight").value;

        if (selectedFlightOption === 'oneway'){
          this.flightCost = 1000;
        } else if(selectedFlightOption === 'roundtrip') {
          this.flightCost = 2000;
        } else {
          this.flightCost = 0;
        }
        return this.flightCost;
      },
      getSelectedMealplan(){
        var selectedMealplanOption = document.getElementById("mealplan").value;

        if (selectedMealplanOption === 'halfpension'){
          this.mealplanCost = 500;
        } else if(selectedMealplanOption === 'fullpension') {
          this.mealplanCost = 1000;
        } else if(selectedMealplanOption === 'allinclusive') {
          this.mealplanCost = 2500;
        }
        else {
          this.mealplanCost = 0;
        }
        return this.mealplanCost;
      }
  },
  
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
    totalCost(){
      let totalCost = 0
      return totalCost += this.flightCost += this.mealplanCost;
    }
  },
  
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