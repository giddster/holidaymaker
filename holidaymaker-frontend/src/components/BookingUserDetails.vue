<template>
    <div class="booking-page">
        <div class="form">
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
    right: 200px;
    z-index: 1;
    background:rgb(246, 246, 252);
    max-width: 360px;
    margin: 0 auto 100px;
    padding: 45px;
    text-align: center;
    border-style: solid;
    border-width:3px;
    
}
h3{
    position:relative;
    right:200px;
    
}
.form input{
    font-family: "Roboto", sans-serif;
    outline:1;
    background: #f8f6f6;
    width:100%;
    border:0;
    margin:0 0 15px;
    padding: 10px;
    box-sizing: border-box;
    font-size: 14px;
    margin-top: 35px;
    border-style: solid;
    border-width: 2px;
    
}
.booking-page{
    width:360px;
    padding: 5% 0 0;
    margin: auto;
}
</style>