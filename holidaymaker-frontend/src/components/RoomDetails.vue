<template>
<body>
    <div class="form">
        <form class="room-form">
            <h3>Room Details</h3>
            <p>{{roomDetails}}</p>
        </form>
    </div>
</body>
    

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
    right:110px;
    top:50px;
    z-index: 1;
    background: rgba(238, 238, 238, 0.8);
    width: 650px;
    margin: 0 right 100px;
    padding: 100px;
    text-align: left;
    border: 3px black;
    border-radius: 4px;
    float: right;
    margin-right: 200px;
    border-style: solid;
    border-width:3px;
}
h3{
    position: relative;
    text-align: left;
    bottom: 60px;
}
</style>