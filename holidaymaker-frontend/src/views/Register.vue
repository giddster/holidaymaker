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

    <transition name="fade">
        <div class="popup-modal" v-if="isVisible">
          <div class="window">
            <slot>
              <h3 id="custom">{{ message }}</h3>
            </slot>
            <button class="btnModal" @click="close">CLOSE</button>
          </div>
        </div>
      </transition>

      <transition name="fade">
        <div class="popup-modal" v-if="isVisibleConfirmPass">
          <div class="window">
            <slot>
              <h3 id="custom">{{ message }}</h3>
            </slot>
            <button class="btnModal" @click="closeConfirmPass">CLOSE</button>
          </div>
        </div>
      </transition>

  </body>
</template>

<script>
import {mapActions} from 'vuex'
import router from "../router/index";

export default {
  data() {
    return {
        user:{
          userName: '',
          email:'',
          password:'',
        },
        
        isVisible: false,
        isVisibleConfirmPass: false,
        message: "",
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
                // alert('User Registration Successful')
                this.open("Registration Successful");
                document.getElementById("registerForm").reset();

            }
            else{
              this.openConfirmPass("Registration Failed");
                // alert('User Registartion Failed')
            }
        }
        else{
            // alert('Wrong password')
            this.openConfirmPass("Confirm Password");
        }
    },

    open(message) {
      this.message = message;
      this.isVisible = true;
    },

    close() {
      this.isVisible = false;
      document.getElementById("registerForm").reset();
      // this.$forceUpdate();
      router.push("/");
    },

    openConfirmPass(message) {
      this.message = message;
      this.isVisibleConfirmPass = true;
    },

    closeConfirmPass() {
      this.isVisibleConfirmPass = false;
      //document.getElementById("registerForm").reset();
      // this.$forceUpdate();
      //router.push("/");
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





/* Message Modal */

#custom {
  font-size: 20px;
  font-family: "Roboto", sans-serif;
}

.btnModal {
  font-family: "Roboto", sans-serif;
  margin-top: 1em;
  margin-left: 21%;
  padding: 15px 30px;
  background-color: #e7e7e7;
  color: black;
  font-size: 16px;
  border-radius: 5px;
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.popup-modal {
  background-color: rgba(0, 0, 0, 0.5);
  font-family: "Roboto", sans-serif;
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 0.5rem;
  display: flex;
  align-items: center;
  z-index: 1;
}

.window {
  /* background: #fff; */
  background: rgb(233, 232, 253);
  border-radius: 5px;
  box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
  max-width: 480px;
  margin-left: auto;
  margin-right: auto;
  padding: 1.75rem;
}
</style>