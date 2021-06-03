<template>
<div class="parent hotel-header" ref="top">
  <div class="div1"> 
    <h4 class="hotel-title">{{ thishotel.name }}</h4>
    
    <star-rating @rating-selected ="setRating"
                :round-start-rating="false"
                :star-points="[23,2, 14,17, 0,19, 10,34, 7,50, 23,43, 38,50, 36,34, 46,19, 31,17]"
                :border-width="2"
                :clearable="true"
                active-on-click
                animate
                :padding="0"
        >
     
        </star-rating>
   
  </div>

  <div class="div2"> 
    <button @click="scrollToSuggestions('roomsuggestor')" class="btn btn-lg btn-primary selectrooms-button">Select rooms</button>
    <button @click="addToFavorites" class="btn btn-lg btn-primary addtofavorite-button"><i class="fas fa-heart heart-icon"></i> Add to Favorites</button>
  </div>

  <div class="div3">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner" style="border: 1px solid black">
        <div class="carousel-item active" v-if="filteredImages.length !== 0" style="text-align: center">
          <img class="image-container" :src="filteredImages[0].ImageLink" style="object-fit: cover">
        </div>
        <div class="carousel-item" v-for="image in filteredImages" :key="image" style="text-align: center">
          <img class="image-container" :src="image.ImageLink" style="object-fit: cover">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev" style="width: 75px">
        <span class="carousel-control-arrowprev" style="" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next" style="width: 75px">
        <span class="carousel-control-arrownext" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
</div>

  <div class="div4"> 
      <OutputReview />
  </div>

  <div class="div5"> 
      <p>Address: {{ thishotel.address }}, {{ thishotel.zipCode }} </p>
      <p><i>{{thishotel.description}}</i></p> <br>

      <b>Available amenities: </b> <br>
      <i class="fas fa-wifi bool-icon"><p class="icon-description">Wi-fi</p></i>  
      <i class="fas fa-water bool-icon"><p class="icon-description">Seaside</p></i> 
      <i class="fas fa-swimming-pool bool-icon"><p class="icon-description">Pool</p></i> 
      <i class="fas fa-utensils bool-icon"><p class="icon-description">Restaurant</p></i> 
      <i class="fas fa-concierge-bell bool-icon"><p class="icon-description">Room Service</p></i> 
      <i class="fas fa-gamepad bool-icon"><p class="icon-description">Kids' Club</p></i> 
      <i class="fas fa-music bool-icon"><p class="icon-description">Entertainment</p></i> 
      
      <br>
      <br>
      <i class="fas fa-umbrella-beach distance-icon"><i> Distance to the beach: {{ thishotel.distanceToBeach }} km </i></i>
      <br>
      <i class="fas fa-city distance-icon"><i> Distance to city center: {{ thishotel.distanceToCityCenter }} km </i></i>
      
     
  </div>

  <div class="div6 empty-div"> 
      EMPTY
  </div>

  <div class="div7"> 
      <!-- <h4>Your trip: </h4>
      <DRPicker class="datepicker-small" />
      <button class="btn btn-md btn-primary guests-button datepicker-small"><i class="fas fa-users"></i>Guests</button>
      <hr> -->
      
  </div>

  <div class="div8 empty-div"> 
      EMPTY
  </div>
    
  
</div>

<div class="roomsuggestor-parent" ref="roomsuggestor">
    <div class="roomsuggestor-child"> 
      <button @click="scrollToTop('top')" class="btn btn-md btn-primary backtotop-button">Back to top</button>
      <h4 class="roomsuggestor-title">Available rooms </h4>
      <RoomSuggestor />
      <button @click="scrollToTop('top')" class="btn btn-md btn-primary backtotop-button">Back to top</button>
    </div>

  </div>

</template>

<script>
import DRPicker from '@/components/DRPicker.vue'
import RoomSuggestor from '@/components/RoomSuggestor.vue'
import OutputReview from '../components/OutputReview.vue'
import StarRating from '@/components/StarRating.vue'

export default {
  components: { DRPicker, RoomSuggestor, StarRating, OutputReview },
  methods: {
    scrollToSuggestions(refName){
      var element = this.$refs[refName];
      var top = element.offsetTop;

      window.scrollTo(0, top);
    },
    scrollToTop(refName){
      var element = this.$refs[refName];
      var top = element.offsetTop;

      window.scrollTo(0, top);
    }
  },

  computed: {
      thishotel() {
        return this.$store.state.thisHotel;
      },
      images() {
        return this.$store.state.hotelImages
      },
      filteredImages() {
        let images = this.$store.state.hotelImages;
        let filteredImages = []
        let image;

        for(image of images){
          if (image.HotelId == this.thishotel.id){
            filteredImages.push(image);
          }
        }
        return filteredImages;
      }
    },
    
    created() {
      this.$store.dispatch('fetchThisHotel', this.$route.params.id)
    },
}
</script>


<style>
.parent.hotel-header {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: repeat(1, 1fr);
  grid-column-gap: 0px;
  grid-row-gap: 0px;
  background: rgb(246, 246, 252);
  margin: 20px auto;
  padding: 12px;
  max-width: 80%;
  border:black;
  border-style: solid;
  border-width: thin;
  border-radius: 10px;
}

.empty-div {
  visibility: hidden;
}

.div1 { 
  grid-area: 1 / 1 / 2 / 2; 
  padding-bottom: 10px;
}
.div2 { 
  grid-area: 1 / 2 / 2 / 3; 
}
.div3 { 
  grid-area: 2 / 1 / 3 / 2;
}
.div4 { 
  grid-area: 2 / 2 / 3 / 3; 
  margin: auto;
}
.div5 { 
  grid-area: 3 / 1 / 4 / 2; 
}
.div6 { 
  grid-area: 3 / 2 / 4 / 3; 
}
.div7 { 
  grid-area: 4 / 1 / 5 / 4; 
}
.div8 { 
  grid-area: 4 / 2 / 5 / 3; 
 
}

.image-container {
  width: 600px;
  height: 300px;
  object-fit: cover;
}

.carousel-control-arrowprev:after {
  content: '<';
  font-size: 30px;
  font-weight: bold;
  color: lightcoral;
}

.carousel-control-arrownext:after {
  content: '>';
  font-size: 30px;
  font-weight: bold;
  color: lightcoral;
}

.hotel-title {
  float: left;
}

.star-rating-about {
  font-size: 28px;
  margin-left: 10px;
  color: red;
}

.heart-icon {
  color: red;
}

.addtofavorite-button {
  float: right;
  margin-right: 20px;
  background: lightcoral;
  border-radius: 5px;
  border: 1px solid lightcoral;
}

.addtofavorite-button:hover {
  color: lightcoral;
}

.prices-title {
  text-align: right;
}

.selectrooms-button {
  margin: 0 auto;
  float: right;
  background: lightcoral;
  border-radius: 5px;
  border: 1px solid lightcoral;
}

.backtotop-button{
  float: right;
  margin: 0 auto;
  background: lightcoral;
  border-radius: 5px;
  border: 1px solid lightcoral;
}

.bool-icon {
  font-size: 25px;
  margin-left: 10px;
  color: rgb(38, 177, 38);
  border: 1px solid black;
  border-style: hidden;
  text-align: center;
}

.distance-icon {
  font-size: 18px;
  margin-left: 10px;
  padding: 10px;
  color:lightcoral;
  border: 1px solid black;
  border-style: hidden;
  text-align: center;
}

.icon-description {
  font-size: 14px;
  margin-right: 10px;
  color: rgb(41, 148, 41);
  font-family: sans-serif;
  font-weight: lighter;
  margin-top: 5px;
}

.datepicker-small {
  display: inline-flex;
}

.guests-button {
  margin-left: 10px;
}

 

.roomsuggestor-title{
  text-align: left;
}

.roomsuggestor-parent {
display: grid;
grid-template-columns: 1fr;
grid-template-rows: 1fr;
grid-column-gap: 0px;
grid-row-gap: 0px;
background: rgb(252, 232, 234);
margin: 20px auto;
padding: 12px;
max-width: 80%;
border:black;
border-style: solid;
border-width: thin;
border-radius: 10px;
}


.roomsuggestor-child{ 
  grid-area: 1 / 1 / 2 / 2; 
  padding-bottom: 10px;
}
.div2 { 
  grid-area: 1 / 2 / 2 / 3; 
}
.div3 { 
  grid-area: 2 / 1 / 3 / 2;
  margin-bottom: 20px;
}
.div4 { 
  grid-area: 2 / 2 / 3 / 3; 
  margin: auto;
}
.div5 { 
  grid-area: 3 / 1 / 4 / 2; 
}
.div6 { 
  grid-area: 3 / 2 / 4 / 3; 
}
.div7 { 
  grid-area: 4 / 1 / 5 / 2; 
}
.div8 { 
  grid-area: 4 / 1 / 5 / 3; 
}
</style>