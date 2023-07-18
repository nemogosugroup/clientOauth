import { createRouter, createWebHistory } from 'vue-router';


import HomePage from '../components/home/HomePage.vue';

import AdminParent from '../components/admin/AdminParent.vue';
import Dashboard from '../components/admin/Dashboard.vue';
// import Vote from '../components/admin/vote/Vote.vue';
// import AddVote from '../components/admin/vote/AddVote.vue';

import VoteParent from '../components/admin/vote/VoteParent.vue';
import CreateVote from '../components/admin/vote/CreateVote.vue';
import ViewVote from '../components/admin/vote/ViewVote.vue';
// import AllVote from '../components/admin/vote/AllVote.vue';

const ErrorPage = {
    template: '<div>403 - Access denied</div>'
};
export const routes = [
    { name: 'home', path: '/home', component: HomePage },
    {
        path: '/error',
        name: 'error',
        component: ErrorPage
    },
    {
        path: '/admin',
        name: 'Dashboard',
        component: AdminParent,
        meta: { requiresAuth: true },
        children: [
            { name: 'Admin Dashboard', path: 'dashboard', component: Dashboard },
        ]
    },
    {
        path: '/admin',
        name: 'Vote',
        component: VoteParent,
        meta: { roles: ['ROLE_ADMIN'] },
        children: [
            { name: 'Create Vote', path: 'create-vote', component: CreateVote },
            // { name: 'All Vote', path: 'all-vote', component: AllVote },
        ]
    },
    {
        path: '/voting',
        name: 'Voting',
        component: ViewVote,
    }
    

];
const router = createRouter({
    history: createWebHistory(),
    routes
})
import { store } from '../store/store';
import oAuthLogin from '../store/modules/oAuthLogin';
router.beforeEach((to, from, next) => {
    if(!store.getters.infoUser ){
        $.ajax({
            url: '/getaccesstoken',
            type: 'GET',
            success: function(response) {
                let token = response.access_token;
                $.ajax({
                    url: '/api/user',
                    type: 'GET',
                    headers: {
                        'Authorization': 'Bearer ' + token
                    },
                    success: function(userResponse) {
                        // Xử lý dữ liệu người dùng
                        // userResponse.access_token = token;
                        const userResponseJSON = JSON.stringify(userResponse);
                        store.dispatch('saveAccessToken', token);
                        store.dispatch('saveInfoUser', userResponseJSON);
                        
                        handleInfoUser(JSON.parse(store.getters.infoUser));
                    },
                    error: function(error) {
                        console.log(error);
                    }
                });
            },
        });
    }else{
        handleInfoUser(JSON.parse(store.getters.infoUser));
    }
    
    function handleInfoUser(infoUser) {
        const roles = to.meta.roles;
        if (roles && roles.length > 0) {
          const userRoles = infoUser.roles ?? "[]";
          const userRolesArray = JSON.parse(userRoles);
          // Xử lý và kiểm tra roles
          const hasAccess = userRolesArray.some(role => roles.includes(role));
            if (!hasAccess) {
                next('/error');
                return;
            }
        }
    
        next();
      }
    next();

})
export default router