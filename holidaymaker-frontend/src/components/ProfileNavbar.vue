<template>

    <div class="profile-page">
            <div class="tab">
                <router-link class="routerlink" to="/myfavorites">My Favorites</router-link>
                <router-link class="routerlink" to="/mybookings">My Bookings</router-link>
                <router-link class="routerlink" to="/myprofile">Profile</router-link> 
            </div>
    </div>
    
</template>

<script>
export default {
    
}
</script>

<style>


.tab {
  overflow: hidden;
  border: 2px solid rgb(156, 155, 155);
  border-radius: 10px;
  background: rgb(246, 246, 252);
  max-width: 90%;
  margin: 20px auto;
}
.tab .routerlink {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
  
}
.tab .routerlink:hover {
  background-color: #ddd;
}
.tab .routerlink:active {
  background-color: rgb(179, 176, 176);
}

</style>