<template>
<div class="hotelHeader">
    <h2 v-if="filteredHotels.length">Your results for "{{ search }}"</h2>
    <h2 v-else><i>Sorry, we couldn't find hotels for that search!</i></h2>
</div>


<div class="parent">
    <div class="filter-div"> 
        <FilterComponent />
    </div>

    <div class="results-div"> 
        <div v-for="hotel in filteredHotels" :key="hotel.id" class="hotel">
            <div class="header-div" style="margin-bot: 50px;">
                <h4 class="hotel-name" style="float: left"> {{ hotel.name }}</h4>
                <star-rating v-model:rating="hotel.starRating"> </star-rating>
                <router-link :to="'/hotel/' + hotel.id" class="btn btn-md btn-primary booking-button" style="float: right">Book a room</router-link>
            </div>
            
            <div class="picture-div" style="width: 25%">
                <img :src='Image(hotel.id)' class="thumbnail-hotel-image">
            </div>
            <div class="content-div" style="width: 75%; float: right">
                <p class="hotel-description"> <i>{{ hotel.description }}</i> </p>
            </div>
        </div>
    </div>

</div>


</template>

<script>
import FilterComponent from '@/components/FilterComponent.vue'
import StarRating from '@/components/StarRating.vue'

export default {
    
    components: { FilterComponent, StarRating },
    computed: {
        filteredHotels(){
            return this.$store.state.filteredHotels
        },
        search() {
            return this.$store.state.search
        },
        hotelImages() {
            return this.$store.state.hotelImages
        },
        checkinDate(){
            return this.$store.dates.checkinDate
        },
        checkoutDate(){
            return this.$store.dates.checkoutDate
        }
    },

    methods: {
     Image(id) {
            
            let img = [];
            let images = this.hotelImages;
            
            for(let image of images){
                if(image.HotelId == id){
                    img.push(image);
                }
            }
            return img[0].ImageLink
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

.thumbnail-hotel-image {
    border: 1px solid #ddd;
    padding: 5px; 
    margin-right: 10px;
    width: 150px;
    height: 100px;
    float: left;
    object-fit: cover;
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