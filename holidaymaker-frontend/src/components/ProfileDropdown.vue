<template>
    <div id ="profileDropDown" class="dropdown show">
        <a  class="btn btn-primary dropdown-toggle profiledropdown-button" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           User
        </a>

    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
        <router-link to="/profile" class="dropdown-item"> <i class="fas fa-user-circle profileIcon"></i> My Profile </router-link>
        <router-link to="/myfavorites" class="dropdown-item"> <i class="far fa-heart profileIcon"></i> My favorites </router-link>
        <router-link to="/mybookings" class="dropdown-item"> <i class="far fa-calendar-alt profileIcon"></i> My bookings </router-link>
        
        <div class="dropdown-divider"></div>
        <a @click="handleLogout" onmouseover="" style="cursor: pointer;" class="dropdown-item">Sign out</a>
    </div>
</div>
</template>

<script>
import {mapActions} from 'vuex'
import router from '../router/index'

export default{
    
    methods:{
        ...mapActions(["logoutUser"]),

        async handleLogout() {

            let response = await this.logoutUser()

            console.log(response)

            if(response){
                alert('you have been logged off')
                router.push('/')
            }
            else{
                    alert('Logout Failed')
            }

        }
    }


}

</script>

<style>

.profileIcon {
    color:lightcoral;
}

.profiledropdown-button {
    background:rgb(248, 157, 157);
    border-radius: 5px;
    border: 1px solid lightcoral;
}

.profiledropdown-button:hover {
    background: rgb(247, 108, 108);
    border-radius: 5px;
    border: 1px solid lightcoral;
}

/* .dropdown-item{
    po
} */

</style>