<template>
    <h2 class="profile-title">My Profile</h2>

    <div class="profile-parent">
   
        <div class="profile-details "> 
            <div class="form">
            <h4><i class="fas fa-user-alt"></i> Profile details</h4>
             <form id ="editProfileForm" class="edit-profile-form">
                
                    <p class="profile-parent-input">First name: </p>
                    <input type="text" disabled="false" v-model="thisLoggedInUser.firstName" />
                
                    <p class="profile-parent-input">Last name: </p>
                    <input type="text" disabled="true" v-model="thisLoggedInUser.lastName"/>
                
                    <p class="profile-parent-input">Address: </p>
                    <input type="text" disabled="true" v-model="thisLoggedInUser.address"/>
                
                    <p class="profile-parent-input">ZipCode: </p>
                    <input type="text" disabled="true" v-model="thisLoggedInUser.zipCode"/>
                
                    <p class="profile-parent-input">CITY: </p>
                    <input type="text" disabled="true" v-model="thisLoggedInUser.city"/>
               
                    <p class="profile-parent-input">Country: </p>
                    <input type="text" disabled="true" v-model="thisLoggedInUser.country"/>
               
                    <p class="profile-parent-input">E-mail</p>
                    <input type="text" disabled="true" v-model="thisLoggedInUser.email"/>
                
                    <p class="profile-parent-input">Phone number: </p>
                    <input type="text" disabled="true" v-model="thisLoggedInUser.phone"/>

                    <div>
                        <button id="editProfileBtn" class="btn btn-info" @click.prevent="enableEditProfileForm">Edit profile details</button>
                        <button id="saveProfileBtn" hidden="true" class="btn btn-info" @click="saveEditedProfile">save</button>
                    </div>

              </form>

          </div>

        </div>

        <div class="profile-bookings"> 
            <h4><i class="fas fa-hotel"></i> My bookings</h4>
            TAB BETWEEN THESE
            <p>Pending: </p>
            <p>Completed: </p>
        </div>

        <div class="profile-favoritehotels" > 


            <ul >
                <li v-for="favoritehotel in getFavoriteHotels" :key="favoritehotel.id">
                    {{ favoritehotel.hotel.name }}
                    {{favoritehotel.hotel.address}}
                </li>
            </ul>
            <!-- <h4><i class="fas fa-heart"></i> My favorite hotels</h4>
             <p><i class="fas fa-hotel"></i> Hotel X</p>
             <p><i class="fas fa-map-marked-alt"></i> Address: </p>
             <hr>
             <p><i class="fas fa-hotel"></i> Hotel Y</p>
             <p><i class="fas fa-map-marked-alt"></i> Address: </p> -->



        </div>

    </div>


    
</template>


<script>
import {mapActions} from "vuex"
import router from "../../router/index"
export default {

    //async created(){
       // var result =  await this.$store.dispatch('getLoggedInUser')

        // console.log(result)

        // if(!!result === false){
        //     router.push('/Login')

        // }

   // },


    components:{ },

    computed:{


        thisLoggedInUser(){
            return this.$store.state.customers;
        },

        getFavoriteHotels(){

            return  this.$store.state.favoritehotels;
        },

        
    },

    async created(){
        await this.$store.dispatch('fetchFavoriteHotels', this.thisLoggedInUser.id)
    },
    methods:{

        ...mapActions(['editCustomer', 'fetchFavoriteHotels']),
        
        enableEditProfileForm(){
            var form = document.getElementById("editProfileForm")
            var elements = form.elements;
            for (var i = 0, len = elements.length; i < len; ++i) {
                elements[i].disabled = false;
            }
            var saveBtn = document.getElementById("saveProfileBtn")
            saveBtn.hidden = false;

        },

        saveEditedProfile(){
            var form = document.getElementById("editProfileForm")
            var elements = form.elements;
            for (var i = 0, len = elements.length; i < len; ++i) {
                elements[i].disabled = true;
            }
            var saveBtn = document.getElementById("saveProfileBtn");
            var editBtn = document.getElementById("editProfileBtn");
            saveBtn.hidden = true;
            editBtn.disabled = false;

            this.editCustomer(this.thisLoggedInUser)

        },

        


    }
}

</script>


<style scoped>

.profile-parent{
display: grid;
grid-template-columns: repeat(3, 1fr);
grid-template-rows: 1fr;
grid-column-gap: 0px;
grid-row-gap: 0px;
margin-top:  20px;
margin-left: 20px;
}

.profile-parent-input{
    margin-bottom: 0.2rem;
}

/* #saveProfileBtn{
    visibility: hidden;
} */

#editProfileBtn{
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


</style>>

