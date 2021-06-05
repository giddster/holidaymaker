<template>
  <body>
    <div class="login-page">
      <!-- Remove after testing -->
      <!-- <button class="btnModal" @click="open('Login Sucessful')">
        open
      </button> -->

      <div class="form">
        <form id="loginForm" class="login-form">
          <input v-model="UserEmail" type="email" placeholder="Email" />
          <input
            v-model="UserPassword"
            type="password"
            placeholder="Password"
          />
          <button @click.prevent="handleUserLogin">Login</button>
          <p class="message">
            Not registered? <router-link to="/register">Register</router-link>
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
      
  </body>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
// import { mapActions } from "vuex";
import router from "@/router/index";

export default {
  data: () => {
    return {
      user: {
        email: "",
        password: "",
      },

      isVisible: false,
      message: "",
    };
  },

  computed: {
    ...mapGetters(["IsLoggedIn"]),

    // IsLoggedIn () {
    //   return this.$store.getters.IsLoggedIn
    // }
  },

  methods: {
    ...mapActions(["loginUser"]),

    

    async handleUserLogin() {
      let user = {
        email: this.UserEmail,
        password: this.UserPassword,
      };

      console.log(this.IsLoggedIn)
      //console.log(user)

      let response = await this.loginUser(user);

      console.log(this.IsLoggedIn)

      //console.log(response);

      if (response) {
        //router.go()
        //alert("Login Successful");
        //this.reRender()
        this.open("Login Successful");
        // document.getElementById("loginForm").reset();
        // this.$forceUpdate();
        // router.push("/");
      } else {
        this.open("Login Failed");
        //alert("Login Failed");
      }
    },

    reRender() {
      this.$forceUpdate();
    },

    open(message) {
      this.message = message;
      this.isVisible = true;
    },

    close() {
      document.getElementById("loginForm").reset();
      this.$forceUpdate();
      router.push("/");
      this.isVisible = false;
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
.login-page {
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
  padding: 5px;
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

.form h3 {
  font-size: 32px;
  font-family: "Roboto", sans-serif;
}

/* Message Modal */

#custom {
  font-size: 20px;
  font-family: "Roboto", sans-serif;
}

.btnModal {
  font-family: "Roboto", sans-serif;
  margin-top: 1em;
  margin-left: 12%;
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


