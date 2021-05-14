<template>
    <div class="dropdown show">
        <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            USERNAME'S Profile
        </a>

    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
        <a class="dropdown-item" href="#"> <i class="fas fa-user-circle" id="profileIcon"></i> My Profile</a>
        <a class="dropdown-item" href="#"><i class="far fa-heart" id="heartIcon"></i> My favorites</a>
        <a class="dropdown-item" href="#"> <i class="far fa-calendar-alt" id="calendarIcon"></i> My bookings</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#">Sign out</a>
    </div>
</div>
</template>

<script>

export default{
    
}

</script>