<template>
  <div>
    <stripe-checkout
      ref="checkoutRef"
      mode="payment"
      :pk="publishableKey"
      :line-items="lineItems"
      :success-url="successURL"
      :cancel-url="cancelURL"
      @loading="v => loading = v"
    />
    
    <button class="btn btn-info btn-lg" style="margin:100px" @click="submit">Confirm booking</button>
  </div>
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
          price: 'price_1IyGXNK0lVPWMlyw7XwDpVKS', // The id of the one-time price you created in your Stripe dashboard
          quantity: 1,
        },
      ],
      successURL: 'http://localhost:8080/paymentsucceeded',
      cancelURL: 'http://localhost:8080/paymentfailed',
    };
  },
  methods: {
    submit () {
      // You will be redirected to Stripe's secure checkout page
      this.$refs.checkoutRef.redirectToCheckout();
    },
  },
};
</script>