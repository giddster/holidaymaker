<template>
    <stripe-checkout
      ref="checkoutRef"
      mode="payment"
      :pk="publishableKey"
      :line-items="lineItems"
      :success-url="successURL"
      :cancel-url="cancelURL"
      @loading="v => loading = v"
    />
    <button class="btn btn-info btn-lg" @click="submit">Confirm/pay booking</button>
</template>

<script>
import { StripeCheckout } from '@vue-stripe/vue-stripe';
export default {
  components: {
    StripeCheckout,
  },
  data () {
    // API TEST KEY
    this.publishableKey = 'pk_test_51IyG1qK0lVPWMlywAbpqOFcKOHwihLzpsx5kQPafYwW8DaoYmBYiCCUKpVpaGAcxpe9HenvGKNqSV66qHKaCgDNm00wuo0QAG1';
    return {
      loading: false,
      lineItems: [
        {
          price: 'price_1J01VSK0lVPWMlywOHp0M1Wf', // The id of the one-time price you created in your Stripe dashboard
          quantity: 0, //SET THIS AS THE CREATEBOOKING TOTAL SUM AS A SILLY WORKAROUND
        },
      ],
      successURL: 'http://localhost:8080/paymentsucceeded',
      cancelURL: 'http://localhost:8080/paymentfailed',
    };
  },
  computed: {
    
  },
  methods: {
     submit () {
       this.$store.dispatch('submit')
    //   var booking = {
    //     CheckInDate: this.$store.state.dates.CheckInDate,
    //     CheckOutDate: this.$store.state.dates.CheckOutDate, 
    //     NoOfAdults: 0,
    //     NoOfChildren: 0,
    //     IsPending: true,
    //     IsCancelled: false,
    //     TotalPrice: this.$store.state.totalBookingPrice,
    //     FlightId: 1,
    //     CustomerId: 59
    //   }

    //   let requestOptions = {
		// 		method: 'post',
		// 		headers: { 'Content-type': 'application/json' },
		// 		body: JSON.stringify(booking)
		// 	}

		// 	const response = await fetch('/api/Bookings', requestOptions)
		// 	let result = await response.json()
    //   console.log(result)
      
    //   let input = this.$store.state.totalBookingPrice
    //   let finalTotal = 0

    //   finalTotal = parseInt(input.price)
      
    //   this.lineItems[0].quantity = finalTotal
    //   // You will be redirected to Stripe's secure checkout page
    //   // this.$refs.checkoutRef.redirectToCheckout();
    },
  },
};
</script>