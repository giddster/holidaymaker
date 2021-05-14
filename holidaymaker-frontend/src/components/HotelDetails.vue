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
    left:0px;
    bottom:840px;
    z-index: 1;
    background: rgba(238, 238, 238, 0.8);
    max-width: 360px;
    margin: 0 right 100px;
    padding: 100px;
    text-align: left;
    border: 3px black;
    border-radius: 4px;
    float: right;
    margin-right: 200px;
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
</style>