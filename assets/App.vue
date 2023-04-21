<template>
    <div>
        <Navbar/>
        <b-container fluid>
            <transition>
                <keep-alive>
                    <router-view></router-view>
                </keep-alive>
            </transition>
        </b-container>
    </div>
</template>

<script>
import Navbar from "./components/Navbar.vue";
export default {
    name: 'Layout',
    components: {
        Navbar
    }
}
</script>