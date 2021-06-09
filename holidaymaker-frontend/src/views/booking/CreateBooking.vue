<template>
  <div class="bookingdetails-parent">
    <div class="bookingdetails-heading">
      <h2>Your booking details</h2>
      <hr/>
    </div>
    
    <div class="bookingdetails-customer"> 
      <h4><i class="fas fa-user-alt"></i> Customer details</h4>
      <p>First name: {{getCustomerDetails.firstName}}</p>
      <p>Last name: {{getCustomerDetails.lastName}}</p>
      <p>Address: {{getCustomerDetails.address}}</p>
      <p>E-mail: {{getCustomerDetails.email}}</p>
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
        <i class="asterisk-text">*Our flights always depart on your given checkin and checkout dates.</i>
      
          <br>
          <br>

        <label for="mealplan"><i class="fas fa-utensils"></i> Meal plan*</label> &nbsp;
        <select id="mealplan" class="form-control options-selector" @change="chosenMealPlan($event)">
          <option v-for="item in mealPlanAlternatives" :key="item" :value="item" id="mealplan-item" :text="correctText(item)"></option>
        </select>
        <i class="asterisk-text">*A continental breakfast is always included at our partner hotels</i>
    </div>

    <div class="bookingdetails-rooms">
        <h4><i class="fas fa-door-open"></i> Room(s) </h4>
        <hr>
        <div v-for="(room, index) in selectedRooms" :key="room" class="eachroom-box">
            <i>Room {{index + 1}}</i>
            <p>Room number: <b>{{ room.roomNo }}</b> </p>
              
            <label for="guestsperroom"><i class="fas fa-users"></i> Amount of guests </label> &nbsp;
            <select id="guestsperroom" class="form-control options-selector" @change="chosenNumberOfGuests($event, index)">
                <option v-for="guests in room.roomType.capacity" :key="guests" :value="guest">{{guests}}</option>
            </select>

            <label for="sparebedsperroom"><i class="fas fa-bed"></i> Amount of spare beds </label> &nbsp;
            <select id="sparebedsperroom" class="form-control options-selector" @change="chosenNumberOfSpareBeds($event, index)">
                <option value="0">0</option>
                <option v-for="spareBed in room.noOfSpareBeds" :key="spareBed" :id="'test'+index" :value="spareBed">{{spareBed}}</option>
            </select>
        </div>
    </div>
    

    <div class="booking-price">
        <h4>Price for booking</h4>
        <h5>Room(s): {{selectedRooms.length}}</h5>
        <div v-for="(room, index) in selectedRooms" :key="room"> 
        <p>Room {{index + 1}}: {{ room.roomType.price }} SEK * {{lengthOfStay}} nights  = {{room.roomType.price * lengthOfStay}} SEK</p> 
        </div>
        <p>Spare beds({{calculatedNumberOfSpareBeds}}) * {{spareBedPrice}} SEK = {{calculatePriceForSpareBeds}} SEK</p>
        <hr>
        <h5>Options:</h5>
        <p>Flight: {{flightCost}} SEK</p>
        <p>Meal plan: {{mealplanCost}} SEK</p>
        
        <hr>

        <h5><b>Total: {{totalCost}} SEK</b></h5>

        <div class="payment-buttons">
            <router-link to="/" class="btn btn-lg btn-danger" style="margin-right:10px;">Cancel booking</router-link>
            <Payment />

            <button class="btn" @click="PostBooking"></button>
        </div>
        
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
      spareBedPrice: 300, // change this to change the price for a single spare bed
      totalSpareBedCost: 0,
      selectionOfGuests: [0],
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
//#region Meal Plan Methods
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
        this.mealplanCost = 200 * this.lengthOfStay;
      } 
      else if(event.target.value === 'fullpension') {
        this.mealplanCost = 400 * this.lengthOfStay;
      } 
      else if(event.target.value === 'allinclusive') {
        this.mealplanCost = 700 * this.lengthOfStay;
      }
      else {
        this.mealplanCost = 0;
      }
    },
//#endregion Meal Plan Methods
    
    chosenNumberOfGuests(event, index){
      this.selectionOfGuests[index] = event.target.value
    },

    chosenNumberOfSpareBeds(event, index){
      this.selectionOfSpareBeds[index] = event.target.value
    },

    // dispatchPostBooking(data){
    //   let data = this.PostBooking()
    //   this.$store.dispatch('postBooking', data)
    // },

    async PostBooking() {
      // this.$store.state.tempBooking.checkInDate = dates.checkInDate
        //this.$store.state.tempBooking.totalCost = this.totalCost

      //await this.$store.dispatch('postBooking')
      // let dates = this.$store.state.dates
        let bookingXroom = []
  
        for(let room of this.selectedRooms) {
          bookingXroom.push(room.id)
        }

      let booking = {
        checkInDate: new Date(this.$store.state.dates.checkinDate),
        checkOutDate: new Date(this.$store.state.dates.checkoutDate),
        noOfAdults: this.calculatedNoOfGuests,
        totalPrice: 10,
        customerId: this.getCustomerDetails.id,

        isReturnFlight: this.getIfReturnFlight,
        price: this.flightCost,

        bookingXroom: this.bookingXroom
      }


      console.log(booking)

      this.$store.dispatch('postBooking', booking)


      //return this.booking
      // this.$store.state.tempBooking = this.booking
      
      

    },
  },
  
  computed: {
    // async PostBooking() {
    //   // this.$store.state.tempBooking.checkInDate = dates.checkInDate
    //     //this.$store.state.tempBooking.totalCost = this.totalCost

    //   //await this.$store.dispatch('postBooking')

    //   let booking = {
    //     checkInDate: this.dates.checkInDate,
    //     checkOutDate: this.dates.checkOutDate,
    //     noOfAdults: this.calculatedNoOfGuests,
    //     totalPrice: this.totalCost,
    //     customerId: this.getCustomerDetails.id,

    //     isReturnFlight: this.getIfReturnFlight,
    //     price: this.flightCost,

    //     bookingXroom: this.bookingXroom
    //   }

    //   let bookingXroom = []

    //   for(let room of this.selectedRooms) {
    //     bookingXroom.push(room.id)
    //   }

    //   console.log(booking)
    //   this.$store.state.tempBooking = this.booking
      
      

    // },
//#region Spare Beds Computed
    calculatedNumberOfSpareBeds(){
      let number = 0;
      let numberOfSpareBeds = 0;

      if (this.selectionOfSpareBeds !== undefined){
        for (let i of this.selectionOfSpareBeds){
          number = parseInt(i)
          numberOfSpareBeds += number
        }
      }
        return numberOfSpareBeds
    },

    calculatedNoOfGuests() {
      let totalNoOfGuests;
      for(let i of this.selectionOfGuests) {
        totalNoOfGuests += parseInt(i)
      }

      return totalNoOfGuests
    },

    // Calculates the total price for spare beds depending on the users choices
    calculatePriceForSpareBeds(){
      let numberOfSpareBeds = 0
      let totalSpareBedCost = 0
      let number = 0;

      if (this.selectionOfSpareBeds !== undefined){
        for (let i of this.selectionOfSpareBeds){
          number = parseInt(i)
          numberOfSpareBeds += number
      }
      
      totalSpareBedCost = numberOfSpareBeds * this.spareBedPrice

      return totalSpareBedCost
      }
    },

    getCustomerDetails() {
      return this.$store.state.customers
    },

    getIfReturnFlight() {
      if(this.flightCost === 1000) {
        return false
      }
      else {
        return true
      }
    },

    
//#endregion Spare Beds Computed

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

      for(let room of this.selectedRooms){
        this.roomCost += room.roomType.price * this.lengthOfStay
      }

      this.$store.state.totalBookingPrice.price = this.roomCost + this.flightCost + this.mealplanCost + this.calculatePriceForSpareBeds;
      console.log(this.$store.state.totalBookingPrice.price)
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
.bookingdetails-parent {
display: grid;
background-color: whitesmoke;
grid-template-columns: 50% 50%;
grid-template-rows: 1fr auto auto auto auto;
grid-column-gap: 0px;
grid-row-gap: 0px;
padding: 10px;
max-width: 70%;
height: auto;
margin: 40px auto;
border:darkgrey;
border-style: solid;
border-width: thin;
border-radius: 10px;
}

.bookingdetails-heading {
  grid-column: 1 /span 2;
  grid-row: 1;
  text-align: center;
  width: 100%;
}

.bookingdetails-customer { 
  grid-column: 1;
  grid-row: 2; 
  padding: 10px;
}
.bookingdetails-trip { 
  grid-column: 1;
  grid-row: 3;
  padding: 10px;
}
.bookingdetails-options { 
  grid-column: 1;
  grid-row: 4;
  padding: 10px;
}
.bookingdetails-rooms { 
  grid-column: 1 / span 2;
  grid-row: 5;
  padding: 10px;
  margin: auto 0;
}

.eachroom-box {
grid-column: 1 / span 2;
grid-row: 5;
margin: 2% 2%;
display: inline-block;
}

.booking-price {
  grid-column: 2;
  grid-row: 2 / span 3;
  padding: 20px;
  margin: 0px auto;
  text-align: center;
  max-width: fit-content;
}

.asterisk-text {
  font-size: 12px;
}

.options-selector {
  max-width: 210px;
  max-height: 40px;
}

h4 {
  color: lightcoral;
}

</style>