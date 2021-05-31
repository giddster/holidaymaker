<template>
    <div class="card">
        <h3>Classic double room</h3>
            <img v-bind:src="img">
        <div class="form">
            <p>Options: </p>
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
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
  padding: 1rem;
  margin: 2rem auto;
  max-width: 100rem;
}
.form{
    overflow:hidden;
    position:relative;
    left:250px;
    bottom: 80px;
    border-style: solid;
    border-width: 1px;
    width: fit-content;
    padding: 1rem;

}
img {
    position:relative;
    top: 30px;
    max-width: 200px;
}
h3{
    position: relative;
    top:30px;
    font-size: 15px;
    margin-left: 30px;
}
button{
    margin-left: 30rem;
}
</style>