import { createRouter, createWebHistory } from 'vue-router';


import HomePage from '../components/home/HomePage.vue';
import HomePageTest from '../components/home/HomePageTest.vue';

import AdminParent from '../components/admin/AdminParent.vue';
import Dashboard from '../components/admin/Dashboard.vue';

import VoteParent from '../components/admin/vote/VoteParent.vue';
import CreateVote from '../components/admin/vote/CreateVote.vue';
import ViewVote from '../components/admin/vote/ViewVote.vue';
import AllVote from '../components/admin/vote/AllVote.vue';

const ErrorPage = {
    template: '<div>403 - Access denied</div>'
};
export const routes = [
    { name: 'home', path: '/home', component: HomePage },
    { name: 'test', path: '/home/test', component: HomePageTest },
    {
        path: '/admin',
        name: 'Dashboard',
        component: AdminParent,
        meta: { requiresAuth: true },
        children: [
            { name: 'Admin Dashboard', path: 'dashboard', component: Dashboard },
            // {
            //     path: 'language',
            //     name: 'Language',
            //     component: LanguageParent,
            //     meta: { permissions: ['Language Manager'] },
            //     children: [
            //         {
            //             name: 'All Language',
            //             path: 'all',
            //             component: AllLanguages,
            //         },
            //         {
            //             name: 'Add Language',
            //             path: 'add',
            //             component: AddLanguage,
            //         },
            //         {
            //             name: 'Edit Language',
            //             path: 'edit/:id',
            //             component: EditLanguage,
            //         }
            //     ]
            // }

        ]
    },
    {
        path: '/admin',
        name: 'Vote',
        component: VoteParent,
        meta: { requiresAuth: true },
        children: [
            { name: 'Create Vote', path: 'create-vote', component: CreateVote },
            // { name: 'All Vote', path: 'all-vote', component: AllVote },
        ]
    },
    {
        path: '/voting',
        name: 'Voting',
        component: ViewVote,
    },
    

];
const router = createRouter({
    history: createWebHistory(),
    routes
})
import { store } from '../store/store';
import permissions from '../store/Modules/permissions';
router.beforeEach((to, from, next) => {
    // const requiresAuth = to.matched.some(record => record.meta.requiresAuth)
    // const isAuthenticated = store.getters.getLoginResponse.authenticated || JSON.parse(localStorage.getItem('loginResponse'))?.authenticated
    // const roles = to.meta.roles
    // const permissions = to.meta.permissions
    // let authUser = undefined
    // if (store.getters.getAuthUser.id !== undefined) {
    //     authUser = store.getters.getAuthUser;
    // }
    // authUser = JSON.parse(localStorage.getItem('authUser'))
    // if (requiresAuth) {
    //     // kiểm tra xem người dùng đã đăng nhập hay chưa
    //     if (!isAuthenticated) {
    //         next('/login');
    //         return
    //     }
    // }
    // if (roles && roles.length > 0) {
    //     const userRoles = authUser.roles
    //     const hasAccess = userRoles.some(role => roles.includes(role.name));
    //     if (!hasAccess) {
    //         next('/error');
    //         return;
    //     }
    // }
    // if (permissions && permissions.length > 0) {
    //     const userRoles = authUser.roles
    //     let hasAccess = false;

    //     for (const role of userRoles) {
    //         if (role.permissions.some(permission => permissions.includes(permission.name))) {
    //             hasAccess = true;
    //             break;
    //         }
    //     }
    //     if (!hasAccess) {
    //         next('/error');
    //         return;
    //     }
    // }
    next();

})
export default router