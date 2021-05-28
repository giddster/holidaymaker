<template>
<h2 v-if="filteredHotels.length" class="hotelHeader">Your results for CITY, COUNTRY</h2>
<h2 v-else class="hotelHeader"><i>Sorry, we couldn't find hotels in that city!</i></h2>


<div class="searchResults">
    <div>
        <div v-for="hotel in filteredHotels" :key="hotel.id" class="hotel">
            <img src='../assets/logo.png' class="thumbnail">
            <h4> {{ hotel.name }}</h4>
            <i class="fas fa-star star-rating"></i>
            <p> <i>{{ hotel.description }}</i> </p>
        </div>
    </div>
    
</div>
</template>

<script>
export default {

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

<style scoped>
    .searchResults {
        max-width: 100%;
        margin: 0 auto;
        padding: 10px;
    }
    .hotel {
        max-width: 40%;
        margin: 25px auto;
        background: rgb(246, 246, 252);
        border-radius: 15px;
        padding: 10px;
    }

    .hotelHeader{
        text-align: center;
    }

    .thumbnail {
        border: 1px solid #ddd;
        padding: 5px; 
        width: 150px; 
    }

    .star-rating {
        font-size: 20px;
    }

</style>