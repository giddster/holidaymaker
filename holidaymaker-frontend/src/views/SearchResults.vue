<template>
<h2 v-if="filteredHotels.length" class="hotelHeader">Your results for CITY, COUNTRY</h2>
<h2 v-else class="hotelHeader"><i>Sorry, we couldn't find hotels in that city!</i></h2>

<div class="parent">
    <div class="filter-div"> 
        FILTER COMPONENT
    </div>

    <div class="results-div"> 
            <div v-for="hotel in filteredHotels" :key="hotel.id" class="hotel">
                <button @click="redirect" class="btn btn-md btn-primary booking-button">Book a room</button>
                <img src='../assets/logo.png' class="thumbnail">
                <h4 class="hotel-name"> {{ hotel.name }}</h4>
                <i class="fas fa-star star-rating"></i>
                <p class="hotel-description"> <i>{{ hotel.description }}</i> </p>
            </div>
    </div>

</div>


</template>

<script>
export default {

methods: {
    redirect() {
        this.$router.push({ name: 'AboutHotel' })
        this.$store.dispatch('search', this.searchString)
     }
},
computed: {
    filteredHotels(){
        return this.$store.state.filteredHotels
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
    margin: 25px 0;
    float: left;
    background: rgb(246, 246, 252);
    border-radius: 15px;
    padding: 10px;
}

.hotel-name {
    float: left;
    margin-left: 10px;
}


.thumbnail {
    border: 1px solid #ddd;
    padding: 5px; 
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
    margin: 30px auto;
}

.booking-button {
    margin: 0 auto;
    float: right;
    background: lightcoral;
    border-radius: 5px;
    border: 1px solid lightcoral;
}

</style>