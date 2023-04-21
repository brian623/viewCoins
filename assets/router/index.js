import Vue from "vue";
import VueRouter from "vue-router";
import Dashboard from "../Views/Dashboard.vue";
import Login from "../Views/Login.vue";
import Register from "../Views/Register.vue";
import Edit from "../Views/EditProfile.vue";
import store from "../store";

Vue.use(VueRouter)

const routes = [
    {
        path: '/dashboard',
        name: 'Dashboard',
        component: Dashboard,
        beforeEnter: (to, from, next) => {
            if (!store.getters['auth/isAuthenticated']) {
                return next({
                    name: 'Login'
                })
            }
            next()
        }
    },
    {
        path: '/edit',
        name: 'Edit',
        component: Edit,
        beforeEnter: (to, from, next) => {
            if (!store.getters['auth/isAuthenticated']) {
                return next({
                    name: 'Login'
                })
            }
            next()
        }
    },
    {
        path: '/login',
        name: 'Login',
        component: Login
    },
    {
        path: '/registro',
        name: 'Registro',
        component: Register
    },
    { 
        path: '/', 
        redirect: { name: 'Dashboard' } }
]

const router = new VueRouter({
    routes,
})

export default router