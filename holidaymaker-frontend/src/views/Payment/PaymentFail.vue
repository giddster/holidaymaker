<template>
        <div class="paymentfailed">
            <h1>Payment failed</h1>
            <h4>Sorry, the payment could not be processed. Please contact your bank to ensure your card is up to date, and try again.</h4>
            <router-link to="/" class="btn btn-lg btn-primary">Back to booking</router-link> &nbsp; &nbsp; &nbsp;
            <router-link to="/" class="btn btn-lg btn-primary">Back to homepage</router-link>
        </div>
        
</template>

<script>
export default {

}
</script>

<style scoped>
.paymentfailed{
    text-align: center;
    margin: 100px;
}


</style>