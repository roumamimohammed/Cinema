import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/signin',
    name: 'signin',
    component: () => import(/* webpackChunkName: "about" */ '../views/SigninView.vue')
  }
  ,
  {
    path: '/signuo',
    name: 'signuo',
    component: () => import(/* webpackChunkName: "about" */ '../views/SignuoView.vue')
  },
  {
    path: '/film',
    name: 'film',
    component: () => import(/* webpackChunkName: "about" */ '../views/FilmView.vue')
  },
   {
    path: '/reserv',
    name: 'reserv',
    component: () => import(/* webpackChunkName: "about" */ '../views/ReservationView.vue')
  },
  {
    path: '/show',
    name: 'show',
    component: () => import(/* webpackChunkName: "about" */ '../views/ShowView.vue')
    ,props:(route) =>({id:route.query.id_film})
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.beforeEach((to,from,next)=>{
    if (['film','reserv','show'].includes(to.name)) {
      if (localStorage.getItem('user_id')) {
        next()
        
      } else {

        window.location.href = 'http://localhost:8080/signin'
      }
        
    }else{
      next()
    }
})

export default router
