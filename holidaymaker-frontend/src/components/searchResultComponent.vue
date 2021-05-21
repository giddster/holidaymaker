<template>
    <div class="searchResultComponent">
        <div class="form">
            <form class="searchresult-form">
                <p class="starform">
                    <span class="fa fa-star" id="star"></span>
                    <span class="fa fa-star" id="star"></span>
                    <span class="fa fa-star" id="star"></span>
                </p>
                <h3>Hotel Title</h3>
                <p class="price">10,000;-</p>
                <p class="address">Hotel address</p>
                <p class="perks">Hotel Perks</p>
                <p class="customerRating">Customer rating</p>
                <button class="btn btn-primary">Book now</button>
            </form>
        </div>
    </div>
</template>

<script>
export default {
    
}
</script>

<style scoped>
.form {
    position: relative;
    z-index: 1;
    background: rgba(231, 230, 230, 0.8);
    width:800px;
    margin: 0 auto 100px;
    padding-top:20px;
    padding-bottom:20px;
    text-align: center;
    border-bottom: solid;
    border-top:solid;
    border-width: 2px;
}
.perks{
    border-style:solid;
    width:100px;
    border-width:2px;
    margin-left:250px;
}
button{
    margin-left:500px;
    overflow:hidden;
}
h3{
    margin-right:200px;
    overflow: hidden;
    font-size:25px;
}
.address{
    margin-right:200px;
    overflow: hidden;
    font-size:12px;
}
.starform{
    border-style:solid;
    border-width:2px;
    width:100px;
    float:right;
    margin-right:100px;
}
.price{
    float:right;
    width:0%;

}
.customerRating{
    margin-right:200px;
}
</style>