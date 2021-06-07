<template>
        <div class="paymentsucceeded">
            <h1>Payment successful!</h1>
            <h3>Booking number: XXX</h3>
            <h4>Start packing your bags!</h4>
            <router-link to="/" class="btn btn-lg btn-primary">Back to homepage</router-link>
        </div>
        
</template>

<script>
export default {
//GÖR EN HOOK SOM SPARAR BOKNINGEN TILL DATABASEN HÄR
}
</script>

<style scoped>
.paymentsucceeded{
    text-align: center;
    margin: 100px;
}


</style>