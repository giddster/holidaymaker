<template>
    <div class="card" v-for="room in filteredRooms" :key="room.id">
        <h4>Room type: {{ room.roomType.typeName }}</h4>
            <img v-bind:src="img">
            <div class="box">
                    <p><i class="fas fa-tag"></i> {{ room.roomType.price }} SEK/night</p>
                    <p> <i class="fas fa-users"></i> {{ room.roomType.capacity }} adults </p>
                    <p><i> <i class="fas fa-bed"></i> {{ room.noOfSpareBeds }} spare bed(s) </i></p>
                    <button class="btn btn-primary">Add to booking</button>
            </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            img: 'https://www.nordicchoicehotels.se/globalassets/global/hotel-pictures/nordic-hotels-and-resorts/hotel-christiania-teater/the-hotel/enterence-hotel-christiania-teater-web.jpg?t=SmartScale%7c1024x570'
        }
    },
    computed: {
      filteredRooms() {
        return this.$store.state.filteredRooms;
      }
    },
    mounted() {
        this.$store.dispatch('fetchFilteredRooms', this.$route.params.id)
    }
}
</script>

<style scoped>
.card {
  background: rgb(246, 246, 252);
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
  padding: 20px;
  margin: 15px 10px;
  float: left;
  width: 100%;
  
}
/* .box {
    margin:0 auto; 
    width:600px;
    padding:2px;
    background:#f9f9f9;
    border:2px solid #333;
} */
img {
    overflow: hidden;
    max-width: 200px;
}

button{
    background: lightcoral;
    border: 1px solid lightcoral;
}
button:hover{
    background: rgb(246, 114, 114);
    border: 1px solid lightcoral;
}
</style>