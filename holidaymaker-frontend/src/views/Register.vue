<template>
<body>
    <div class="register-page">
    <div class="form">
        <form class="register-form">
            <input type="text" placeholder="Firstname">
            <input type="text" placeholder="Lastname">
            <input type="text" placeholder="Address">
            <input type="text" placeholder="Zipcode">
            <input type="text" placeholder="City">
            <input type="text" placeholder="Country">
            <input type="text" placeholder="Phone">
            <input type="text" placeholder="Email id">
            <input type="password" placeholder="Password">
            <input type="password" placeholder="Confirm password">
            
            <button>Create</button>
            <p class="message">Already Registered? <router-link to="/login">Login</router-link></p>
        </form>
    </div>
    </div>
</body>
    
</template>

<script>
export default {
    
}
</script>

<style scoped>
body{
    
    height: 100vh;
    background-size: cover;
    background-position: center;

}
.register-page{
    width:360px;
    padding: 5% 0 0;
    margin: auto;
}
.form {
    position: relative;
    z-index: 1;
    background: rgb(246, 246, 252);
    max-width: 360px;
    margin: 0 auto 100px;
    padding: 30px;
    text-align: center;
    border-style: solid;
    border-width: 1px;
    border-radius: 10px;
    
    
}
.form input{
    font-family: "Roboto", sans-serif;
    outline:1;
    background: #f2f2f2;
    width:100%;
    border:0;
    margin:0 0 15px;
    padding: 15px;
    box-sizing: border-box;
    font-size: 14px;
}
.form button{
    font-family: "Roboto", sans-serif;
    text-transform: uppercase;
    outline:0;
    background: lightcoral;
    width: 100%;
    border: 0;
    padding:15 px;
    color:#FFFFFF;
    font-size: 14px;
    cursor: pointer;
}
.form button:hover,.form button:active{
    background: rgb(243, 109, 109);
}
.form .message{
    margin: 15px;
    color:rgb(0, 0, 0);
    font-size: 12px;
}
.form .message a{
    color: lightcoral;
    text-decoration: none;
}

</style>