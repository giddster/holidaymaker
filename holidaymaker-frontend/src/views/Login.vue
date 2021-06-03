<template>
    <body>
        <div class="login-page">
        <div class="form">
            <form id = "loginForm" class="login-form">
                <input v-model="UserEmail" type="email" placeholder="Email">
                <input v-model="UserPassword" type="password" placeholder="Password">
                <button @click="handleUserLogin">Login</button>
                <p class="message">Not registered? <router-link to="/register">Register</router-link></p>
            </form>
        </div>
        </div>
    </body>
</template>

<script>

import {mapActions} from 'vuex'
import router from '../router/index'

export default {

     data() {
        return {
            user:{
            email:'',
            password:'',
        }
        
    };
    },

    methods: {

       ...mapActions(['loginUser']),

        async handleUserLogin() {
            
            let user = {
                email: this.UserEmail,
                password: this.UserPassword,
            }

            //console.log(user)

               
               let response = await this.loginUser(user)

               console.log(response)

                if(response){
                    //router.go()
                    alert('Login Successful')
                    //this.reRender()
                    document.getElementById("loginForm").reset();
                    router.push('/about')

                }
                else{
                    alert('Login Failed')
                }
        
        },

        reRender(){
        this.$forceUpdate()
     }
    
    },
    

}


</script>

<style scoped>
body{
    background-image: linear-gradient(rgba(0,0,0,0.6),
    rgba(0,0,0,0.6)),url(/src/assets/pic1.jpg);
    height: 100vh;
    background-size: cover;
    background-position: center;

}
.login-page{
    width:360px;
    padding: 10% 0 0;
    margin: auto;
}
.form {
    position: relative;
    z-index: 1;
    background: rgba(7,40,195, 0.8);
    max-width: 360px;
    margin: 0 auto 100px;
    padding: 45px;
    text-align: center;
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
    background:#4CAF50;
    width: 100%;
    border: 0;
    padding:15 px;
    color:#FFFFFF;
    font-size: 14px;
    cursor: pointer;
}
.form button:hover,.form button:active{
    background: #43A047;
}
.form .message{
    margin: 15px;
    color:aliceblue;
    font-size: 12px;
}
.form .message a{
    color:#4CAF50;
    text-decoration: none;
}

</style>