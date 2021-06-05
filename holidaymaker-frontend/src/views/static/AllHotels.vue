<template>
  <div class="hotelsview" v-for="hotel in hotels" :key="hotel.id">
        <h3>Name: {{hotel.name}}</h3>
        <p>Address: {{ hotel.address }}</p>
        <i>Description: {{ hotel.description }}</i>
    </div>
</template>

<script>
export default {
    created() {
        this.$store.dispatch('fetchHotels')
    },
    computed: {
    hotels(){
        return this.$store.state.hotels
    }
}
}
</script>

<style>
.hotelsview {
    margin: 15px auto;
    padding: 10px;
    background: rgb(246, 246, 252);
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
    max-width: 50%;
    display: flex;
}

</style>