<template>
<!-- - return available hotels based on given date and amount of guests (iterate with v-for)
    -in available hotels:
            - icons for bools
            - review average
            - star rating
            - thumbnail pic
- "book now" button for each hotel option
- filter component -->
<h2 class="hotelHeader">Your results for CITY, COUNTRY</h2>
<div class="searchResults">
    <div v-if="hotels.length">
        <div v-for="hotel in hotels" :key="hotel.id" class="hotel">
            <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/be20d200-7fa2-43f4-8c17-ab167713a192/d3grdej-3841bb5c-32de-499f-8257-f5b1a65b9a9c.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2JlMjBkMjAwLTdmYTItNDNmNC04YzE3LWFiMTY3NzEzYTE5MlwvZDNncmRlai0zODQxYmI1Yy0zMmRlLTQ5OWYtODI1Ny1mNWIxYTY1YjlhOWMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.khDCe72TGQY8N36P4w3V0a4A6xAdJteypPkEzEnEXbc" alt="a" class="thumbnail">
            <h4> {{ hotel.name}}</h4>
            <p> Id: {{ hotel.id}}</p>
        </div>
    </div>
    <div v-else> Loading hotels in CITY, COUNTRY...</div>
    
    
    
</div>
</template>

<script>
export default {

computed: {
    hotels(){
        return this.$store.state.hotels
    },
    hotelImages() {
    }
},
mounted() {
    this.$store.dispatch('fetchHotels')
}

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
        border-radius: 20px;
    }

    .hotelHeader{
        text-align: center;
    }

    .thumbnail {
        border: 1px solid #ddd;
        padding: 5px; 
        width: 150px; 
    }

</style>