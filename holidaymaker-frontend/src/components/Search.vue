<template>
<div class="search-parent">
    <div class="search-div1"> 
                <table>
            <tbody>
               <tr>
                    <td>
                    <input
                    type="text"
                    class="form-control"
                    placeholder="Search destinations"
                    aria-label="Search"
                    id="searchBox"
                    v-model="searchString"
                    />
                    </td>
                    <td>
                        <i class="fa fa-search" id="searchIcon"></i>
                    </td>
               </tr>
               <tr>
                    <td class="includeFlightCheckbox">
                        <label for="checkbox"> Include flight </label>
                        <input type="checkbox" style="margin-left:10px;"> 
                    </td>
               </tr>
            </tbody>
         </table>
    </div>

    <div class="search-div2"> 
        <DRPicker />
    </div>

    <div class="search-div3"> 
         <button @click="redirect" class="btn btn-lg btn-primary search-button" id="searchButton">Search</button>
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
     redirect() {
        this.$router.push({ name: 'SearchResults' })
        this.$store.dispatch('search', this.searchString)
     }
  },
    components: { DRPicker },
    mounted() {
        this.$store.dispatch('fetchDestinations')
    }
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
margin: 20px auto;
padding: 20px;
max-width: fit-content;
border:black;
border-style: solid;
border-width: thin;
border-radius: 15px;
}

.search-div1 { 
    grid-area: 1 / 1 / 2 / 2; 
    margin: auto 0;
}
.search-div2 { 
    grid-area: 1 / 2 / 2 / 3; 
    text-align: center;
}
.search-div3 { 
    grid-area: 1 / 3 / 2 / 4; 
    text-align: right;
}

 #searchBox {
    border:black;
    border-style: solid;
    border-width: thin;
    font-size: 18px;
    width: fit-content;
  }

  .search-button {
      background: lightcoral;
  }
  .search-button:hover {
      background: rgb(247, 108, 108);
  }

</style>