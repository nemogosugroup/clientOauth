<template>
    <div class="app_vue">
        <div v-if="isAdminRoute">
            <LayoutWrapper />
            <RightSidebar />
        </div>
        <div class="main-container" v-else>
            <div class="container-xl">      
                <HomeNavbarView />
            </div>
            <div class="container app-content">
                <router-view></router-view>
            </div>
            <FooterLayout />
        </div>
    </div>
</template>
<script>
// import loginLayout from './components/account/LoginLayout.vue';
// import register from './components/account/Register.vue';
import LayoutWrapper from './components/layouts/LayoutWrapper.vue';
import RightSidebar from './components/layouts/RightSidebar.vue';

import HomeNavbarView from './components/home/view/NavbarView.vue';
import FooterLayout from './components/layouts/FooterLayout.vue';


export default {
    components: {
        // loginLayout,
        LayoutWrapper,
        RightSidebar,
        HomeNavbarView,
        FooterLayout,
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

<style>
.app_vue .main-container{
    overflow: hidden;
}

.app_vue .main-container .app-content{
    min-height: 606px;
    margin-bottom: 85px;
}

</style>