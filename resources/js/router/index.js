import { createRouter, createWebHistory } from 'vue-router';


import HomePage from '../components/home/HomePage.vue';

import AdminParent from '../components/admin/AdminParent.vue';
import Dashboard from '../components/admin/Dashboard.vue';
// import Vote from '../components/admin/vote/Vote.vue';
// import AddVote from '../components/admin/vote/AddVote.vue';

import VoteParent from '../components/admin/vote/VoteParent.vue';
import CreateVote from '../components/admin/vote/CreateVote.vue';
import ViewVote from '../components/admin/vote/ViewVote.vue';
import EditVote from '../components/admin/vote/EditVote.vue';

import AllVote from '../components/admin/vote/AllVote.vue';

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
            { name: 'All Vote', path: 'all-vote', component: AllVote ,},
            { name: 'Create Vote', path: 'create-vote', component: CreateVote ,},
            { name: 'Edit Vote', path: 'edit-vote/:id', component: EditVote,},
            // { name: 'All Vote', path: 'all-vote', component: AllVote },
        ]
    },
    { name: 'Voting', path: '/voting/:id', component: ViewVote,},

    

];
const router = createRouter({
    history: createWebHistory(),
    routes
})
import { store } from '../store/store';
import oAuthLogin from '../store/modules/oAuthLogin';
router.beforeEach(async (to, from, next) => {
    if (!store.getters.infoUser) {
      console.log("check getaccesstoken");
      try {
        const response = await $.ajax({
          url: '/getaccesstoken',
          type: 'GET'
        });
        const token = response.access_token;
        const userResponse = await $.ajax({
          url: '/api/user',
          type: 'GET',
          headers: {
            'Authorization': 'Bearer ' + token
          }
        });
  
        const userResponseJSON = JSON.stringify(userResponse);
        store.dispatch('saveAccessToken', token);
        store.dispatch('saveInfoUser', userResponseJSON);
        
        handleInfoUser(JSON.parse(store.getters.infoUser));
      } catch (error) {
        console.log(error);
      }
    } else {
      handleInfoUser(JSON.parse(store.getters.infoUser));
    }
  
    function handleInfoUser(infoUser) {
      const roles = to.meta.roles;
      if (roles && roles.length > 0) {
        const userRoles = infoUser.roles ?? "[]";
        const userRolesArray = JSON.parse(userRoles);
        const hasAccess = userRolesArray.some(role => roles.includes(role));
        if (!hasAccess) {
          next('/error');
          return;
        }
      }
  
      next();
    }
  });
export default router