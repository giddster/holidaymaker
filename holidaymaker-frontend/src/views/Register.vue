<template>
  <body>
    <div class="register-page">
      <div class="form">
        <form class="register-form">
          <input v-model="UserName" id="UserName" type="text" placeholder="User Name" />
          <input v-model="UserEmail" id="UserEmail" type="text" placeholder="Email" />
          <input v-model="UserPassword" id="UserPassword" type="password" placeholder="Password" />
          <input
          v-bind="UserPasswordConfirmation"
            id="UserPasswordConfirmation"
            type="password"
            placeholder="Confirm password"
          />

          <button @click.prevent="handleUserRegister" >Register</button>
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

    handleUserRegister() {
        let user = {
            userName: this.UserName,
            email: this.UserEmail,
            password: this.UserPassword,
           // UserPasswordConfirmation: this.UserPasswordConfirmation
        }
            console.log(user);
            //this.$store.dispatch('search', this.searchString)
           let response = this.$store.dispatch('registerUser', this.user)
           alert(response.title)
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
  padding: 45px;
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
}
.form button:hover,
.form button:active {
  background: #43a047;
}
.form .message {
  margin: 15px;
  color: aliceblue;
  font-size: 12px;
}
.form .message a {
  color: #4caf50;
  text-decoration: none;
}
</style>