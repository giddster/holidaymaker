<template>
    <h2 class="profile-title">My Profile</h2>

    <div class="profile-parent">
    
        <div class="profile-details"> 
            <h4><i class="fas fa-user-alt"></i> Profile details</h4>
            <p>First name: </p>
            <p>Last name: </p>
            <p>Address:  XXX, ZIPCODE, CITY</p>
            <p>Country: </p>
            <p>E-mail</p>
            <p>Phone number: </p>
            <button class="btn btn-info">Edit profile details</button> TRIGGER A MODAL
        </div>

        <div class="profile-bookings"> 
            <h4><i class="fas fa-hotel"></i> My bookings</h4>
            TAB BETWEEN THESE
            <p>Pending: </p>
            <p>Completed: </p>
        </div>

        <div class="profile-favoritehotels"> 
            <h4><i class="fas fa-heart"></i> My favorite hotels</h4>
             <p><i class="fas fa-hotel"></i> Hotel X</p>
             <p><i class="fas fa-map-marked-alt"></i> Address: </p>
             <hr>
             <p><i class="fas fa-hotel"></i> Hotel Y</p>
             <p><i class="fas fa-map-marked-alt"></i> Address: </p>
        </div>

    </div>


    
</template>


<script>

export default {
    components:{ }
}
</script>


<style scoped>

.profile-parent{
display: grid;
grid-template-columns: repeat(3, 1fr);
grid-template-rows: 1fr;
grid-column-gap: 0px;
grid-row-gap: 0px;
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

