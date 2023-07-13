import Router from '../../router';
import Swal from 'sweetalert2';
import Config from '../../config';

const state = {
    loginResponse: {},
    authUser: {},
};

const getters = {
    getLoginResponse: state => state.loginResponse,
    // getRegisterResponse: state => state.registerResponse,
    getAuthUser: state => state.authUser,
};

const actions = {
    login({ commit, getters }, loginData) {
        axios.get('/sanctum/csrf-cookie').then(() => {
            axios
                .post('/api/login', {
                    email: loginData.email,
                    password: loginData.password,
                })
                .then(response => {
                    commit('mutateLoginResponse', response.data);
                    localStorage.setItem(
                        'loginResponse',
                        JSON.stringify(response.data)
                    );
                    if (getters.getLoginResponse.response_type == 'success') {
                        axios.get('/api/user').then(response => {
                            if (response.data.status === 200) {
                                commit('mutateAuthUser', response.data.data.user);
                                localStorage.setItem(
                                    'authUser',
                                    JSON.stringify(response.data.data.user)
                                );
                                if (getters.getAuthUser.roles.some(role => role.name === "admin")) {
                                    // Chuyển hướng đến trang admin
                                    // Router.push('/admin').then(() => {
                                    //     location.reload();
                                    // });
                                    window.location.replace('/admin/dashboard');
                                } else {
                                    // Chuyển hướng đến trang chính
                                    Router.push('/');
                                }
                                // Router.push('/admin');
                            }
                        });
                    } else {
                        // alert(getters.getLoginResponse.response_data[0]);
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: `Error ${getters.getLoginResponse.response_data[0]}`,
                            showConfirmButton: false,
                            timer: Config.notificationTimer ?? 1000
                        })
                    }
                });
        });
    },
    firstLogin({ commit, getters }, loginData) {
        axios.get('/sanctum/csrf-cookie').then(() => {
            axios
                .post('/api/first-login', {
                    email: loginData.email,
                    password: loginData.password,
                    repassword: loginData.repassword,
                    is_first_login: loginData.is_first_login
                })
                .then(response => {
                    commit('mutateLoginResponse', response.data);
                    localStorage.setItem(
                        'loginResponse',
                        JSON.stringify(response.data)
                    );
                    if (getters.getLoginResponse.response_type == 'success') {
                        axios.get('/api/user').then(response => {
                            if (response.data.status === 200) {
                                commit('mutateAuthUser', response.data.data.user);
                                localStorage.setItem(
                                    'authUser',
                                    JSON.stringify(response.data.data.user)
                                );
                                if (getters.getAuthUser.roles.some(role => role.name === "admin")) {
                                    // Chuyển hướng đến trang admin
                                    // Router.push('/admin').then(() => {
                                    //     location.reload();
                                    // });
                                    window.location.replace('/admin/dashboard');
                                } else {
                                    // Chuyển hướng đến trang chính
                                    Router.push('/');
                                }
                                // Router.push('/admin');
                            }
                        });
                    } else {
                        // alert(getters.getLoginResponse.response_data[0]);
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: `Error ${getters.getLoginResponse.response_data[0]}`,
                            showConfirmButton: false,
                            timer: Config.notificationTimer ?? 1000
                        })
                    }
                });
        });
    },

    logout() {
        axios.get('/api/logout').then(() => {
            localStorage.removeItem('loginResponse');
            localStorage.removeItem('authUser');
            Router.push('/login');
        });
    },
    registeruser({ commit, getters }, registerData) {
        axios.get('/sanctum/csrf-cookie').then(() => {
            axios
                .post('/api/register', {
                    username: registerData.username,
                    email: registerData.email,
                    password: registerData.password,
                    repassword: registerData.repassword,
                })
                .then(response => {
                    commit('mutateLoginResponse', response.data);
                    localStorage.setItem(
                        'loginResponse',
                        JSON.stringify(response.data)
                    );
                    if (getters.getLoginResponse.response_type == 'success') {
                        axios.get('/api/user').then(response => {
                            if (response.data.status === 200) {
                                commit('mutateAuthUser', response.data.data.user);
                                localStorage.setItem(
                                    'authUser',
                                    JSON.stringify(response.data.data.user)
                                );
                                window.location.replace('/admin/dashboard');
                            }
                        });
                    }
                });
        });
    },

    storeUpdateUser({ commit, getters }) {
        axios.get('/sanctum/csrf-cookie').then(() => {
            axios.get('/api/user').then(response => {

                if (response.data.status === 200) {
                    commit('mutateAuthUser', response.data.data.user);
                    localStorage.setItem(
                        'authUser',
                        JSON.stringify(response.data.data.user)
                    );
                }
            });
        });
    }
};

const mutations = {
    mutateLoginResponse: (state, payload) => (state.loginResponse = payload),
    // mutateRegisterResponse: (state, payload) => (state.registerResponse = payload),
    mutateAuthUser: (state, payload) => (state.authUser = payload),
};

export default {
    state,
    getters,
    actions,
    mutations,
};
