<template>
  <div class="profile-title" ref="top">
    <div class="div1"> 
<h4><i class="fas fa-user-alt"></i> Profile details</h4>
<br>
            <p>First name: </p>
            <p>Last name: </p>
            <p>Address:  XXX, ZIPCODE, CITY</p>
            <p>Country: </p>
            <p>E-mail</p>
            <p>Phone number: </p>
            <button class="btn btn-info">Edit profile details</button> 
  </div>

    <div class="div2"> 

    <h4><i class="fas fa-heart"></i> My favorite hotels</h4>
    <br>
             <p><i class="fas fa-hotel"></i> Hotel X</p>
             <p><i class="fas fa-map-marked-alt"></i> Address: </p>
             <hr>
             <p><i class="fas fa-hotel"></i> Hotel Y</p>
             <p><i class="fas fa-map-marked-alt"></i> Address: </p>


   </div>
</div>
<div class="profile-title" ref="top">

<div class="div3">
 <h4><i class="fas fa-hotel"></i> My bookings</h4>
 <br>
            TAB BETWEEN THESE
            <p>Pending: </p>
            <p>Completed: </p>
</div>

<div class="div4">

</div>

</div>

 
</template>

<script>

export default {
    components:{ }
}
</script>


<style>

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