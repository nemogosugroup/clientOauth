const state = {
    accessToken: null,
    infoUser: null,
};

const getters = {
    accessToken: state => state.accessToken,
    infoUser: state => state.infoUser,
};

const actions = {
    saveAccessToken({ commit, getters }, accessToken) {
        commit('changeAccessToken', accessToken);
        localStorage.setItem('accessToken', accessToken);
    },
    saveInfoUser({ commit, getters }, infoUser) {
        console.log("store saveInfoUser",infoUser);
        commit('changeInfoUser', infoUser);
        localStorage.setItem('infoUser', infoUser);
    },
    oLogout({ commit, getters },_accessToken) {
        
        commit('changeAccessToken', null);
        localStorage.removeItem('accessToken');
        window.location.href = '/logout';
    },
};

const mutations = {
    changeAccessToken: (state, newAccessToken) => (state.accessToken = newAccessToken),
    changeInfoUser: (state, newInfoUser) => (state.infoUser = newInfoUser)
};

export default {
    state,
    getters,
    actions,
    mutations,
};
