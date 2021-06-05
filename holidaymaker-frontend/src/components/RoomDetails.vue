<template>
    <div class="form">
        <form class="room-form">
            <h3>Room Details</h3>
            <p>{{roomDetails}}</p>
        </form>
    </div>
</template>


<script>
export default {
    data(){
        return{
            roomDetails: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
        }
    }
}
</script>


<style scoped>
.room-form {
    position: relative;
    right:170px;
    bottom: 650px;
    z-index: 1;
    background:rgb(246, 246, 252);
    width: 700px;
    margin: 0 auto 100px;
    padding: 20px;
    text-align: left;
    border-style: solid;
    border-width:3px;
}
h3{
    position: relative;
    text-align: left;
    
}
.form{
    width:360px;
    padding: 1% 0 0;
    margin: auto;
}
</style>