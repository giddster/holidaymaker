<template>

<table width="1200" border="0">
  <tbody>
    <tr>
      <td>
        
        <input type="text" name="Name" id="Name" value="HotelName"> &#9733; &#9733; &#9733; &#9733; &#9733; 
        <br>
		  
        <br>
        
        
        
        
        <label>
          <input type="checkbox" name="HasWifi" value="kryssruta"  id="HasWifi">
          Wi-Fi</label>
        
        <label>
          <input type="checkbox" name="IsCancelled" value="kryssruta" id="IsCancelled">
          Free Cancellation</label>
        
        <label>
          <input type="checkbox" name="HasAllInclusive" value="kryssruta" id="HasAllInclusive">
          All Inclusive</label>
        
        <br>
        <br>
        
        <input type="checkbox" name="FavoriteHotelsId" id="FavoriteHotelsId">
        <label for="checkbox">Add Hotel to favorites </label>
      </td>
      <td>
		  <label for="range">Price from:</label>
<input type="range" name="TypeName" id="TypeName">
		<br>
		  <br>
          <input type="button" name="TypeName" id="TypeName" value="Choose this room" class="button">
      </td>
    </tr>
  </tbody>
</table>
<br>
	
<table width="1200" border="0">
  <tbody>
    <tr>
      <td> <img src="https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/447c582c_z.jpg" width="760" height="500" alt="">
        <table width="750" border="0">
          <tbody>
          <tr>
            <td><img src="https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/9af14a12_z.jpg" width="250" height="167" alt=""></td>
            <td><img src="https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/38b33d0c_z.jpg" width="250" height="167" alt=""></td>
            <td><img src="https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/4378a799_z.jpg" width="250" height="167" alt=""></td>
          </tr>
        </tbody>
    </table>
        <B>About Hotel</B><br>
       
        
<input type="text" name="Description" id="Description" value="The hotel is close to the beach and have a nice skybar" style="height:120px; width:400px;"> <br> <br> 
  <label>
    <input type="checkbox" name="HasPool" value="kryssruta" id="HasPool">
    Pool</label>
  
  <label>
    <input type="checkbox" name="SeaSide" value="kryssruta" id="SeaSide">
    Seaview</label>
  
  <label>
    <input type="checkbox" name="HasEntertainment" value="kryssruta" id="HasEntertainment">
    Entertainment</label>
  
  <label>
    <input type="checkbox" name="HasKidClub" value="kryssruta" id="HasKidClub">
    KidClub</label>
  
  <label>
    <input type="checkbox" name="HasRestaurant" value="kryssruta" id="HasRestaurant">
    Restaurant</label>
 <br>
  <label>
    <input type="checkbox" name="HasHalfPension" value="kryssruta" id="HasHalfPension">
    Halfpension</label>
  
  <label>
    <input type="checkbox" name="HasWholePension" value="kryssruta" id="HasWholePension">
    Wholepension</label>
 
  <label>
    <input type="checkbox" name="HasAllInclusive" value="kryssruta" id="HasAllInclusive">
    Allinclusive</label>
  
  <label>
    <input type="checkbox" name="HasWifi" value="kryssruta" id="HasWifi">
    Wi-Fi</label>
  
  <label>
    <input type="checkbox" name="HasRoomService" value="kryssruta" id="HasRoomService">
    Roomservice</label>
  <br>
<br>
		  
		  
</td>
      <td>
		  
		  
		  <p> <b>Hotel info:</b> </p><br>
	  
		  
		    
		   <input type="text" name="Name" id="Name" value="HotelName">  
        <br>
	    <input type="text" name="Address" id="Address" value="StreetAddress">  
        <br>
          
        <input type="text" name="ZipCode" id="ZipCode" value="ZipCode" style=" width:70px;">
	    <input type="text" name="City" id="City" value="City">
		  <br>
		   <input type="text" name="Country" id="Country" value="Country"> 
       
		  <br>
		  <br>
		  <input type="number" name="DistanceToBeach" id="DistanceToBeach" value="850" style="width:50px;">
	<label for="DistanceToBeach">Meters to beach</label>
		  <br>
		    <input type="number" name="DistanceToCityCenter" id="DistanceToCityCenter" value="150" style="width:50px;">
	<label for="DistanceToCityCenter">Meters to city center</label>
		  <br>
		  <br>
<img src="https://cm01.mapion.co.jp/m2/map?usr=atlas_org&island=org&lon=139.70960376&lat=35.6886135&level=16&size=633x510" width="323" height="200" alt=""/>
        <p></p>
      
        <br>
<input type="number" name="Rating" id="Rating" value="9.1" style="width:40px;">
<label for="Rating">Rating</label>
        <br>
        <p>192 Guestreviews at HolidayMakers.com</p>
        <label for="ReviewText">Latest Guestreview<br>
        </label>
        <input type="text" name="ReviewText" id="ReviewText" value="Very nice hotel close to the beach, bla bla bla bla bla lbla bla" style="height:60px; width:300px;">
     <br>
</td>
    </tr>
  </tbody>
</table>
<br>

	
      <table width="1200" border="0">
          <label for="NoOfAdults">Your choose for</label>
          <input type="number" name="NoOfAdults" id="NoOfAdults" style="width:50px;">guest.
          <br>
			<br>
			
           <label for="CheckInDate">CheckIn date:</label>
      <input type="date" name="CheckInDate" id="CheckInDate">
												 
	<label for="CheckInDate">CheckOut Date:</label>
      <input type="date" name="CheckOutDate" id="CheckOutDate">
			
 <label for="RoomNo">Number of room:</label>
          <input type="number" name="RoomNo" id="RoomNo" style="width:50px;" value="2">
			
			<label for="NoOfAdults">Number of Adults:</label>
          <input type="number" name="NoOfAdults" id="NoOfAdults" style="width:50px;" value="2">
          <br>
          
         </table> 
          
       <br>
     <br>
		  
		  <table width="1200" border="0">
  <tbody>
    <tr>
      <td>
		  <b>Standardroom / Dubbleroom</b>
		  <br>
		  <br>
		  <img src="https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/d5422cdf_z.jpg" width="250" height="167" alt="">
		
		  <p>✓Sleeping room for 3 persons</p>
		  <p>✓Queensize-bed or 2 single-beds</p>
		</td>
      <td>
		  <p>✓Can be paid at the hotel</p>
		  <p>✓Free Wi-Fi</p>
		   <p>✓Breakfast included</p>
		  <p>✓1 child staying for free </p>
		</td>
      <td>
		  <b>Price including everything</b>
		  <br>
		  <br>
		   <input type="number" name="TotalPrice" id="TotalPrice" style="width:60px;" value="500"> <b>SEK</b>
		  <br>
		  <br>
		 <input type="button" name="Book" id="Book" value="Book" class="button" >
		
		</td>
    </tr>
  </tbody>
</table>

	<br>
	<br>
	<table width="1200" border="0">
  <tbody>
    <tr>
      <td>
		  <b>Superior-Room / Dubbleroom</b>
		  <br>
		  <br>
		  <img src="https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/914ab001_z.jpg" width="250" height="167" alt="">
		
		  <p>✓Sleeping room for 3 persons</p>
		  <p>✓Queensize-bed or 2 single-beds</p>
		</td>
      <td>
		  <p>✓Can be paid at the hotel</p>
		  <p>✓Free Wi-Fi</p>
		   <p>✓Breakfast included</p>
		  <p>✓1 child staying for free </p>
		</td>
      <td>
		  <b>Price including everything</b>
		  <br>
		  <br>
		   <input type="number" name="TotalPrice" id="TotalPrice" style="width:60px;" value="750"> <b>SEK</b>
		  <br>
		  <br>
		 <input type="button" name="Book" id="Book" value="Book" class="button">
		
		</td>
    </tr>
  </tbody>
</table>
	
	<br>
	<br>
	
	<table width="1200" border="0">
  <tbody>
    <tr>
      <td>
		  <b>Suite-Room / Dubbleroom</b>
		  <br>
		  <br>
		  <img src="https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/399f56bf_z.jpg" width="250" height="167" alt="">
		
		  <p>✓Sleeping room for 3 persons</p>
		  <p>✓Queensize-bed or 2 single-beds</p>
		</td>
      <td>
		  <p>✓Can be paid at the hotel</p>
		  <p>✓Free Wi-Fi</p>
		   <p>✓Breakfast included</p>
		  <p>✓1 child staying for free </p>
		</td>
      <td>
		  <b>Price including everything</b>
		  <br>
		  <br>
		   <input type="number" name="TotalPrice" id="TotalPrice" style="width:60px;" value="1000"> <b>SEK</b>
		  <br>
		  <br>
		 <input type="button" name="Book" id="Book" value="Book" class="button">
		
		</td>
    </tr>
  </tbody>
</table>
  

</template>



<style>

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: #2c3e50;
}


#nav a {
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}


 body {
     margin: 0;
     padding: 0;
     font-family: 'Open Sans', serif;
     background: white
     
     }

     .button {
  display: inline-block;
  padding: 10px 20px;
  font-size: 18px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 12px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

input[type=text] {
  
  
  box-sizing: border-box;
  border: 0px solid black;
  background-color: #FFFFFF;
  color: #000000;
  font-family: 'Open Sans', serif;
  font-size: 18px;
  
}

input[type=number] {
  
  
  box-sizing: border-box;
  border: 0px solid black;
  background-color: #FFFFFF;
  color: #000000;
  font-family: 'Open Sans', serif;
  font-size: 18px;
  
}

</style>