<template>
    <div class="dropdown show">
        <a class="btn btn-primary dropdown-toggle profiledropdown-button" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            USERNAME'S Profile
        </a>

    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
        <router-link to="/profile" class="dropdown-item"> <i class="fas fa-user-circle profileIcon"></i> My Profile </router-link>
        <router-link to="/myfavorites" class="dropdown-item"> <i class="far fa-heart profileIcon"></i> My favorites </router-link>
        <router-link to="/mybookings" class="dropdown-item"> <i class="far fa-calendar-alt profileIcon"></i> My bookings </router-link>
        
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#">Sign out</a>
    </div>
</div>
</template>

<script>

export default{
    
}

</script>

<style>

.profileIcon {
    color:lightcoral;
}

.profiledropdown-button {
    background:rgb(248, 157, 157);
}

.profiledropdown-button:hover {
    background: rgb(247, 108, 108);
}

</style>