<template>
  <body>
    <div class="register-page">
      <div class="form">
        <form id ="registerForm" class="register-form">
          
          <input
            v-model="UserEmail"
            id="UserEmail"
            type="email"
            placeholder="Email"
          />
          <input
            v-model="UserPassword"
            id="UserPassword"
            type="password"
            placeholder="Password"
          />
          <input
            v-model="UserPasswordConfirmation"
            id="UserPasswordConfirmation"
            type="password"
            placeholder="Confirm password"
          />

          <button @click.prevent="handleUserRegister">Register</button>
          <p class="message">
            Already Registered? <router-link to="/login">Login</router-link>
          </p>

          
        </form>
      </div>
    </div>

  </body>
</template>

<script>


import {mapActions} from 'vuex'

export default {
  data() {
    return {
        user:{
        userName: '',
        email:'',
        password:'',
        }
        //UserPasswordConfirmation:''
    };
  },
  methods: {

      ...mapActions(['registerUser']),

     async handleUserRegister() {
        
        let user = {
            userName: this.UserEmail,
            password: this.UserPassword,
            email: this.UserEmail,
            UserPasswordConfirmation: this.UserPasswordConfirmation
        }



        if(user.password === user.UserPasswordConfirmation){

            let response = await this.registerUser(user)
            

            if(response){
                alert('User Registration Successful')
                document.getElementById("registerForm").reset();

            }
            else{
                alert('User Registartion Failed')
            }
        }
        else{
            alert('Wrong password')
        }
    },
    
  },
};
</script>

<style scoped>
body {
  background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
    url(/src/assets/pic1.jpg);
  height: 100vh;
  background-size: cover;
  background-position: center;
}
.register-page {
  width: 360px;
  padding: 10% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: rgba(7, 40, 195, 0.8);
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px 45px 15px 45px;
  text-align: center;
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 1;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
  border-radius: 4px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4caf50;
  width: 100%;
  border: 0;
  padding: 15 px;
  color: #ffffff;
  font-size: 14px;
  cursor: pointer;
  border-radius: 5px;
}
.form button:hover,
.form button:active {
  background: #43a047;
}
.form .message {
  margin: 25px;
  color: aliceblue;
  font-size: 15px;
}
.form .message a {
  color: #4caf50;
  text-decoration: none;
}
</style>