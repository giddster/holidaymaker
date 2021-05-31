<template>
    <div class="card">
        <h3>Classic double room</h3>
            <img v-bind:src="img">
            <div class="box">
                <button class="btn btn-primary">Book now</button>
            </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            img: 'https://www.nordicchoicehotels.se/globalassets/global/hotel-pictures/nordic-hotels-and-resorts/hotel-christiania-teater/the-hotel/enterence-hotel-christiania-teater-web.jpg?t=SmartScale%7c1024x570'
        }
    }
}
</script>

<style scoped>
.card {
  background: rgb(246, 246, 252);
  position: relative;
  right: 800px;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
  padding: 1rem;
  margin: 2rem auto;
  max-width:70rem;
  
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
    position:relative;
    max-width: 200px;
}
h3{
    position: relative;
    font-size: 15px;
    margin-left: 30px;
}
button{
    margin-left: 30rem;
    background: lightcoral;
    border: 1px solid lightcoral;
}
button:hover{
    background: rgb(246, 114, 114);
    border: 1px solid lightcoral;
}
</style>