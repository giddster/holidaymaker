<template>
    <body>
        <div class="filterComponent-view">
            <div class="form">
                <form class="filter-form">
                    <div class="checkboxes"> 
                        <input type="checkbox" id="hasPool" name="hasPool"  v-model="hasPool" @change.prevent="updateFilter()">
                        <label for="hasPool">Pool</label>
                        <input type="checkbox" id="hasSeaSide" name="hasSeaSide"  :value="hasSeaSide" v-model="hasSeaSide" @change="updateFilter()">
                        <label for="hasSeaSide">Seaside</label><br>

                        <input type="checkbox" id="hasEntertainment" name="hasEntertainment" checked :value="hasEntertainment" v-model="hasEntertainment" @change="updateFilter()">
                        <label for="hasEntertainment">Entertainment</label>
                        <input type="checkbox" id="hasKidsClub" name="hasKidsClub"  :value="hasKidsClub" v-model="hasKidsClub" @change="updateFilter()">
                        <label for="hasKidsClub">Kids Club</label><br>

                        <input type="checkbox" id="hasRestaurant" name="hasRestaurant"  :value="hasRestaurant" v-model="hasRestaurant" @change="updateFilter()">
                        <label for="hasRestaurant">Restaurant</label>
                        <input type="checkbox" id="hasHalfPension" name="hasHalfPension"  :value="hasHalfPension" v-model="hasHalfPension" @change="updateFilter()">
                        <label for="hasHalfPension">Half Pension</label><br>

                        <input type="checkbox" id="hasWholePension" name="hasWholePension"  :value="hasWholePension" v-model="hasWholePension" @change="updateFilter()">
                        <label for="hasWholePension">Whole Pension</label>
                        <input type="checkbox" id="hasAllInclusive" name="hasAllInclusive"  :value="hasAllInclusive" v-model="hasAllInclusive" @change="updateFilter()">
                        <label for="hasAllInclusive">All inclusive</label><br>

                        <input type="checkbox" id="hasWifi" name="hasWifi"  :value="hasWifi" v-model="hasWifi" @change="updateFilter()">
                        <label for="hasWifi">Wifi</label>
                        <input type="checkbox" id="hasRoomService" name="hasRoomService"  :value="hasRoomService" v-model="hasRoomService" @change="updateFilter()">
                        <label for="hasRoomService">Roomservice</label>
                    </div>
                    <h3>Price per night: </h3>
                    <div class="slider">
                        <input type="range" min="1" max="5000" v-model="value">
                        <p>{{value}}</p>
                    </div>
                    <h3>Star rating</h3>
                    <div class="star-rating">
                        <input type="radio" id="5-stars" name="rating" value="5" />
                        <label for="5-stars" class="star">&#9733;</label>
                        <input type="radio" id="4-stars" name="rating" value="4" />
                        <label for="4-stars" class="star">&#9733;</label>
                        <input type="radio" id="3-stars" name="rating" value="3" />
                        <label for="3-stars" class="star">&#9733;</label>
                        <input type="radio" id="2-stars" name="rating" value="2" />
                        <label for="2-stars" class="star">&#9733;</label>
                        <input type="radio" id="1-star" name="rating" value="1" />
                        <label for="1-star" class="star">&#9733;</label>
                    </div>
                    <h3>Guest rating</h3>
                    <div class="slider">
                        <input type="range" min="1" max="10" v-model="value2">
                        <p>{{value2}}</p>
                    </div>
                </form>
            </div>
        </div>

    </body>
</template>
<script>
// import {mapGetters,mapActions} from 'vuex';
// import {mapActions} from "vuex"
export default {
    
                

    data(){
        return{
            
            value2: 0,
            value: 0,
            
                hasPool: false,
                hasSeaSide: false,
                hasEntertainment: false,
                hasKidsClub: false,
                hasRestaurant: false,
                hasHalfPension: false,
                hasWholePension: false,
                hasAllInclusive: false,
                hasWifi:  false,
                hasRoomService: false,
        
            
        }
    },
    methods: {
        //    ...mapActions(["filter"]),
        //     updateFilter(){
        //     //   this.filter(this.filters)
        //     //   this.updateFilter(this.filters)
        //         console.log(this.filters)
        //       this.$store.getters.updateFilter(this.filters)
        //       this.$store.dispatch('filter', this.filters)
              
            //   await this.$store.dispatch('updateFilteredHotels', this.hasPool);
              
           }
    
    
}
</script>

<style scoped>
.filterComponent-view{
    width:360px;
    padding: 10% 0 0;
    
}
.form {
    position: relative;
    z-index: 1;
    background: rgba(139, 140, 144, 0.8);
    max-width: 360px;
    margin: 0 auto 100px;
    padding: 45px;
    text-align: center;
}
.form input{
    font-family: "Roboto", sans-serif;
    outline:1;
    background: #f2f2f2;
    border:0;
    margin:0 0 15px;
    padding: 15px;
    box-sizing: border-box;
    font-size: 14px;

}
.checkboxes{
    text-align: left;
}
.checkboxes input{
    margin: 0px 0px 0px 0px;
}
.checkboxes label{
    margin: 0px 15px 0px 3px;
}
.slider{
    text-align: left;
    

}
h3{
    font-size: 15px;
    text-align: left;
    padding:0px;
}
.star-rating {
  border:solid 1px #ccc;
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

/* explanation */

article {
  background-color:#ffe;
  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
  color:#006;
  font-family:cursive;
  font-style:italic;
  margin:4em;
  max-width:30em;
  padding:2em;
}

</style>