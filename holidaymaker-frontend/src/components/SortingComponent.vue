<template>
    <div class="sorting-component">
        <div class="form">
            <form>
                <h3>Sort</h3>
                <label for="starRating">Stars</label>
                <select name="starRating" id="starRating">
                        <option value="1star">1</option>
                        <option value="2star">2</option>
                        <option value="3star">3</option>
                        <option value="4star">4</option>
                        <option value="5star">5</option>
                </select>
                <label for="distanceToBeach">Distance to beach</label>
                <select name="distanceToBeach" id="DistanceToBeach">
                    <option value="200m">0.2km</option>
                    <option value="500m">0.5km</option>
                    <option value="1000m">1km</option>
                    <option value="1500m">1.5km</option>
                    <option value="2000m">2km</option>
                </select>

                <button>Customer Rating</button>

                <label for="price">Price</label>
                <select name="price" id="price">
                    <option value="1000">1000;-</option>
                    <option value="2000">2000;-</option>
                    <option value="3000">3000;-</option>
                    <option value="4000">4000;-</option>
                    <option value="5000">5000;-</option>
                </select>
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
    padding: 30px;
    text-align: center;
    border-bottom: solid;
    border-top:solid;
    border-width: 2px;
}
label{
    margin-left: 15px;
}
button{
    margin-left:15px;
    padding: 0%;
}
</style>