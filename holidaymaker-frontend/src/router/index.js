import { createRouter, createWebHashHistory, createWebHistory } from "vue-router"
import Home from "../views/Home.vue"
import Login from "/src/views/Login.vue"
import Register from "/src/views/Register.vue"
import Review from "/src/components/Review.vue"
import BookingView from "/src/views/BookingView.vue"
import ProfileView from "/src/views/ProfileView.vue"
import MyProfile from "/src/views/MyProfile.vue"
import MyBookingsProfile from "/src/views/MyBookingsProfile.vue"
import MyFavoritesProfile from "/src/views/MyFavoritesProfile.vue"
import Help from "../views/static/Help.vue"
import About from "../views/static/About.vue"
import Contact from "../views/static/Contact.vue"
import SearchResults from "../views/SearchResults.vue"


const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/about",
    name: "About",
    component: About
  },
  {
    path: "/help",
    name: "Help",
    component: Help,
  },
  {
    path: "/contact",
    name: "Contact",
    component: Contact,
  },
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
  {
    path: "/review",
    name: "Review",
    component: Review

  },
  {
    path: "/booking",
    name: "Booking",
    component: BookingView
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
  {
    path: "/aboutHotel",
    name: "AboutHotel",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "aboutHotel" */ "../views/AboutHotel.vue"),
  },
  {
    path: "/searchresults",
    name: "SearchResults",
    component: SearchResults
  },
  
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
