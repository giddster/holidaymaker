<template>
    <div class="room-box" v-for="room in filteredRooms" :key="room.id">
        <div class="room-box-1">
            <h5>{{ room.roomType.typeName }}</h5>
            <img :src='roomImage(room.hotelId, room.roomTypeId)' class="room-image-container">
        </div>
        <div class="room-box-2">
            <p><i class="fas fa-hashtag"></i><i>Room number: {{ room.roomNo}} </i> </p>
            <p><i class="fas fa-tag"></i> {{ room.roomType.price }} SEK/night </p>
            <p> <i class="fas fa-users"></i> {{ room.roomType.capacity }} people </p>
            <p><i> <i class="fas fa-bed"></i> {{ room.noOfSpareBeds }} spare bed(s) </i></p>
            <button @click="addSelectedRoom(room)" class="btn btn-primary room-booking" data-toggle="modal" data-target="#roomsModal">Add to booking</button>
        </div>
    </div>

      <!-- GUESTS MODAL -->
<div class="modal fade" id="roomsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Your selected rooms</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
				
            <!-- ADD V-FOR BELOW TO INCREASE MODAL DYNAMICALLY -->
            <div v-for="(room, index) in selectedRooms" :key="room" class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4">
                            <h4 class="selectedroom-title">Room {{index + 1}}</h4>
                            <b>Room # {{ room.roomNo }} </b>
                            <p>Size: {{ room.roomType.capacity }} people</p>
                            <button @click="removeSelectedRoom(index)" class="btn btn-danger btn-sm">
                                <i class="far fa-trash-alt"></i> Delete
                            </button>
                        </div> 
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" @click="removeallSelectedRooms" class="btn btn-secondary" style="background:red;margin-right:100px;">
                   <i class="fas fa-trash"></i> Delete all
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    <i class="far fa-window-close"></i> Close
                </button>
                <router-link to="/booking" v-if="selectedRooms.length" @click="saveSelectedRooms" class="btn btn-primary" data-dismiss="modal"> <i class="fas fa-shopping-bag"></i> Go to booking</router-link>
                <!-- LÄGG IN EN AUTH HÄR SÅ ATT KUNDEN ÄR INLOGGAD OCH HAR KONTO -->
            </div>
		</div>
	</div>
</div>
</template>

<script>
export default {
    data() {
        return {
             selectedRooms: []
        }
     },
    computed: {
      filteredRooms() {
        return this.$store.state.filteredRooms;
      },
      roomImages() {
        return this.$store.state.roomImages;
      }
    },
    methods: {
        roomImage(HotelId, RoomTypeId){

            let img = []
            let images = this.roomImages;

            for(let image of images){
                if(image.hotelId == HotelId && image.roomTypeId == RoomTypeId){
                    img.push(image)
                }
            }
            return img[0].imageLink
        },
        addSelectedRoom(room) {
            if(!this.selectedRooms.includes(room)){
                this.selectedRooms.push(room)
                console.log('Added to selectedRooms')
            }
            else{
                alert('You already added this room.')
            }
        },
        removeSelectedRoom(index) {
            this.selectedRooms.splice(index, 1);
        },
        removeallSelectedRooms() {
            this.selectedRooms = []
        },
        saveSelectedRooms() {
            this.$store.dispatch('saveSelectedRooms', this.selectedRooms)
        }
    },
    
}
</script>

<style scoped>

.room-box {
    display: grid;
    grid-template-columns: 1fr 3fr;
    grid-template-rows: 1fr;
    grid-column-gap: 0px;
    grid-row-gap: 0px; 
    background: rgb(246, 246, 252);
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
    padding: 20px;
    margin: 20px auto;
    width: 100%;
}

.room-box-1 {
    width: 100%;
}

.room-box-2 {
    width: 100%;
    padding-left: 30px;
    padding-top: 30px;
}

.room-image-container {
    width: 400px;
    height: 200px;
    float: right;
    object-fit: cover;
    border: 1px solid darkgrey
}

.selectedroom-title {
    font-size: 20px;
}
</style>