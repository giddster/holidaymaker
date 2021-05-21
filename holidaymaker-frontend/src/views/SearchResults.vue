<template>
<!-- - return available hotels based on given date and amount of guests (iterate with v-for)
    -in available hotels:
            - icons for bools
            - review average
            - star rating
            - thumbnail pic
- "book now" button for each hotel option
- filter component -->
<sorting-component></sorting-component>
<search-result-component></search-result-component>
<div>
    <ul>
        <li v-for="destination in destinations" :key="destination">
            City: {{destination.city}}                                                          
            Country: {{destination.country}}
        </li>
    </ul>

    <ul>
        <li v-for="hotel in hotels" :key="hotel">
            Id: {{hotel.id}}                                                          
            Name: {{hotel.name}}
        </li>
    </ul>
    
</div>



</template>


<script>
import SearchResultComponent from '../components/searchResultComponent.vue';
import SortingComponent from '../components/SortingComponent.vue';

export default {
components:{
    SortingComponent,
    SearchResultComponent

},


computed: {
    destinations(){
        return this.$store.state.destinations;
    },
    hotels(){
        return this.$store.state.hotels;
    },
}
}
</script>
