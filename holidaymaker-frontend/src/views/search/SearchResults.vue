<template>
<div class="hotelHeader">
    <h2 v-if="filteredHotels.length > 0">Your results for "{{ search }}"</h2>
    <h2 v-else><i>Sorry, we couldn't find hotels for that search!</i></h2>
</div>


<div class="parent">
        <div class="form">
            <div class="filter-div"> 
                <div class="checkboxes">
                    <input type="checkbox" id="hasPool" name="hasPool"  v-model="hasPool">
                    <label for="hasPool">Pool</label>
                    <input type="checkbox" id="hasSeaSide" name="hasSeaSide"  v-model="hasSeaSide">
                    <label for="hasSeaSide">Seaside</label><br>

                    <input type="checkbox" id="hasEntertainment" name="hasEntertainment" v-model="hasEntertainment">
                    <label for="hasEntertainment">Entertainment</label>
                    <input type="checkbox" id="hasKidsClub" name="hasKidsClub" v-model="hasKidsClub">
                    <label for="hasKidsClub">Kids Club</label><br>

                    <input type="checkbox" id="hasRestaurant" name="hasRestaurant" v-model="hasRestaurant">
                    <label for="hasRestaurant">Restaurant</label>
                    <input type="checkbox" id="hasHalfPension" name="hasHalfPension" v-model="hasHalfPension">
                    <label for="hasHalfPension">Half Pension</label><br>

                    <input type="checkbox" id="hasWholePension" name="hasWholePension" v-model="hasWholePension" >
                    <label for="hasWholePension">Whole Pension</label>
                    <input type="checkbox" id="hasAllInclusive" name="hasAllInclusive" v-model="hasAllInclusive" >
                    <label for="hasAllInclusive">All inclusive</label><br>

                    <input type="checkbox" id="hasWifi" name="hasWifi" v-model="hasWifi">
                    <label for="hasWifi">Wifi</label>
                    <input type="checkbox" id="hasRoomService" name="hasRoomService" v-model="hasRoomService">
                    <label for="hasRoomService">Roomservice</label>

                </div>
                <h3>Price per night: </h3>
                    <div class="slider">
                        <input type="range" min="1" max="5000" v-model="value">
                        <p>{{value}}</p>
                    </div>
                    <h3>Star rating</h3>
                    <div class="star-rating">
                        <input type="radio" id="5-stars" name="rating" value="5" />
                        <label for="5-stars" class="star">&#9733;</label>
                        <input type="radio" id="4-stars" name="rating" value="4" />
                        <label for="4-stars" class="star">&#9733;</label>
                        <input type="radio" id="3-stars" name="rating" value="3" />
                        <label for="3-stars" class="star">&#9733;</label>
                        <input type="radio" id="2-stars" name="rating" value="2" />
                        <label for="2-stars" class="star">&#9733;</label>
                        <input type="radio" id="1-star" name="rating" value="1" />
                        <label for="1-star" class="star">&#9733;</label>
                    </div>
                    <h3>Guest rating</h3>
                    <div class="slider">
                        <input type="range" min="1" max="10" v-model="value2">
                        <p>{{value2}}</p>
                    </div>
                
            </div>
        </div>
    <div>
        <search-results-hotels :hotels="filteredHotels"></search-results-hotels>
    </div>

</div>


</template>

<script>
import SearchResultsHotels from '@/components/search/SearchResultsHotels.vue';


export default {
components: { SearchResultsHotels },
data(){
    return{

            value2: 0,
            value: 0,

        hasPool: false,
        hasSeaSide: false,
        hasEntertainment: false,
        hasKidsClub: false,
        hasRestaurant: false,
        hasHalfPension: false,
        hasWholePension: false,
        hasAllInclusive: false,
        hasWifi: false,
        hasRoomService: false


    }
},

computed: {
   
   search() {
            return this.$store.state.search
    },

    hotels(){
        
        return this.$store.state.filteredHotels
            
    },
    
    filteredHotels(){
        let result = this.hotels
        .filter((hotel) => !this.hasPool || hotel.hasPool === this.hasPool)
        .filter((hotel) => !this.hasSeaSide || hotel.hasSeaSide === this.hasSeaSide)
        .filter((hotel) => !this.hasEntertainment || hotel.hasEntertainment === this.hasEntertainment)
        .filter((hotel) => !this.hasKidsClub || hotel.hasKidsClub === this.hasKidsClub)
        .filter((hotel) => !this.hasRestaurant || hotel.hasRestaurant === this.hasRestaurant)
        .filter((hotel) => !this.hasHalfPension || hotel.hasHalfPension === this.hasHalfPension)
        .filter((hotel) => !this.hasWholePension || hotel.hasWholePension === this.hasWholePension)
        .filter((hotel) => !this.hasAllInclusive || hotel.hasAllInclusive === this.hasAllInclusive)
        .filter((hotel) => !this.hasWifi || hotel.hasWifi === this.hasWifi)
        .filter((hotel) => !this.hasRoomService || hotel.hasRoomService === this.hasRoomService)
        return result;
        // .filter((hotel) => hotel.hasSeaSide === this.hasSeaSide)
        
    }
},


}
</script>

<style>
    .parent {
        display: grid;
        grid-template-columns: 1fr 3fr;
        grid-template-rows: 1fr;
        grid-column-gap: 0px;
        grid-row-gap: 0px;
}

.filter-div { 
    grid-area: 1 / 1 / 2 / 2; 
    
}
.results-div { 
    grid-area: 1 / 2 / 2 / 3; 
    margin: 0 auto;
    padding: 10px;
}

.hotelHeader{
    text-align: center;
}

.hotel {
    margin: 20px auto;
    float: left;
    background: rgb(246, 246, 252);
    border-radius: 15px;
    padding: 10px;
    width: 60%;
}

.hotel-name {
    float: left;
    margin-left: 10px;
}

.thumbnail {
    border: 1px solid #ddd;
    padding: 5px; 
    margin-right: 10px;
    width: 150px; 
    float: left;
}

.star-rating {
    font-size: 28px;
    color: red;
    margin-left: 10px;
}

.hotel-description {
    text-align: left;
    margin: 10px 25px;
}

.booking-button {
    margin: 0 auto;
    float: right;
    background: lightcoral;
    border-radius: 5px;
    border: 1px solid lightcoral;
}
.form {
    position: relative;
    z-index: 1;
    background:  rgb(246, 246, 252);
    max-width: 360px;
    margin: 0 auto 100px;
    padding: 45px;
    text-align: center;
    border: solid;
    border-width: 1px;
    
}
/* .form input[type=checkbox]{
    font-family: "Roboto", sans-serif;
    outline:1;
    background: #f2f2f2;
    border:0;
    margin:0 0 15px;
    padding: 15px;
    box-sizing: border-box;
    font-size: 14px;

} */
input[type=checkbox]{
    vertical-align: middle;
    position:relative;
    bottom: 1px;
}
.checkboxes{
    text-align: left;
}
.checkboxes input{
    margin: 0px 0px 0px 0px;
}
.checkboxes label{
    margin: 0px 15px 0px 3px;
}
.slider{
    text-align: left;
    

}
h3{
    font-size: 15px;
    text-align: left;
    padding:0px;
}
.star-rating {
  border:solid 1px #ccc;
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

/* explanation */

article {
  background-color:#ffe;
  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
  color:#006;
  font-family:cursive;
  font-style:italic;
  margin:4em;
  max-width:30em;
  padding:2em;
}

</style>