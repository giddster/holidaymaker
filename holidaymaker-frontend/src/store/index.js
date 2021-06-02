import { createStore } from "vuex";

export default createStore({
  state: {
		name: "Vue",
		
		bookings: {
				id: 0,
				checkInDate: "",
				checkOutDate: "",
				noOfAdults: 0,
				noOfChildren: 0,
				isPending: false,
				isCancelled: false,
				totalPrice: 0.0,
				flightId: 0,
				customerId: 0,
				customer: null,
				flight: null,
				bookingXrooms: [ ]
		},
		
		customers: {
				id: 0,
				firstName: "",
				lastName: "",
				address: "",
				zipCode: "",
				city: "",
				country: "",
				email: "",
				phone: "",
				isLoggedIn: false,
				password: "",
				bookings: [],
				favoriteHotels: [],
				reviews: []
		},
		
		destinations: {
					id: 0,
					country: "",
					city: "",
					flights: [],
					hotels: []
		},
		
		favoritehotels: {
					id: 0,
					hotelId: 0,
					customerId: 0,
					customer: null,
					hotel: null
		},
		
		flights: {
				id: 1,
				aviatorName: "",
				departureCity: "",
				departureCountry: "",
				isReturnFlight: true,
				price: 0.0,
				destinationId: 1,
				destination: null,
				bookings: []
		},
		
		hotels: {
			id: 0,
			name: "",
			zipCode: "",
			address: "",
			starRating: 0.0,
			distanceToBeach: 0.0,
			distanceToCityCenter: 0.0,
			hasPool: false,
			hasSeaSide: false,
			hasEntertainment: false,
			hasKidsClub: false,
			hasRestaurant: false,
			hasHalfPension: false,
			hasWholePension: false,
			hasAllInclusive: false,
			hasWifi: false,
			hasRoomService: false,
			destinationId: 0,
			description: "",
			destination: null,
			favoriteHotels: [],
			hotelImages: [],
			reviews: [],
			rooms: []
		},
		
		reviews: [
			{
				id: 0,
				rating: 0.0,
				customerId: 0,
				hotelId: 0,
				heading: null,
				name: null,
				reviewText: "",
				customer: null,
				hotel: null
			}
		],
		
		rooms: {
			id: 0,
			hotelId: 0,
			roomNo: 0,
			noOfSpareBeds: 0,
			isSelfCleaning: true,
			isOccupied: null,
			roomTypeId: 0,
			hotel: null,
			roomType: null,
			bookingXrooms: [],
			roomImages: [] //innehållet i varje array-index måste representeras rätt här
		},

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
		

		filteredHotels: [],

		filteredRooms: [],

		thisHotel: {},

      	dates: {}  

		  // lagra searchString i state? Då kan den återanvändas enligt Benjamin
		
  },

  mutations: {
    setDestinations(state, data){
      state.destinations = data
    },
    setHotels(state, data){
      state.hotels = data
    },
    setFilteredHotels(state, data){
      state.filteredHotels = data
    },
	setThisHotel(state, data){
	  state.thisHotel = data
	},
	setFilteredRooms(state, data){
	  state.filteredRooms = data
	},
    setDates(state, data) {
      state.dates = data
    }

  },

  actions: {
    async fetchDestinations({commit}){
      let response = await fetch('/api/Destinations/')
      let data = await response.json()
	//   console.log(data)
	  commit('setDestinations', data)
    },
    
    async fetchHotels({commit}){
      let response2 = await fetch('api/Hotels/')
      let data = await response2.json()
      commit('setHotels', data)
      },
	  
	  async setDates({commit}, dates){
        commit('setDates', dates)
      },

	  async search({commit}, searchString){
        let response = await fetch(`/api/availablehotelsByCityName/${searchString}/${this.state.dates.checkinDate}/${this.state.dates.checkoutDate}`)
        let data = await response.json()
        console.log(data)
        commit('setFilteredHotels', data)
      },

	  async fetchThisHotel({commit}, id){
      let response = await fetch(`/api/Hotels/${id}`)
      let data = await response.json()
	  console.log(data)
      commit('setThisHotel', data)
      },

	  async fetchFilteredRooms({commit}, id){
      let response = await fetch(`/api/availableRoomsByHotelId/${id}/${this.state.dates.checkinDate}/${this.state.dates.checkoutDate}`)
      let data = await response.json()
	  console.log(data)
      commit('setFilteredRooms', data)
      },

      

  },
  modules: {


  }
})






























