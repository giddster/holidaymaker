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
        <p><i class="fas fa-hotel"></i> {{selectedHotel.name}}</p>
        <p> <i class="fas fa-map-marked-alt"></i> {{selectedHotel.address}}, {{selectedHotel.zipCode}} CITY, COUNTRY</p>    
        <p> <i class="far fa-calendar-check"></i> Checkin: {{ dates.checkinDate }}</p>    
        <p> <i class="fas fa-calendar-times"></i> Checkout: {{ dates.checkoutDate }}</p> 
        <p>Length of stay: {{lengthOfStay}} nights</p>
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
          <select id="mealplan" class="form-control options-selector" @change="chosenMealPlan($event)">
            <option v-for="item in mealPlanAlternatives" :key="item" :value="item" id="mealplan-item" :text="correctText(item)"></option>
          </select>
          <i>*A continental breakfast is always included at our partner hotels</i>
      </div>

      <div class="bookingdetails-rooms"> 
          <h4><i class="fas fa-door-open"></i> Room(s) </h4>
          <div v-for="(room, index) in selectedRooms" :key="room" class="eachroom-box">
              <i>Room {{index + 1}}</i>
              <p>Room number: <b>{{ room.roomNo }}</b> </p>
                
              <label for="guestsperroom"><i class="fas fa-users"></i> Amount of guests </label> &nbsp;
              <!-- <select id="guestsperroom" class="form-control options-selector" @change="chosenNumberOfGuests($event)">
                  <option v-for="guests in selectedRooms.roomType.capacity" :key="guests" :value="items">{{items}}</option>
              </select> -->

              <label for="sparebedsperroom"><i class="fas fa-bed"></i> Amount of spare beds </label> &nbsp;
              <select id="sparebedsperroom" class="form-control options-selector" @change="chosenNumberOfSpareBeds($event, index)">
                  <option value="0">0</option>
                  <option v-for="spareBed in room.noOfSpareBeds" :key="spareBed" :id="'test'+index" :value="spareBed">{{spareBed}}</option>
              </select>
          </div>
      </div>
    </div>

    <div class="booking-price">
        <h4>Price for booking</h4>
        <h5>Room(s): {{selectedRooms.length}}</h5>
        <div v-for="(room, index) in selectedRooms" :key="room"> 
        <p>Room {{index + 1}}: {{ room.roomType.price }} SEK * {{lengthOfStay}} nights for X guests + {{selectionOfSpareBeds[index]}} spare bed(s) = YYY SEK</p> 
        </div>
        <p>Spare beds: {{totalNumberOfSpareBeds}} * 300 SEK = {{calculatePriceForSpareBeds}} SEK</p>
        <hr>
        <h5>Options:</h5>
        <p>Include flight: {{flightCost}} SEK</p>
        <p>Meal plan: {{mealplanCost}} SEK</p>
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
      lengthOfStay: 0,
      flightCost: 0,
      mealplanCost: 0,
      roomCost: 0,
      calculatedTotalCost: 0,
      selectionOfSpareBeds: [0],
      numberOfGuests: 0,
      totalSpareBedCost: 0,
    }
  },
  watch: {
    
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
    correctText(value){
      if(value === 'none'){
        return "None";
      }
      else if(value === 'halfpension'){
        return "Half pension"
      }
      else if(value === 'fullpension'){
        return "Full pension"
      }
      else if(value === 'allinclusive'){
        return "All inclusive"
      }
    },
    chosenMealPlan(event) {
      if (event.target.value === 'halfpension'){
        this.mealplanCost = 500;
      } 
      else if(event.target.value === 'fullpension') {
        this.mealplanCost = 1000;
      } 
      else if(event.target.value === 'allinclusive') {
        this.mealplanCost = 2500;
      }
      else {
        this.mealplanCost = 0;
      }
    },
    chosenNumberOfSpareBeds(event, index){
      this.selectionOfSpareBeds[index] = event.target.value
    },
  },
  
  computed: {
    calculatedNumberOfSpareBeds(){
      if (this.selectionOfSpareBeds !== undefined){
        for (let i of this.selectionOfSpareBeds){
          number = parseInt(i)
          numberOfSpareBeds += number
        }
        return numberOfSpareBeds
      }
    },
    calculatePriceForSpareBeds(){
      let numberOfSpareBeds = 0
      let totalSpareBedCost = 0
      let number = 0;

      if (this.selectionOfSpareBeds !== undefined){
        for (let i of this.selectionOfSpareBeds){
          number = parseInt(i)
        numberOfSpareBeds += number
      }
      console.log(numberOfSpareBeds)
      
      totalSpareBedCost = numberOfSpareBeds * 300

      return totalSpareBedCost
      }
    },
    dates(){
      return this.$store.state.dates
    },
    selectedHotel(){
      return this.$store.state.thisHotel;
    },
    selectedRooms(){
      return this.$store.state.selectedRooms
    },
    lengthOfStay(){
      let checkinDate = new Date(this.$store.state.dates.checkinDate);
      let checkoutDate = new Date(this.$store.state.dates.checkoutDate);

      let difference = Math.abs(checkoutDate-checkinDate);
      let nights = difference/(1000*3600*24);
      this.lengthOfStay = nights;
      return this.lengthOfStay;
    },
    totalCost(){
      this.calculatedTotalCost = 0;
      this.roomCost = 0;
      // I am not sure why the two following lines works beacause it seems strange to have to do this calculation but it works so i'll leave it for now
      this.flightCost = this.flightCost;
      this.mealplanCost = this.mealplanCost;

      for(let room of this.selectedRooms){
        this.roomCost += room.roomType.price; // Price for a spare bed
      }

      return this.calculatedTotalCost = this.roomCost + this.flightCost + this.mealplanCost + this.calculatePriceForSpareBeds;
    },
    
    mealPlanAlternatives(){
      let availableAlternatives = []

      availableAlternatives.push('none')

      if (this.selectedHotel.hasHalfPension === true){
        availableAlternatives.push('halfpension')
      }

      if (this.selectedHotel.hasWholePension === true){
        availableAlternatives.push('fullpension')
      }

      if (this.selectedHotel.hasAllInclusive === true){
        availableAlternatives.push('allinclusive')
      }

      return availableAlternatives
    },

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


</style>