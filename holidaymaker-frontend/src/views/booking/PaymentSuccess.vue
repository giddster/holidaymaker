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
//GÖR EN HOOK SOM SPARAR BOKNINGEN TILL DATABASEN HÄR
}
</script>

<style scoped>
.paymentsucceeded{
    text-align: center;
    margin: 100px;
}


</style>