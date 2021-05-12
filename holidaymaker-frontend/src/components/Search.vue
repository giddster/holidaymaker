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
                  placeholder="Search for destinations"
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
         DATE/ROOM PICKER COMPONENT
		</div>
		<div class="col-md-4" id="rightSearchDiv">
      <button type="button" class="btn btn-primary" id="searchButton">Confirm search</button>
		</div>
	</div>
</div>

</template>