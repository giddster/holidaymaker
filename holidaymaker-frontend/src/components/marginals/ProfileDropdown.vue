<template>
  <div id="profileDropDown" class="dropdown show">
    <a
      class="btn btn-primary dropdown-toggle profiledropdown-button"
      role="button"
      id="dropdownMenuLink"
      data-toggle="dropdown"
      aria-haspopup="true"
      aria-expanded="false"
    >
      Profile
    </a>

    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
      <router-link to="/profile" class="dropdown-item">
        <i class="fas fa-user-circle profileIcon"></i> My Profile
      </router-link>
      

      <div class="dropdown-divider"></div>
      <a
        @click="handleLogout"
        onmouseover=""
        style="cursor: pointer"
        class="dropdown-item"
        >Sign out</a
      >
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
</template>

<script>
import { mapActions } from "vuex";
// import { mapActions } from "vuex";
//import router from "@/router/index";

export default {
  data: () => {
    return {
      isVisible: false,
      message: "",
    };
  },

  computed: {
    //...mapGetters(["IsLoggedIn"]),

    isLoggedIn (){
      return !!this.$store.state.customers.email
    }

  },

  methods: {
    ...mapActions(["logoutUser"]),

    async handleLogout() {

      //console.log(this.IsLoggedIn)

      let response = await this.logoutUser();

      // console.log(this.IsLoggedIn)

      //console.log(response);

      if (!!response) {
        //alert('You have been logged off')
        this.open("You have been logged off");
        //router.push('/')
      } else {
        // alert('Logout Failed')
        this.open("Logout Failed");
      }
    },

    open(message) {
      this.message = message;
      this.isVisible = true;
    },

    close() {
      //this.$forceUpdate();
      //router.push("/");
      this.isVisible = false;
      //this.$forceUpdate();
    },
  },
};
</script>

<style scoped>
#profileDropDown {
  margin-right: 10px;
}

.dropdown-menu.show {
  margin-right: 50px;
}

/* .dropdown-item{
    margin-left: 2px
} */

.dropdown-menu {
  margin: 0.125rem -1.75rem;
}

.profileIcon {
  color: lightcoral;
}

.profiledropdown-button {
  background: rgb(248, 157, 157);
  border-radius: 5px;
  border: 1px solid lightcoral;
}

.profiledropdown-button:hover {
  background: rgb(247, 108, 108);
  border-radius: 5px;
  border: 1px solid lightcoral;
}

/* Message Modal */

#custom {
  font-size: 20px;
  font-family: "Roboto", sans-serif;
}

.btnModal {
  margin-top: 1em;
  margin-left: 25%;
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
