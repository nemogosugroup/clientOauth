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


import { mapGetters, mapMutations, mapActions } from "vuex";
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
        // ...mapActions(['saveAccessToken']),
        ...mapActions(['saveInfoUser',"saveAccessToken"]),
        getAccessToken() {
            if(!this.$store.getters.accessToken){
                let self = this;
                $.ajax({
                    url: '/getaccesstoken',
                    type: 'GET',
                    success: function(response) {
                    let token = response.access_token;
                    console.log("getaccesstoken: ",token);
                    self.saveAccessToken(token);
                    $.ajax({
                        url: '/api/user',
                        type: 'GET',
                        headers: {
                            'Authorization': 'Bearer ' + token
                        },
                        success: function(userResponse) {
                            // Xử lý dữ liệu người dùng
                            self.saveInfoUser(userResponse);
                            console.log(userResponse);
                            console.log("check save info user:",self.$store.getters.infoUser);
                        },
                        error: function(error) {
                            console.log(error);
                        }
                        });
                    },
                });
            }
            
        },
    },
    mounted() {
        this.getAccessToken();
    },
}
</script>