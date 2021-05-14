 <template>
<div class="container-fluid" id="searchContainer">
	<div class="row">
		<div class="col-md-4" id="leftSearchDiv">
         <table>
            <tbody>
               <tr>
               <td>
                  <input
                  type="search"
                  class="form-control"
                  placeholder="Search destinations"
                  aria-label="Search"
                  id="searchBox"
                  />
                  </td>
               <td>
                  <i class="fa fa-search" id="searchIcon"></i>
               </td>
               </tr>
               <tr>
               <td>
                  <input type="checkbox" id="includeFlightCheckbox"> 
                  <p id="includeFlightText"> Include flight </p>
               </td>
               </tr>
            </tbody>
         </table>
		</div>
		
      <div class="col-md-4" id="middleSearchDiv">
         <DRPicker />
		</div>
		<div class="col-md-4" id="rightSearchDiv">
      <button type="button" class="btn btn-lg btn-primary" id="searchButton">Search</button>
		</div>
	</div>
</div>

</template>

<script>
import DRPicker from "@/components/DRPicker.vue"

export default {
  components: {
	DRPicker
  }
};

</script>