import { createRouter, createWebHistory } from "vue-router"
import store from '../store/index.js';


// STATIC VIEWS //
import Home from "../views/static/Home.vue"
import Help from "../views/static/Help.vue"
import About from "../views/static/About.vue"
import Contact from "../views/static/Contact.vue"
import NotFound from "../views/static/NotFound.vue"
import AllDestinations from "/src/views/static/AllDestinations.vue"
import AllHotels from "/src/views/static/AllHotels.vue"

// BOOKING //
import CreateBooking from "../views/booking/CreateBooking.vue"
import PaymentFail from "../views/booking/PaymentFail.vue"
import PaymentSuccess from "../views/booking/PaymentSuccess.vue"

//USER-RELATED //
import MyProfile from "@/views/user/MyProfile.vue"
import Login from "@/views/user/Login.vue"
import Register from "@/views/user/Register.vue"

//SEARCH //
import SearchResults from "../views/search/SearchResults.vue"
import AboutHotel from "../views/search/AboutHotel.vue"

const routes = [

  //WILDCARD REDIRECT TO NOTFOUND COMPONENT //
  {
    path: '/:pathMatch(.*)*',
    name: 'not-found',
    component: NotFound
  },

  //"DYNAMIC" VIEWS
  {
    path: "/",
    name: "Home",
    component: Home
  },

  {
    path: "/hotel/:id",
    name: "AboutHotel",
    component: AboutHotel
  },
  {
    path: "/searchresults",
    name: "SearchResults",
    component: SearchResults
  },

  {
    path: "/booking",
    name: "CreateBooking",
    component: CreateBooking,
    // beforeEnter: (to, from, next) => {
    //   // let result1 = store.actions.dispatch('getLoggedInUser')
    //   //let result1 = store.state.customers

    //   let result2 = store.state.customers.email

    //   // let result1 = 's';

    //   // if (!result1.IsRevoked) {
    //   //   console.log(result1)
    //   //   next({ name: "Login" })

    //   // } else if (!!result2) {
    //     console.log(!!result2)

    //   //   next()

    //   // }

    //   if(!!result2){
    //     console.log('if')
    //     next()
    //   }else{
    //     console.log('else')
    //     next({name: "Login"})
    //   }
    // }
  },
  {
    path: "/profile",
    name: "MyProfile",
    component: MyProfile,
    // beforeEnter: (to, from, next) => {

      
    //   let res = store.dispatch('getLoggedInUser')
    //   console.log(res)
      
    //   let re = store.getters["IsLoggedIn"]
    //   console.log(re)

    //   let result = store.state.customers.email

    //   console.log(!!result)

    //   if (!!result) {
    //     next()
    //   } else {
    //     next({ name: "Login" })
    //   }
    // }
  },

  //STATIC VIEWS
  {
    path: "/destinations",
    name: "AllDestinations",
    component: AllDestinations
  },
  {
    path: "/hotels",
    name: "AllHotels",
    component: AllHotels
  },
  {
    path: "/about",
    name: "About",
    component: About
  },
  {
    path: "/help",
    name: "Help",
    component: Help
  },
  {
    path: "/contact",
    name: "Contact",
    component: Contact
  },

  //AUTHENTICATION
  {
    path: "/login",
    name: "Login",
    component: Login
  },
  {
    path: "/register",
    name: "Register",
    component: Register
  },

  //PAYMENT STATUS VIEWS
  {
    path: "/paymentfailed",
    name: "PaymentFail",
    component: PaymentFail
  },
  {
    path: "/paymentsucceeded",
    name: "PaymentSuccess",
    component: PaymentSuccess
  }

];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
