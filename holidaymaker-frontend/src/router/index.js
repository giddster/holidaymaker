import { createRouter, createWebHistory } from "vue-router"

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

//"DYNAMIC" VIEWS
import Login from "/src/views/Login.vue"
import Register from "/src/views/Register.vue"
import Review from "/src/components/Review.vue"
import ProfileView from "/src/views/ProfileView.vue"
import MyProfile from "/src/views/MyProfile.vue"
import MyBookingsProfile from "/src/views/MyBookingsProfile.vue"
import MyFavoritesProfile from "/src/views/MyFavoritesProfile.vue"
import SearchResults from "../views/SearchResults.vue"
import AboutHotel from "../views/AboutHotel.vue"

const routes = [
  //WILDCARD REDIRECT TO NOTFOUND COMPONENT //
  { path: '/:pathMatch(.*)*', 
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
    path: "/review",
    name: "Review",
    component: Review

  },
  {
    path: "/booking",
    name: "CreateBooking",
    component: CreateBooking
  },
  {
    path: "/profile",
    name: "Profile",
    component: ProfileView
  },
  {
    path: "/myprofile",
    name: "MyProfile",
    component: MyProfile
  },
  {
    path: "/mybookings",
    name: "MyBookingsProfile",
    component: MyBookingsProfile
  },
  {
    path: "/myfavorites",
    name: "MyFavoritesProfile",
    component: MyFavoritesProfile
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
