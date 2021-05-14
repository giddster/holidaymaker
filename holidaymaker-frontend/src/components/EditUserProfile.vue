<template>
    <div class="editProfile-page">
        <div class="form">
            <form class="editProfile-Form">
                <input type="text" placeholder="Email">
                <input type="text" placeholder="Password">
                <input type="text" placeholder="Name">
                <input type="text" placeholder="Lastname">
                <button>Edit Profile</button>
            </form>
        </div>
    </div>
</template>

<script>
export default {
    
}
</script>

<style scoped>
.form input{
    font-family: "Roboto", sans-serif;
    outline:1;
    background: #f2f2f2;
    width:100%;
    border:0;
    margin:0 0 15px;
    padding: 10px;
    box-sizing: border-box;
    font-size: 14px;
    border-style: solid;
    border-width: 1px;
    
}
.form {
    position: relative;
    z-index: 1;
    background: rgba(194, 196, 204, 0.8);
    max-width: 360px;
    margin: 0 auto 100px;
    padding: 45px;
    text-align: center;
    border-style: solid;
    border-width: 2px;
}
.editProfile-page{
    width:360px;
    padding: 10% 0 0;
    margin: auto;
}
</style>