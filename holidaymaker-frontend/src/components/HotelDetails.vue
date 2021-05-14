<template> 
<body>
    <div class="Hotel-details-page">
        <div class="form">
            <form class="hotel-form">
                <h3>Hotel Info</h3>
                <div class="hotel-image">
                    <img v-bind:src="img">
                </div>
                <p class="hotelId">Hotel Name</p>
                <div class="hotelDetails">
                    <p>Address: </p>
                    <p>Checkin date: </p>
                    <p>Checkout date: </p>
                    <p>Room type: </p>
                    <p>Price: </p>
                </div>
            </form>
        </div>
    </div>
</body> 
    
    
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

.hotel-form {
    position: relative;
    left:200px;
    bottom:582px;
    z-index: 1;
    background:rgb(246, 246, 252);
    max-width: 360px;
    margin: 0 auto 100px;
    padding: 19px;
    text-align: left;
    border-style: solid;
    border-width:3px;
}
.form .hotelId{
    text-align: left;
    font-size: 15px;
    color:blak;
}
img{
    width:300px;
    max-height:200px;
}
.hotelDetails{
    font-size: 15px;
    color:black;
}
.Hotel-details-page{
    width:360px;
    padding: 0 0 0;
    margin: auto;
}
</style>