<template>
<div class="parent hotel-header">
  <div class="div1"> 
    <h3 class="hotel-title">HOTEL NAME</h3>
    <i class="fas fa-star star-rating-about"></i>
    <i class="fas fa-star star-rating-about"></i>
    <hr>
    <i class="fas fa-heart addtofavorite-button"></i> <i>Add to Favorites</i> 
  </div>

  <div class="div2"> 
     <h4 class="prices-title">Prices from: XXX SEK</h4>
    <button class="btn btn-lg btn-primary selectrooms-button">Select rooms</button>
  </div>

  <div class="div3"> 
        <img src='../assets/logo.png' class="thumbnail">
  </div>

  <div class="div4"> 
      REVIEW SUMMARY
  </div>

  <div class="div5"> 
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque, dolorem quis? Voluptates atque, necessitatibus nam quos officia ratione aspernatur rerum sapiente quam iure deleniti asperiores quidem tenetur ex alias officiis.</p>
      <i class="fas fa-wifi bool-icon"></i> Has Wi-fi
      <i class="fas fa-paw bool-icon"></i> Pets allowed
      <i class="fas fa-utensils bool-icon"></i> Has restaurant
      <hr>
  </div>

  <div class="div6 empty-div"> 
      EMPTY
  </div>

  <div class="div7"> 
      <DRPicker class="datepicker-small" />
      <button class="btn btn-md btn-primary guests-button"> <i class="fas fa-users"></i> Guests/rooms</button>
  </div>

  <div class="div8 empty-div"> 
      EMPTY
  </div>
  
  ROOM SUGGESTION COMPONENT

</div>


</template>

<script>
import DRPicker from '@/components/DRPicker.vue'

export default {
    components: { DRPicker }
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
  font-size: 28px;
  margin-left: 10px;

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
  grid-template-rows: repeat(4, 1fr);
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
.div5 { 
  grid-area: 3 / 1 / 4 / 2; 
}
.div6 { 
  grid-area: 3 / 2 / 4 / 3; 
}
.div7 { 
  grid-area: 4 / 1 / 5 / 2; 
  width: 100%;
}
.div8 { 
  grid-area: 4 / 2 / 5 / 3; 
}
 
 /* body {
     margin: 0;
     padding: 0;
     font-family: 'Open Sans', serif;
     background: white
     
     }

     .button {
  display: inline-block;
  padding: 10px 20px;
  font-size: 18px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 12px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

input[type=text] {
  
  
  box-sizing: border-box;
  border: 0px solid black;
  background-color: #FFFFFF;
  color: #000000;
  font-family: 'Open Sans', serif;
  font-size: 18px;
  
}

input[type=number] {
  
  
  box-sizing: border-box;
  border: 0px solid black;
  background-color: #FFFFFF;
  color: #000000;
  font-family: 'Open Sans', serif;
  font-size: 18px;
  
} */

</style>