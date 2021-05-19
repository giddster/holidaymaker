<template>
<header>
    <div class="container-fluid" id="headerContainer">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4" id="leftHeaderDiv">
                    <i class="fas fa-hotel" id="hotelIcon"></i>
                    <i class="fas fa-plane" id="planeIcon"></i>
                    <h5 id="headerTitle"><a href="#"> HolidayMaker</a></h5>
				</div>
				<div class="col-md-4" id="middleHeaderDiv">
				</div>
				<div class="col-md-4" id="rightHeaderDiv">
					<ProfileDropdown />
				</div>
			</div>
		</div>
	</div>
</div>
    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-6">
                    
				</div>
				<div class="col-md-6">
                    
				</div>
			</div>
		</div>
	</div>
</div>
</header>
</template>

<script>
import ProfileDropdown from "@/components/ProfileDropdown.vue"

export default {
  components: {
	ProfileDropdown
  },
  methods: {
	  fetchAllDestinations(event) {
		  this.$store.dispatch('fetchAllDestinations')
	  }
  }
};

</script>
