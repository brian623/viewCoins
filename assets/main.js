import Vue from "vue";
import VueRouter from "vue-router";
import router from "./router/index";
import { BootstrapVue } from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import App from './App.vue';
import { ValidationObserver, ValidationProvider, extend } from "vee-validate";
import * as rules from "vee-validate/dist/rules";
import store from "./store/index";
import axios from "axios";

//install rules vee validate
Object.keys(rules).forEach(rule=>{
    extend(rule, rules[rule]);
})


Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)
Vue.use(BootstrapVue)
Vue.use(VueRouter)

Vue.config.productionTip = false;
axios.defaults.baseURL = `http://localhost:8000/`

require('./store/token')
store.dispatch('auth/attemp',localStorage.getItem('token')).then(()=>{
    new Vue ({
        el: "#app",
        router,
        store,
        template: '<app/>',
        render: h=> h(App)
    })
})