<template>
	<div class="date-parent">
		<div class="date-div1"> 
			<input ref="checkIn" type="date" v-model="dates.checkinDate" class="date-picker" id="checkinDate">
			<p style="margin-bottom: 0px; color: lightcoral">Checkin Date</p>
		</div>

		<div class="date-div2"> 
			<input ref="checkOut" type="date" v-model="dates.checkoutDate" @change="saveDates" class="date-picker" id="checkoutDate">
			<p style="margin-bottom: 0px; color: lightcoral">Checkout Date</p>
		</div>
	</div>
</template>

<script>
export default {
	mounted(){
		this.forceMinMaxDate()
	},
	data() {
		return {
			dates: { checkinDate: '', checkoutDate: '' }
		}
	},
	methods: {
		saveDates() {
			this.$store.dispatch('saveDates', this.dates)
		},
		forceMinMaxDate() {
			checkinDate.min = new Date().toISOString().split("T")[0]
			checkoutDate.min = new Date().toISOString().split("T")[0]
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

.date-picker {
color:rgb(117, 116, 114);
opacity: 0.9;
border: 2px solid rgb(189, 189, 189);
border-radius: 5px;
background: #fff;
}

.date-div1 { 
	grid-area: 1 / 1 / 2 / 2; 
	margin-left: 10px;
}
.date-div2 { 
	grid-area: 1 / 2 / 2 / 3; 
	margin-left: 10px;
}

 .guests-button {
	background: lightcoral;
	border-radius: 5px;
	border: 1px solid lightcoral;
  }
  .guests-button:hover {
	background: rgb(247, 108, 108);
	border-radius: 5px;
	border: 1px solid lightcoral;
  }

</style>