import { createStore } from "vuex";

export default createStore({
  state: {
		name: "Vue",
		
		bookings: { },
		
		customers: { },
		
		destinations: {	},
		
		favoritehotels: { },
		
		flights: { },
		
		hotels: { },
		
		reviews: [
			{ }
		],
		
		rooms: { },

		roomTypes: { },

		roomImages: [
			
			{hotelId: 1, roomTypeId: 1, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/d5422cdf_z.jpg'},
			{hotelId: 1, roomTypeId: 2, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/914ab001_z.jpg'},
			{hotelId: 1, roomTypeId: 3, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/399f56bf_z.jpg'},
			{hotelId: 2, roomTypeId: 4, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/98705039_z.jpg'},
			{hotelId: 2, roomTypeId: 5, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/03e72a86_z.jpg'},
			{hotelId: 2, roomTypeId: 6, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/a89a2e11_z.jpg'},
			{hotelId: 3, roomTypeId: 7, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/2aeff7e0_z.jpg'},
			{hotelId: 3, roomTypeId: 8, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/c6cedc8b_z.jpg'},
			{hotelId: 3, roomTypeId: 9, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/3ee97856_z.jpg'},
			{hotelId: 4, roomTypeId: 10, imageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/66c7db4d_z.jpg'},
			{hotelId: 4, roomTypeId: 11, imageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/5691c899_z.jpg'},
			{hotelId: 4, roomTypeId: 12, imageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/a7b3dd9f_z.jpg'},
			{hotelId: 5, roomTypeId: 13, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/0d212496_z.jpg'},
			{hotelId: 5, roomTypeId: 14, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/3ef83082_z.jpg'},
			{hotelId: 5, roomTypeId: 15, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/49cb80f1_z.jpg'}
		],

		hotelImages: [
			{id: 2, HotelId: 1, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/9af14a12_z.jpg'},
			{id: 3, HotelId: 1, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/38b33d0c_z.jpg'},
			{id: 4, HotelId: 1, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/4378a799_z.jpg'},
			{id: 5, HotelId: 2, ImageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/79f9823e_z.jpg'},
			{id: 6, HotelId: 2, ImageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/41c425b3_z.jpg'},
			{id: 7, HotelId: 2, ImageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/31501215_z.jpg'},
			{id: 8, HotelId: 2, ImageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/9a42f928_z.jpg'},
			{id: 9, HotelId: 3, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/c3e84ec5_z.jpg'},
			{id: 10, HotelId: 3, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/31e61624_z.jpg'},
			{id: 11, HotelId: 3, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/a56c3c11_z.jpg'},
			{id: 12, HotelId: 3, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/9cf00d92_z.jpg'},
			{id: 13, HotelId: 4, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/2faa1893_z.jpg'},
			{id: 14, HotelId: 4, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/9bbb97f0_z.jpg'},
			{id: 15, HotelId: 4, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/f1071a8d_z.jpg'},
			{id: 16, HotelId: 4, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/e3afe2b8_z.jpg'},
			{id: 17, HotelId: 5, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/2f39aa85_z.jpg'},
			{id: 18, HotelId: 5, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/da7471d3_z.jpg'},
			{id: 19, HotelId: 5, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/cb82068e_z.jpg'},
			{id: 20, HotelId: 5, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/1e9c4ac9_z.jpg'}
			],

		search: {},

		filteredHotels: [],

		filteredReviews: [],

		filteredRooms: [],

		thisHotel: {},

		reviews: [],

      	dates: {}  

		  // lagra searchString i state? Då kan den återanvändas enligt Benjamin
		
  },

  mutations: {
    setDestinations(state, data){
      state.destinations = data
    },
	setSearch(state, data){
		state.search = data
	},
    setHotels(state, data){
      state.hotels = data
    },
	setRoomTypes(state, data){
		state.roomTypes = data
	},
	setReviews(state, data){
		state.reviews = data
	  },
    setFilteredHotels(state, data){
      state.filteredHotels = data
    },
	setThisHotel(state, data){
	  state.thisHotel = data
	},
	setFilteredReviews(state, data) {
		state.filteredReviews = data
	},
	setFilteredRooms(state, data){
	  state.filteredRooms = data
	},
    setDates(state, data) {
      state.dates = data
    },
  },

  actions: {

    async fetchDestinations({commit}){
      let response = await fetch('/api/Destinations/')
      let data = await response.json()
	  console.log(data)
	  commit('setDestinations', data)
    },
    
    async fetchHotels({commit}){
      let response2 = await fetch('/api/Hotels/')
      let data = await response2.json()
      commit('setHotels', data)
      },

	  async fetchRoomTypes({commit}){
		let response = await fetch('/api/Hotels/')
		let data = await response.json()
		commit('setRoomTypes', data)
		},

	  async fetchReviews({commit}){
		let response = await fetch('/api/RoomTypes')
		let data = await response.json()
		console.log(data)
		commit('setReviews', data)
	  },
	  
	  async setDates({commit}, dates){
        commit('setDates', dates)
      },

	 //gör samma datumhämtning från filteredrooms 
	 // async search({commit}, searchString, checkInDate = this.state.dates.checkinDate, checkOutDate = this.state.dates.checkoutDate
	  	async search({commit}, searchString){
        let response = await fetch(`/api/availablehotelsByCityName/${searchString}/${this.state.dates.checkinDate}/${this.state.dates.checkoutDate}`)
        let data = await response.json()
        console.log(data)
        commit('setSearch', searchString)
        commit('setFilteredHotels', data)
      },

	  async fetchThisHotel({commit}, id){
      let response = await fetch(`/api/Hotels/${id}`)
      let data = await response.json()
	  console.log(data)
      commit('setThisHotel', data)
      },

	  async fetchFilteredReviews({commit}, id){
		let response = await fetch(`/api/reviews/${id}`)
		let data = await response.json()
		console.log(data)
		commit('setFilteredReviews', data)
	  },

	  async fetchFilteredRooms({commit}, id){
      let response = await fetch(`/api/availableRoomsByHotelId/${id}/${this.state.dates.checkinDate}/${this.state.dates.checkoutDate}`)
      let data = await response.json()
	  console.log(data)
      commit('setFilteredRooms', data)
      },

      async setDates({commit}, dates){
        commit('setDates', dates)
      },
	
	  async postReview({commit}, data){
		  console.log(data)
		  let body = {
  			rating: data.rating,
  			// customerId: data.customerId,
			customerId: data.customerId,
  			hotelId: data.hotelId,
  			heading: data.heading,
  			name: data.name,
			reviewText: data.reviewText,
			
			
		  }
		//  let response = await fetch('api/Reviews', {
		// 	 method: 'post',
		// 	 headers: {'Content-type': 'application/json'},
		// 	 body: JSON.stringify(body)
		//  })
		let requestOptions = { 
			method: 'post',
		 	headers: {'Content-type': 'application/json'},
		 	body: JSON.stringify(body)}

			 const response = await fetch('api/Reviews', requestOptions)
		 let result = await response.json()
		 console.log('resultat från backend', result)
		 commit('setReviews', result)
	  }
  },
  modules: {


  }
})






























