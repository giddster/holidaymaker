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
		
		filteredHotels: [],

      	dates: {}  
		
  },

  mutations: {
	setDestinations(state, data){
		state.destinations = data
	},
	setHotels(state, data){
		state.hotels = data
	},
	
  },

  actions: {
    async fetchDestinations({commit}){
      let response = await fetch('api/Destinations/')
      let data = await response.json()
	  console.log(data)
	  commit('setDestinations', data)
    },
    
    async fetchHotels({commit}){
      let response2 = await fetch('api/Hotels/')
      let data = await response2.json()
      commit('setHotels', data)
      },

      async search({commit}, searchString){
        let response = await fetch(`/api/availablehotelsByCityName/${searchString}/${this.state.dates.checkinDate}/${this.state.dates.checkoutDate}`)
        let data = await response.json()
        console.log(data)
        commit('setFilteredHotels', data)
      },

      async setDates({commit}, dates){
        commit('setDates', dates)
      }

  },
  modules: {


  }
})






























