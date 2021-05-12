 <template>
<div class="container-fluid" id="searchContainer">
	<div class="row">
		<div class="col-md-4" id="leftSearchDiv">
      <div class="col-md-6" id="searchBoxDiv">
         <input
        type="search"
        class="form-control"
        placeholder="Search for destinations"
        aria-label="Search"
        id="searchBox"
      />
        <i class="fa fa-search" id="searchIcon"></i>
			</div>
			<div class="col-md-6" id="checkBoxDiv">
        <p id="includeFlightText"> Include flight</p>
        <input type="checkbox" id="includeFlightCheckbox"> 
			</div>
		</div>
		<div class="col-md-4" id="middleSearchDiv">
      DATE/ROOM PICKER COMPONENT
		</div>
		<div class="col-md-4" id="rightSearchDiv">
      <button type="button" class="btn btn-primary" id="searchButton">Confirm search</button>
		</div>
	</div>
</div>
<!-- <div>
    <MDBNavbar light bg="light" container>
    <MDBNavbarBrand class="h">
        
      <form class="d-flex input-group w-auto">
      <input
        type="search"
        class="form-control"
        placeholder="Sök resmål"
        aria-label="Search"
      />
      <p>HÄR SKA DATE-PICKER + GÄSTER-KOMPONENTEN VARA</p>
      <MDBBtn outline="primary"> Search </MDBBtn>
    </form>

    </MDBNavbarBrand>
    
  </MDBNavbar>
</div> -->
</template>