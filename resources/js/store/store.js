import { createStore } from 'vuex';
import   myModule   from './modules/oAuthLogin';
// import Roles from './Modules/roles';
// import Permissions from './Modules/permissions';
// import Login from './Modules/login';

// Vue.use(Vuex);

export const store = createStore({
    modules: {
        // Roles,
        // Permissions,
        // Login,
        myModule
    },
});