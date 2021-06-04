<template>
<div class="search-parent">
    <div class="search-div1"> 
                <table>
            <tbody>
               <tr>
                    <td>
                    <input
                    type="text"
                    class="form-control searchbox-content"
                    placeholder="Search destinations..."
                    aria-label="Search"
                    id="searchBox"
                    v-model="searchString"
                    />
                    </td>
                    <td>
                        <i class="fa fa-search" id="searchIcon"></i>
                    </td>
               </tr>
            </tbody>
         </table>
    </div>

    <div class="search-div2"> 
        <DRPicker />
    </div>

    <div class="search-div3"> 
         <router-link @click="displaySearchResults" :to="'/searchresults'" class="btn btn-md btn-primary search-button" style="float: right">Search</router-link>
    </div>

</div>
</template>

<script>
import DRPicker from '@/components/DRPicker.vue'

export default {
     data() {
         return {
             searchString: ''
         }
     },
     methods: {
     displaySearchResults() {
        this.$store.dispatch('search', this.searchString, this.checkinDate, this.checkoutDate)
     }
  },
    components: { DRPicker },
    computed: {
        checkinDate(){
            return this.$store.dates.checkinDate
        },
        checkoutDate(){
            return this.$store.dates.checkoutDate
        }
    }
    
    // created() {
    //     this.$store.dispatch('fetchDestinations')
    // }
}
</script>

<style>

.search-parent {
   display: grid;
   grid-template-columns: repeat(3, 1fr);
   grid-template-rows: 1fr;
   grid-column-gap: 0px;
   grid-row-gap: 0px;
   background: rgb(246, 246, 252);
   margin: auto;
   padding: 12px;
   max-width: fit-content;
   border:black;
   border-style: solid;
   border-width: thin;
   border-radius: 10px;
}

.search-div1 { 
    grid-area: 1 / 1 / 2 / 2; 
    margin: auto 0;
}
.search-div2 { 
    grid-area: 1 / 2 / 2 / 3; 
    text-align: center;
    padding-top: 10px;
}
.search-div3 { 
    grid-area: 1 / 3 / 2 / 4; 
    text-align: right;
    padding-top: 8px;
}

 #searchBox{
    font-size: 18px;
    width: fit-content;
    font-family: sans-serif;
    border: 2px solid rgb(189, 189, 189);
	border-radius: 5px;
	background: #fff;
  }

#searchIcon {
    font-size: 25px;
    color: lightcoral;
    margin-left: 5px;
    margin-top: 5px;
}
</style>