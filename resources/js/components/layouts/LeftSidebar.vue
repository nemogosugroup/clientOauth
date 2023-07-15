<template>
    <!-- ========== Left Sidebar Start ========== -->
    <div class="vertical-menu">

        <div data-simplebar class="h-100">

            <!--- Sidemenu -->
            <div id="sidebar-menu">
                <!-- Left Menu Start -->
                <ul class="metismenu list-unstyled" id="side-menu">
                    <li class="menu-title">Menu</li>
                    
                    <li>
                        <router-link :to="{ name: 'Admin Dashboard' }" class="waves-effect" exact active-class="active">
                            <i class="ri-dashboard-line"></i>
                            <!-- <span class="badge badge-pill badge-success float-right">3</span> -->
                            <span>Dashboard</span>
                        </router-link>
                    </li>
                    <li class="menu-title">Pages</li>
                    <!-- <li :class="{ 'mm-active': $route.name === 'All Language' || $route.name === 'Add Language' }"
                        v-if="checkPermission(['Language Manager'])"> -->
                    <li :class="{ 'mm-active': $route.name === 'All Vote' || $route.name === 'Add Vote' }">
                        <a href="javascript: void(0);"
                            :class="{ 'mm-active': $route.name === 'All Vote' || $route.name === 'Add Vote' }"
                            class="has-arrow waves-effect">
                            <i class="ri-store-2-line"></i>
                            <span>Vote</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li>
                                <router-link :to="{ name: 'All Vote' }" exact tag="li" exact-active-class="active">Vote</router-link>
                            </li>
                            <!-- <li>
                                <router-link :to="{ name: 'Add Language' }" exact tag="li" exact-active-class="active">Add
                                    Languages</router-link>
                            </li> -->
                        </ul>
                    </li>
                    
                </ul>
            </div>
            <!-- Sidebar -->
        </div>
    </div>
    <!-- Left Sidebar End -->
</template>
<script>
// import { checkRolesAccess, checkPermissionAccess } from '@resources/js/middleware/access.js';
export default {
    data() {
        return {
            isExpanded: false
        }
    },
    created() {
    },
    methods: {
        checkPermission(permissions) {
            true;
            // return checkPermissionAccess(permissions);
        }
    },
    mounted() {
        // Đặt lại thuộc tính aria-expanded khi component được tải lại
        // const element = document.getElementsByClassName('has-arrow');
        // if (element) {
        //     element.setAttribute('aria-expanded', this.isExpanded);
        // }
        const element = document.querySelector('.has-arrow');
        if (element instanceof Element) {
            element.setAttribute('aria-expanded', 'true');
        }
    },
    computed: {
        userHasAdmin() {
            return checkRolesAccess(['admin'])
        },
    }
}
</script>
