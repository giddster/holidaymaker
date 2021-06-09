import { routerKey } from "vue-router";
import { createStore } from "vuex";
import router from "../router/index";

export default createStore({
	state: {
		name: "Vue",

		bookings: {},

		customerBookings: {},

		customers: {},

		destinations: {},

		favoritehotels: {},

		flights: {},

		hotels: {},

		reviews: [
			{}
		],

		rooms: {},

		roomTypes: {},

		user: {
			userName: "",
			email: "",
			password: "",
		},

		loggedInUser: {
			userName: "",
			password: "",
			IsLoggedIn: window.localStorage.getItem('isLoggedIn')
		},

		roomImages: [

			{ hotelId: 1, roomTypeId: 1, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/d5422cdf_z.jpg' },
			{ hotelId: 1, roomTypeId: 2, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/914ab001_z.jpg' },
			{ hotelId: 1, roomTypeId: 3, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/399f56bf_z.jpg' },
			{ hotelId: 2, roomTypeId: 4, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/98705039_z.jpg' },
			{ hotelId: 2, roomTypeId: 5, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/03e72a86_z.jpg' },
			{ hotelId: 2, roomTypeId: 6, imageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/a89a2e11_z.jpg' },
			{ hotelId: 3, roomTypeId: 7, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/2aeff7e0_z.jpg' },
			{ hotelId: 3, roomTypeId: 8, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/c6cedc8b_z.jpg' },
			{ hotelId: 3, roomTypeId: 9, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/3ee97856_z.jpg' },
			{ hotelId: 4, roomTypeId: 10, imageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/66c7db4d_z.jpg' },
			{ hotelId: 4, roomTypeId: 11, imageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/5691c899_z.jpg' },
			{ hotelId: 4, roomTypeId: 12, imageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/a7b3dd9f_z.jpg' },
			{ hotelId: 5, roomTypeId: 13, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/0d212496_z.jpg' },
			{ hotelId: 5, roomTypeId: 14, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/3ef83082_z.jpg' },
			{ hotelId: 5, roomTypeId: 15, imageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/49cb80f1_z.jpg' }
		],

		hotelImages: [
			{ id: 2, HotelId: 1, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/9af14a12_z.jpg' },
			{ id: 3, HotelId: 1, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/38b33d0c_z.jpg' },
			{ id: 4, HotelId: 1, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/4378a799_z.jpg' },
			{ id: 5, HotelId: 2, ImageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/79f9823e_z.jpg' },
			{ id: 6, HotelId: 2, ImageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/41c425b3_z.jpg' },
			{ id: 7, HotelId: 2, ImageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/31501215_z.jpg' },
			{ id: 8, HotelId: 2, ImageLink: 'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/9a42f928_z.jpg' },
			{ id: 9, HotelId: 3, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/c3e84ec5_z.jpg' },
			{ id: 10, HotelId: 3, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/31e61624_z.jpg' },
			{ id: 11, HotelId: 3, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/a56c3c11_z.jpg' },
			{ id: 12, HotelId: 3, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/9cf00d92_z.jpg' },
			{ id: 13, HotelId: 4, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/2faa1893_z.jpg' },
			{ id: 14, HotelId: 4, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/9bbb97f0_z.jpg' },
			{ id: 15, HotelId: 4, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/f1071a8d_z.jpg' },
			{ id: 16, HotelId: 4, ImageLink: 'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/e3afe2b8_z.jpg' },
			{ id: 17, HotelId: 5, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/2f39aa85_z.jpg' },
			{ id: 18, HotelId: 5, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/da7471d3_z.jpg' },
			{ id: 19, HotelId: 5, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/cb82068e_z.jpg' },
			{ id: 20, HotelId: 5, ImageLink: 'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/1e9c4ac9_z.jpg' }
		],

		search: {},

		filteredHotels: [],

		filteredReviews: [],

		filteredRooms: [],

		thisHotel: {},

		reviews: [],

		dates: {},

		selectedRooms: [],

		totalBookingPrice: {price: 0},

	},

	mutations: {

		setCustomerBookings(state, data){
			state.customerBookings = data
		},

		setDestinations(state, data) {
			state.destinations = data
		},
		setDates(state, data) {
			state.dates = data
		},
		setSearch(state, data) {
			state.search = data
		},
		setHotels(state, data) {
			state.hotels = data
		},
		setFavoriteHotel(state, data){
			state.favoritehotels = data
		},
		
		setReviews(state, data) {
			state.reviews = data
		},
		setFilteredHotels(state, data) {
			state.filteredHotels = data
		},
		setThisHotel(state, data) {
			state.thisHotel = data
		},
		setFilteredReviews(state, data) {
			state.filteredReviews = data
		},
		setFilteredRooms(state, data) {
			state.filteredRooms = data
		},
		setUser(state, data) {
			state.user = data
		},
		setSelectedRooms(state, data) {
			state.selectedRooms = data
		},

		LogInUser(state, data) {
			state.loggedInUser = data
			//   state.loggedInUser.isLoggedIn = true
			state.loggedInUser.isLoggedIn = window.localStorage.setItem('isLoggedIn', true)
			console.log(state.loggedInUser.isLoggedIn)
		},

		Logout(state) {
			state.customer = {};
			//state.loggedInUser.userName = null
			//state.loggedInUser.password = null
			//   state.loggedInUser.isLoggedIn = false
			//state.loggedInUser.isLoggedIn = window.localStorage.removeItem('isLoggedIn')

		},

		SetLoggedInUser(state, data) {
			state.customers = data
			//console.log(state.customers)
		}
	},

	getters: {

		IsLoggedIn: (state) => {!!state.customers.email}
		//  IsLoggedIn(state){
		//  if(state.loggedInUser.IsLoggedIn === 'true' ){

		//   return true}
		//}
	},

	actions: {

		async fetchDestinations({ commit }) {
			let response = await fetch('/api/Destinations/')
			let data = await response.json()
			console.log(data)
			commit('setDestinations', data)
		},

		async fetchHotels({ commit }) {
			let response2 = await fetch('/api/Hotels/')
			let data = await response2.json()
			commit('setHotels', data)
		},

		async fetchReviews({ commit }) {
			let response = await fetch('/api/RoomTypes')
			let data = await response.json()
			console.log(data)
			commit('setReviews', data)
		},

		async saveDates({ commit }, dates) {
			commit('setDates', dates)
			console.log('The following dates have been saved to store:')
			console.log(this.state.dates)
		},

		//gör samma datumhämtning från filteredrooms 
		// async search({commit}, searchString, checkInDate = this.state.dates.checkinDate, checkOutDate = this.state.dates.checkoutDate
		async search({ commit }, searchString) {
			let response = await fetch(`/api/availablehotelsByCityOrCountryName/${searchString}/${this.state.dates.checkinDate}/${this.state.dates.checkoutDate}`)
			let data = await response.json()
			console.log(data)
			commit('setSearch', searchString)
			commit('setFilteredHotels', data)
		},

		async fetchThisHotel({ commit }, id) {
			let response = await fetch(`/api/Hotels/${id}`)
			let data = await response.json()
			console.log(data)
			commit('setThisHotel', data)
		},


		async addHotelToFavorites({commit}, data){

			console.log(data)
			let body = {

				hotelId : data.hotelId,
				customerId : data.customerId,
			}

			console.log(body)
			let requestOptions = {
				method: 'POST',
				headers: { 'Content-type': 'application/json' },
				body: JSON.stringify(body)
			}
			console.log(requestOptions)


			const response = await fetch('/api/FavoriteHotels', requestOptions)
			let result = await response.json()
			console.log('resultat från backend', result)
			commit('setFavoriteHotel', result)
			alert('Added to your favorite hotels')

		},


		async fetchFavoriteHotels({commit}, id){
			let response = await fetch(`/api/FavoriteHotels/${id}`)
			let data = await response.json()
			console.log(data)
			commit('setFavoriteHotel', data)
		},

		async fetchCustomerBookings({commit}, id){
			let response = await fetch(`/api/BookingsByCustomer/${id}`)
			let data = await response.json()
			console.log(data)
			commit('setCustomerBookings', data)
		},

		async fetchFilteredReviews({ commit }, id) {
			let response = await fetch(`/api/reviews/${id}`)
			let data = await response.json()
			console.log(data)
			commit('setFilteredReviews', data)
		},

		async fetchFilteredRooms({ commit }, id) {
			let response = await fetch(`/api/availableRoomsByHotelId/${id}/${this.state.dates.checkinDate}/${this.state.dates.checkoutDate}`)
			let data = await response.json()
			console.log(data)
			commit('setFilteredRooms', data)
		},

		async saveSelectedRooms({ commit }, selectedRooms) {
			commit('setSelectedRooms', selectedRooms)
			console.log('The following rooms have been saved to store:')
			console.log(this.state.selectedRooms[0])
		},

		async submit ({ commit }) {
			var booking = {
			  CheckInDate: '2021-06-09T18:05:19.617Z',
			  CheckOutDate: '2021-06-10T18:05:19.617Z', 
			  NoOfAdults: 0,
			  NoOfChildren: 0,
			  IsPending: true,
			  IsCancelled: false,
			  TotalPrice: 100,
			  FlightId: 1,
			  CustomerId: 59
			}
	  
			let requestOptions = {
					  method: 'post',
					  headers: { 'Content-type': 'application/json' },
					  body: JSON.stringify(booking)
				  }
	  
				  const response = await fetch('/api/Bookings', requestOptions)
				  let result = await response.json()
			console.log(result)
			
			let input = this.$store.state.totalBookingPrice
			let finalTotal = 0
	  
			finalTotal = parseInt(input.price)
			
			this.lineItems[0].quantity = finalTotal
			// You will be redirected to Stripe's secure checkout page
			// this.$refs.checkoutRef.redirectToCheckout();
		  },
		
		async postBooking({commit}, data) {
			let body = {
				
			}
			
			let requestOptions = {
				method: 'post',
				headers: { 'Content-type': 'application/json' },
				body: JSON.stringify(body)
			}

			const response = await fetch('/api/Bookings', requestOptions)
			let result = await response.json()
			console.log('booking bla bla', result)
			commit('setReviews', result)
		},


		async postReview({ commit }, data) {
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
				headers: { 'Content-type': 'application/json' },
				body: JSON.stringify(body)
			}

			const response = await fetch('api/Reviews', requestOptions)
			let result = await response.json()
			console.log('resultat från backend', result)
			commit('setReviews', result)
		},

		//IDENTITY API
		async registerUser({ dispatch }, user) {

			let body = { userName: user.userName, password: user.password, email: user.email }

			const requestOptions = {
				method: "POST",
				headers: { 'Content-type': 'application/json' },
				body: JSON.stringify(body)
			};

			const response = await fetch('/api/Authentication/Register', requestOptions)
			const data = await response.json();

			dispatch('getLoggedInUser')
		},

		async loginUser({ dispatch }, loggedInUser) {

			let body = { userName: loggedInUser.email, password: loggedInUser.password }

			const requestOptions = {
				method: "POST",
				headers: { 'Content-type': 'application/json' },
				body: JSON.stringify(body)
			};

			const response = await fetch('/api/Authentication/Login', requestOptions)
			const data = await response.json();

			dispatch('getLoggedInUser')
		},

		

		async logoutUser({ commit }) {

			const requestOptions = {
				method: "POST",
				headers: { 'Content-type': 'application/json' },
			};

			let response = await fetch('/api/Authentication/Logout', requestOptions)
			const data = await response.json();

			// dispatch('getLoggedInUser')

			commit('SetLoggedInUser', {})
		},

		

		async getLoggedInUser({ commit }) {

			let response

			try {

				response = await fetch('/api/Customers/UserProfile')
			}
			catch (e) {
				commit('SetLoggedInUser', {})
			}

			const data = await response.json();
			//console.log(data)

			

			if (response.status == 200) {
				
				commit('SetLoggedInUser', data)
			}
			else {
				commit('SetLoggedInUser', {})
			}


		},

		async editCustomer({commit} , data){
			let body = { 
				id: data.id,
				firstName: data.firstName ,
				lastName: data.lastName ,
				address: data.address ,
				zipCode: data.zipCode,
				city: data.city,
				country:data.country,
				email: data.email,
				phone: data.phone}

			const requestOptions = {
				method: "PUT",
				headers: { 'Content-type': 'application/json' },
				body: JSON.stringify(body)
			};

			const id = data.id;
			console.log(id)

			const response = await fetch(`/api/Customers/${id}`, requestOptions)
			data = await response.json();

			commit('SetLoggedInUser')



		}



	},

})
