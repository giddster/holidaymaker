<template>
	<div class="date-parent">
		<div class="date-div1"> 
			<input ref="checkIn" type="date" v-model="dates.checkinDate">
			<p>Checkin Date</p>
		</div>

		<div class="date-div2"> 
			<input ref="checkOut" type="date" v-model="dates.checkoutDate" @change="saveDates">
			<p>Checkout Date</p>
		</div>
		
		<div class="date-div3"> 
			<button type="button" class="btn btn-sm btn-primary guests-button" data-toggle="modal" data-target="#guestsModal">
  				Guests/rooms
			</button>
		</div>

	</div>
</template>

<script>
export default {
	data() {
		return {
			dates: { checkinDate: '', checkoutDate: '' }
		}
	},
	methods: {
		saveDates() {
			this.$store.dispatch('setDates', this.dates)
			console.log(this.dates)
		}
	}
}
</script>

<style>

.date-parent {
display: grid;
grid-template-columns: repeat(2, 1fr);
grid-template-rows: 1fr;
grid-column-gap: 0px;
grid-row-gap: 0px;
}

.date-div1 { 
	grid-area: 1 / 1 / 2 / 2; 
	margin-left: 10px;
}
.date-div2 { 
	grid-area: 1 / 2 / 2 / 3; 
	margin-left: 10px;
}
.date-div3 { 
	grid-area: 1 / 3 / 2 / 4; 
	margin-left: 10px;
}

 .guests-button {
	background: lightcoral;

  }
  .guests-button:hover {
      background: rgb(247, 108, 108);
  }

</style>