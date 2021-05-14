<template>
    <div class="booking-page">
        <div class="form">
            <h3>User Details</h3>
            <form class="booking-form">
                <input type="text" placeholder="Name">
                <input type="text" placeholder="Lastname">
                <input type="text" placeholder="Email">
                <input type="text" placeholder="Telephone">
            </form>
        </div>
    </div>
</template>

<script>
export default {
    
}
</script>

<style scoped>
.booking-form {
    position: relative;
    z-index: 1;
    background: rgba(238, 238, 238, 0.8);
    max-width: 360px;
    margin: 0 left 100px;
    padding: 250px;
    text-align: center;
    border-style: solid;
    border-width:3px;
}
h3{
    text-align: left;
}
.form input{
    font-family: "Roboto", sans-serif;
    outline:1;
    background: #f8f6f6;
    width:120%;
    border:0;
    margin:0 0 15px;
    padding: 10px;
    box-sizing: border-box;
    font-size: 14px;
    margin-top: 35px;
    border-style: solid;
    border-width: 3px;
    
    
}

</style>