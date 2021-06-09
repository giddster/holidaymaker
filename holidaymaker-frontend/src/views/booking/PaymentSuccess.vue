<template>
        <div class="paymentsucceeded">
            <h1>Payment successful!</h1>
            <i>You will receive an e-mail with booking details shortly.</i>
            <h4>Start packing your bags!</h4>
            <router-link to="/" class="btn btn-lg btn-primary">Back to homepage</router-link>
        </div>
        
</template>

<script>
export default {
async created() {
    var booking = {}

      let requestOptions = {
				method: 'post',
				headers: { 'Content-type': 'application/json' },
				body: JSON.stringify(booking)
			}

			const response = await fetch('/api/Bookings', requestOptions)
			let result = await response.json()
      console.log(result)
    }
}
</script>

<style scoped>
.paymentsucceeded{
    text-align: center;
    margin: 100px;
}


</style>