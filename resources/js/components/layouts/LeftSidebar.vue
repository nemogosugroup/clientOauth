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
                    <li>
                        <router-link :to="{ name: 'All User' }" class=" waves-effect" exact tag="li" active-class="active"
                            v-if="checkPermission(['User Manager'])">
                            <i class="ri-calendar-2-line"></i>
                            <span>User manager</span>
                        </router-link>
                    </li>
                    <li :class="{ 'mm-active': $route.name === 'All Roles' || $route.name === 'Add Role' }"
                        v-if="checkPermission(['Role Manager'])">
                        <a href="javascript: void(0);"
                            :class="{ 'mm-active': $route.name === 'All Roles' || $route.name === 'Add Role' }"
                            class="has-arrow waves-effect">
                            <i class="ri-store-2-line"></i>
                            <span>Role Manager</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li>
                                <router-link :to="{ name: 'All Roles' }" exact tag="li" exact-active-class="active">All
                                    Roles</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'Add Role' }" exact tag="li" exact-active-class="active">Add
                                    Role</router-link>
                            </li>
                        </ul>
                    </li>
                    <li :class="{ 'mm-active': $route.name === 'All Permissions' || $route.name === 'Add Permission' }"
                        v-if="checkPermission(['Role Manager'])">
                        <a href="javascript: void(0);"
                            :class="{ 'mm-active': $route.name === 'All Permissions' || $route.name === 'Add Permission' }"
                            class="has-arrow waves-effect">
                            <i class="ri-store-2-line"></i>
                            <span>Permission Manager</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li>
                                <router-link :to="{ name: 'All Permissions' }" exact tag="li"
                                    exact-active-class="active">All
                                    Permissions</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'Add Permission' }" exact tag="li" exact-active-class="active">Add
                                    Permission</router-link>
                            </li>
                        </ul>
                    </li>
                    <li :class="{ 'mm-active': $route.name === 'All Language' || $route.name === 'Add Language' }"
                        v-if="checkPermission(['Language Manager'])">
                        <a href="javascript: void(0);"
                            :class="{ 'mm-active': $route.name === 'All Language' || $route.name === 'Add Language' }"
                            class="has-arrow waves-effect">
                            <i class="ri-store-2-line"></i>
                            <span>Language</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li>
                                <router-link :to="{ name: 'All Language' }" exact tag="li" exact-active-class="active">All
                                    Languages</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'Add Language' }" exact tag="li" exact-active-class="active">Add
                                    Languages</router-link>
                            </li>
                        </ul>
                    </li>
                    <li :class="{ 'mm-active': $route.name === 'All Word' || $route.name === 'Add Word' || $route.name === 'Log Word Update' || $route.name === 'Log Translation Update' }"
                        v-if="checkPermission(['Word Manager'])">
                        <a href="javascript: void(0);" class="has-arrow waves-effect"
                            :class="{ 'mm-active': $route.name === 'All Word' || $route.name === 'Add Word' || $route.name === 'Log Word Update' || $route.name === 'Log Translation Update' }">
                            <i class="ri-mail-send-line"></i>
                            <span>Word</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <!-- <li>
                                <router-link :to="{ name: 'All Word' }" exact tag="a" exact-active-class="active">All Wordss</router-link>
                            </li> -->
                            <li>
                                <router-link :to="{ name: 'Search Word' }" exact tag="a" exact-active-class="active">Search
                                    Words</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'Add Word' }" exact tag="a" exact-active-class="active">Add
                                    Words</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'Log Word Update' }" exact tag="a" exact-active-class="active">Log
                                    Word Update</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'Log Translation Update' }" exact tag="a"
                                    exact-active-class="active">Log Translation Update</router-link>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-title">Pages</li>
                    <li>
                        <router-link :to="{ name: 'Import Word From Excel' }" class=" waves-effect"
                            v-if="checkPermission(['Import Excel'])" exact tag="li" active-class="active">
                            <i class="ri-calendar-2-line"></i>
                            <span>Import file excel</span>
                        </router-link>
                    </li>
                    <li>
                        <router-link :to="{ name: 'Translate Word From Excel' }" class=" waves-effect" exact tag="li"
                            active-class="active" v-if="checkPermission(['Translate File Excel'])">
                            <i class="ri-calendar-2-line"></i>
                            <span>Translate file excel</span>
                        </router-link>
                    </li>
                    <li>
                        <router-link :to="{ name: 'Log Import' }" class=" waves-effect" exact tag="li" active-class="active"
                            v-if="checkPermission(['Log Import'])">
                            <i class="ri-calendar-2-line"></i>
                            <span>Log Import file excel</span>
                        </router-link>
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
