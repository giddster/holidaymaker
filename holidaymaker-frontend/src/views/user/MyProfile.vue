<template>
  <div class="profile-parent">
    <div class="profile-details">
      <!-- <h2 class="profile-title">My Profile</h2> -->

      <div class="form">
        <h4><i class="fas fa-user-alt"></i> Profile details</h4>
        <form id="editProfileForm" class="edit-profile-form">
          <p class="profile-parent-input">First name:</p>
          <input
            type="text"
            disabled="false"
            v-model="thisLoggedInUser.firstName"
          />

          <p class="profile-parent-input">Last name:</p>
          <input
            type="text"
            disabled="true"
            v-model="thisLoggedInUser.lastName"
          />

          <p class="profile-parent-input">Address:</p>
          <input
            type="text"
            disabled="true"
            v-model="thisLoggedInUser.address"
          />

          <p class="profile-parent-input">ZipCode:</p>
          <input
            type="text"
            disabled="true"
            v-model="thisLoggedInUser.zipCode"
          />

          <p class="profile-parent-input">CITY:</p>
          <input type="text" disabled="true" v-model="thisLoggedInUser.city" />

          <p class="profile-parent-input">Country:</p>
          <input
            type="text"
            disabled="true"
            v-model="thisLoggedInUser.country"
          />

          <p class="profile-parent-input">E-mail</p>
          <input readonly type="text" disabled="true" v-model="thisLoggedInUser.email" />

          <p class="profile-parent-input">Phone number:</p>
          <input type="text" disabled="true" v-model="thisLoggedInUser.phone" />

          <div>
            <button
              id="editProfileBtn"
              class="btn btn-info"
              @click.prevent="enableEditProfileForm"
            >
              Edit profile details
            </button>
            <button
              id="saveProfileBtn"
              hidden="true"
              class="btn btn-info"
              @click="saveEditedProfile"
            >
              save
            </button>
          </div>
        </form>
      </div>
    </div>

    <div class="profile-bookings">
        <ul style="list-style: none">
          <h4><i class="fas fa-hotel"></i> My bookings</h4>

          <li v-for="booking in getCustomerBookings" :key="booking.id">

            <!-- console.log(booking) -->

            <p><i class="fas fa-hotel"></i> Booking id: {{ booking.id }}</p>  
            <!-- <p>Hotel:  </p> -->

            <p v-if="booking.isPending"><i class="fas fa-plane-departure"></i> Trip pending</p>
            <p v-else ><i class="fas fa-plane-arrival"></i> Trip completed</p>
            <!-- <i class="fas fa-check"></i> -->
            <!-- <br> -->
            <hr>

          </li>

        </ul>

    </div>

    <div class="profile-favoritehotels">
      <ul style="list-style: none">
        <h4><i class="fas fa-heart"></i> My favorite hotels</h4>

        <li v-for="favoritehotel in getFavoriteHotels" :key="favoritehotel.id">

          <p><i class="fas fa-hotel"></i> {{ favoritehotel.hotel.name }}</p>
          <p><i class="fas fa-map-marked-alt"></i> {{ favoritehotel.hotel.address }}</p>

          <hr>

        </li>
      </ul>
    </div>
  </div>
</template>
  

<script>
import { mapActions } from "vuex";
export default {
  components: {},

  computed: {
    thisLoggedInUser() {
      return this.$store.state.customers;
    },

    getFavoriteHotels() {
      return this.$store.state.favoritehotels;
    },

    getCustomerBookings() {
      return this.$store.state.customerBookings;
    },
  },

  async created() {
    await this.$store.dispatch("fetchFavoriteHotels", this.thisLoggedInUser.id);
    await this.$store.dispatch(
      "fetchCustomerBookings",
      this.thisLoggedInUser.id
    );
  },
  methods: {
    ...mapActions([
      "editCustomer",
      "fetchFavoriteHotels",
      "fetchCustomerBookings",
    ]),

    enableEditProfileForm() {
      var form = document.getElementById("editProfileForm");
      var elements = form.elements;
      for (var i = 0, len = elements.length; i < len; ++i) {
        elements[i].disabled = false;
      }
      var saveBtn = document.getElementById("saveProfileBtn");
      saveBtn.hidden = false;
    },

    saveEditedProfile() {
      var form = document.getElementById("editProfileForm");
      var elements = form.elements;
      for (var i = 0, len = elements.length; i < len; ++i) {
        elements[i].disabled = true;
      }
      var saveBtn = document.getElementById("saveProfileBtn");
      var editBtn = document.getElementById("editProfileBtn");
      saveBtn.hidden = true;
      editBtn.disabled = false;

      this.editCustomer(this.thisLoggedInUser);
    },
  },
};
</script>


<style scoped>
.profile-parent {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 1fr;
  grid-column-gap: 0px;
  grid-row-gap: 0px;
  margin-top: 20px;
  margin-left: 20px;
}
.profile-title {
  display: grid;
  grid-template-columns: 50% 50%;
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

.profile-details {
  margin-left: 2em;
}
.profile-parent-input {
  margin-bottom: 0.2rem;
}

/* #saveProfileBtn{
    visibility: hidden;
} */

#editProfileBtn {
  margin-top: 1rem;
  margin-bottom: 1rem;
  margin-right: 1rem;
}

.div1 {
  grid-area: 1 / 1 / 2 / 2;
}
.div2 {
  grid-area: 1 / 2 / 2 / 3;
}
.div3 {
  grid-area: 1 / 3 / 2 / 4;
}

.div4 { 
    grid-area: 1 / 3 / 2 / 4; 
}

.carousel-control-arrowprev:after {
  content: '<';
  font-size: 30px;
  font-weight: bold;
  color: lightcoral;
}

.carousel-control-arrownext:after {
  content: '>';
  font-size: 30px;
  font-weight: bold;
  color: lightcoral;
}

.star-rating-about {
  font-size: 28px;
  margin-left: 10px;
  color: red;
}

.backtotop-button{
  float: right;
  margin: 0 auto;
  background: lightcoral;
  border-radius: 5px;
  border: 1px solid lightcoral;
}

.bool-icon {
  font-size: 25px;
  margin-left: 10px;
  color: rgb(38, 177, 38);
  border: 1px solid black;
  border-style: hidden;
  text-align: center;
}

</style>