<template>

  <div class="register-title" ref="top">
    <div class="div1"> 
<h4><i class="fas fa-user-alt" ></i> Create your HolidayMaker account</h4>
<br>

  
    <div class="register-page">

    
   <center> <h4>Create a new account</h4></center>
      <div class="form" >
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

      <button class="btn btn-info" @click.prevent="handleUserRegister">Register</button> 

      
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
            <br>
            <center>
            <button class="btn btn-info" @click="close">Close</button>
            </center>
          </div>
        </div>
      </transition>

      <transition name="fade">
        <div class="popup-modal" v-if="isVisibleConfirmPass">
          <div class="window">
            <slot>
              <h3 id="custom">{{ message }}</h3>
              <br>
            </slot>
            <center>
            <button class="btn btn-info" @click="closeConfirmPass">Close</button>
            </center>
          </div>
        </div>
      </transition>

  


  </div>


</div>



  
</template>

<script>
import {mapActions} from 'vuex'
import router from "@/router/index";

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

  computed: {
    async isLoggedIn (){
      return await !!this.$store.state.customers.email
    }
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

            console.log(this.isLoggedIn)

            if(this.isLoggedIn){
                this.open("Registration Successful");
                document.getElementById("registerForm").reset();
            }
            else{
              this.openConfirmPass("Registration Failed");
            }
        }
        else{
            this.openConfirmPass("Confirm Password");
        }
    },

    open(message) {
      this.message = message;
      this.isVisible = true;
    },

    close() {
      document.getElementById("registerForm").reset();
      router.push("/");
      this.isVisible = false;
    },

    openConfirmPass(message) {
      this.message = message;
      this.isVisibleConfirmPass = true;
    },

    closeConfirmPass() {
      this.isVisibleConfirmPass = false;
    },
    
  },
};
</script>



<style>

.register-page {
  width: 360px;
  padding: 10% 0 0;
  margin: auto;
  background: #fffFFF;
  
}
.form {
  position: relative;
  z-index: 1;
  
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px 45px 15px 45px;
  text-align: center;
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #ffffff;
  width: 100%;
  border: 1;
  border-color:grey;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
  border-radius: 4px;
  font:000000;
  color:000000;
}


.form .message {
  margin: 25px;
  color: 000000;
  font-size: 15px;
  
}
.form .message a {
  color: #000000;
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
  background-color: white;
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
  max-width: 200x;
  margin-left: auto;
  margin-right: auto;
  padding: 1.75rem;
}

.register-title {
  display: grid;
  grid-template-columns: auto;
  grid-template-rows: auto auto auto;
  grid-column-gap: 0px;
  grid-row-gap: 0px;
  background: rgb(246, 246, 252);
  margin: 20px auto;
  padding: 12px;
  max-width: 80%;
  border:black;
  border-style: solid;
  border-width: thin;
  border-radius: 10px;
}

.empty-div {
  visibility: hidden;
}

.div1 { 
    grid-area: 1 ; 
}




</style>