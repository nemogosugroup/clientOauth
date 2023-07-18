<template>
    <div class="app_vue">
        <div v-if="isAdminRoute">
            <LayoutWrapper />
            <RightSidebar />
        </div>
        <div class="" v-else>
            <div class="container-xl">
                
                <HomeNavbarView />
            </div>
            <div class="container">
                <br />
                <router-view></router-view>
            </div>
        </div>
    </div>
</template>
<script>
// import loginLayout from './components/account/LoginLayout.vue';
// import register from './components/account/Register.vue';
import LayoutWrapper from './components/layouts/LayoutWrapper.vue';
import RightSidebar from './components/layouts/RightSidebar.vue';

import HomeNavbarView from './components/home/view/NavbarView.vue';


export default {
    components: {
        // loginLayout,
        LayoutWrapper,
        RightSidebar,
        HomeNavbarView,
        // register,
    },
    computed: {
        accessToken() {
            return this.$store.getters.accessToken;
        },
        isAdminRoute() {
            return this.$route.path.startsWith("/admin/") || this.$route.path.startsWith("/admin");
        },
    },
    methods: {
    },
     mounted() {
        
    },
}
</script>