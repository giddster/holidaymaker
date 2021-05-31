<template>
<div class="parent hotel-header">
  <div class="div1"> 
    <h4 class="hotel-title">HOTEL NAME</h4>
    <i class="fas fa-star star-rating-about"></i>
    <i class="fas fa-star star-rating-about"></i>
    <p></p>
    
    <hr>
    <i class="fas fa-heart addtofavorite-button"></i> <i>Add to Favorites</i> 
  </div>

  <div class="div2"> 
     <h5 class="prices-title">Prices from: XXX SEK</h5>
    <button class="btn btn-lg btn-primary selectrooms-button">Select rooms</button>
  </div>

  <div class="div3"> 
        <img src='../assets/logo.png'>
  </div>

  <div class="div4"> 
      REVIEW SUMMARY
  </div>

  <div class="div5"> 
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque, dolorem quis? Voluptates atque, necessitatibus nam quos officia ratione aspernatur rerum sapiente quam iure deleniti asperiores quidem tenetur ex alias officiis.</p>
      
      <i class="fas fa-wifi bool-icon"><p class="icon-description">Has Wi-fi</p></i>  
      <i class="fas fa-water bool-icon"><p class="icon-description">Seaside</p></i> 
      <i class="fas fa-swimming-pool bool-icon"><p class="icon-description">Swimming pool</p></i> 
      <i class="fas fa-utensils bool-icon"><p class="icon-description">Restaurant</p></i> 
      <i class="fas fa-cocktail bool-icon"><p class="icon-description">Bar</p></i>
      <i class="fas fa-concierge-bell bool-icon"><p class="icon-description">Room Service</p></i> 
      <i class="fas fa-gamepad bool-icon"><p class="icon-description">Kids' Club</p></i> 
      <i class="fas fa-music bool-icon"><p class="icon-description">Entertainment</p></i> 
      
      <br>
      <br>
      <i>DISTANCE TO BEACH: xxx km</i> |
      <i>DISTANCE TO CITY CENTER: xxx km</i>
     
      <hr>
  </div>

  <div class="div6 empty-div"> 
      EMPTY
  </div>

  <div class="div7"> 
      <DRPicker class="datepicker-small" />
      <button class="btn btn-md btn-primary guests-button datepicker-small"> <i class="fas fa-users"></i> Guests</button>
      <hr>
  </div>

  <div class="div8 empty-div"> 
      EMPTY
  </div>
  
  <RoomSuggestor />
  ROOM SUGGESTION COMPONENT

</div>


</template>

<script>
import DRPicker from '@/components/DRPicker.vue'
import RoomSuggestor from '@/components/RoomSuggestor.vue'

export default {
    components: { DRPicker, RoomSuggestor }
}
</script>


<style>

.hotel-title {
  float: left;
}

.star-rating-about {
  font-size: 28px;
  margin-left: 10px;
  color: red;
}

.addtofavorite-button {
  color: red;
  font-size: 28px;
  float: left;
  margin-right: 10px;
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

.bool-icon {
  font-size: 25px;
  margin-left: 10px;
  color: rgb(38, 177, 38);
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
  max-width: 800px;
  height: 500px;
  border: 1px solid black;
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