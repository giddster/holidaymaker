<template>
<div class="hotelHeader">
    <h2 v-if="filteredHotels.length > 0">Your results for CITY, COUNTRY</h2>
    <h2 v-else><i>Sorry, we couldn't find hotels for that search!</i></h2>
</div>


<div class="parent">
    <div class="filter-div"> 
        <input type="checkbox" id="hasPool" name="hasPool"  v-model="hasPool">
        <label for="hasPool">Pool</label>
        <input type="checkbox" id="hasSeaSide" name="hasSeaSide"  v-model="hasSeaSide">
        <label for="hasSeaSide">Seaside</label><br>

    </div>

    <div>
        <search-results-hotels :hotels="filteredHotels"></search-results-hotels>
    </div>

</div>


</template>

<script>
import SearchResultsHotels from '../components/SearchResultsHotels.vue';


export default {
components: { SearchResultsHotels },
data(){
    return{

        hasPool: false,
        hasSeaSide: false,
    }
},

computed: {
   

    hotels(){
        
        return this.$store.state.filteredHotels
            
    },
    
    filteredHotels(){
        let result = this.hotels
        .filter((hotel) => !this.hasPool || hotel.hasPool === this.hasPool)
        .filter((hotel) => !this.hasSeaSide || hotel.hasSeaSide === this.hasSeaSide)
        

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

</style>