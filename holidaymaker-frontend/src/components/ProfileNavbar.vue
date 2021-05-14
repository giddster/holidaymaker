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

<style scoped>
.tab {
  overflow: hidden;
  border: 20px solid #ccc;
  background-color: #f1f1f1;
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