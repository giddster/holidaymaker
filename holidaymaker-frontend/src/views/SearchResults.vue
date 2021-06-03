<template>
<div class="hotelHeader">
    <h2 v-if="filteredHotels.length">Your results for CITY, COUNTRY</h2>
    <h2 v-else><i>Sorry, we couldn't find hotels for that search!</i></h2>
</div>


<div class="parent">
    <div class="filter-div"> 
        <FilterComponent @change-filter="setFilters"/>
    </div>

    <div class="results-div"> 
            <div v-for="hotel in filteredHotels" :key="hotel.id" class="hotel">
                <router-link :to="'/hotel/' + hotel.id" class="btn btn-md btn-primary booking-button">Book a room</router-link>
                <img src='../assets/logo.png' class="thumbnail">
                <h4 class="hotel-name"> {{ hotel.name }}</h4>
                <i class="fas fa-star star-rating"></i>
                <p class="hotel-description"> <i>{{ hotel.description }}</i> </p>
            </div>
    </div>

</div>


</template>

<script>
import FilterComponent from '@/components/FilterComponent.vue'

export default {

components: { FilterComponent },
data(){
    return{
        activeFilters: {
                hasPool: false,
                hasSeaSide: false,
                hasEntertainment: false,
                hasKidsClub: false,
                hasRestaurant: false,
                hasHalfPension: false,
                hasWholePension: false,
                hasAllInclusive: false,
                hasWifi: false,
                hasRoomService: false,
        }
    }
},
methods: {
    setFilters(updatedFilters) {
        this.activeFilters = updatedFilters;
    }
},
computed: {
    filteredHotels(){
        return this.$store.sate.filteredHotels
        // const filteredHotels = this.$store.state.filteredHotels
        // return filteredHotels.filter(hotel => {
        //     if (this.activeFilters.hasPool && hotel.includes('hasPool')) {
        //         return true;
        //     }
        //     if (this.activeFilters.hasSeaSide && hotel.includes('hasSeaSide')) {
        //         return true;
        //     }
        //     if (this.activeFilters.hasEntertainment && hotel.includes('hasEntertainment')) {
        //         return true;
        //     }
        //     if (this.activeFilters.hasKidsClub && hotel.includes('hasKidsClub')) {
        //         return true;
        //     }
        //     if (this.activeFilters.hasRestaurant && hotel.includes('hasRestaurant')) {
        //         return true;
        //     }
        //     if (this.activeFilters.hasHalfPension && hotel.includes('hasHalfPension')) {
        //         return true;
        //     }
        //     if (this.activeFilters.hasWholePension && hotel.includes('hasWholePension')) {
        //         return true;
        //     }
        //     if (this.activeFilters.hasAllInclusive && hotel.includes('hasAllInclusive')) {
        //         return true;
        //     }
        //     if (this.activeFilters.hasWifi && hotel.includes('hasWifi')) {
        //         return true;
        //     }
        //     if (this.activeFilters.hasRoomService && hotel.includes('hasRoomService')) {
        //         return true;
        //     }
        //     return false;
        // });
    },
    hotelImages() {
        return this.$store.state.hotelImages
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