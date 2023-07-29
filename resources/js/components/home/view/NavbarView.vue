<template>
  <div class="navbar_home">
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm justify-content-between">
      <div class="d-flex">
        <!-- LOGO -->
        <div class="navbar-brand-box bg-white">
          <router-link to="/home" class="logo logo-dark d-block text-center">
            <span class="logo-sm">
              <img src="../../../../assets/images/logo.png" alt="" height="22" />
            </span>
            <span class="logo-lg">
              <img src="../../../../assets/images/logo.png" alt="" height="30" />
            </span>
          </router-link>
        </div>
      </div>
      <div class="d-flex pe-0 pe-lg-3">
        <router-link to="/admin/dashboard" class="btn btn-dark text-center mr-5 my-auto" v-if="isGotoAdmin">Trang Admin</router-link>
        <div class="dropdown d-inline-block user-dropdown" v-if=true>          
          <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            <img class="rounded-circle header-profile-user" src="/assets/images/users/avatar-2.jpg" alt="Header Avatar" />
            <span class="d-none d-xl-inline-block ml-1">{{ UserForm.name }}</span>
            <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
          </button>
          <div class="dropdown-menu dropdown-menu-right">
            <!-- <router-link :to="{ name: 'Home Profile User' }" class="dropdown-item"><i
                class="ri-user-line align-middle mr-1"></i> Profile</router-link> -->
            <div class="dropdown-divider"></div>
            <a class="dropdown-item text-danger" href="#" @click="logoutSubmit"><i
                class="ri-shut-down-line align-middle mr-1 text-danger"></i>
              Logout</a>
          </div>
        
        </div>
        <div class="d-flex align-items-center justify-content-around pe-2 pe-lg-4" v-else>
          <!-- <router-link :to="{ name: 'login' }"
            class="btn-all-add-edit d-flex align-items-center rounded py-2 px-3 me-3 text-white">Login
          </router-link> -->
          <!-- <router-link :to="{ name: 'register' }"
            class="btn-all-add-edit d-flex align-items-center rounded py-2 px-2 text-white">Register
          </router-link> -->
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
import { mapGetters, mapMutations, mapActions } from "vuex";
export default {
  data() {
    return {
      navigationDisabled: false,
    };
  },
  created() {
    const body = document.querySelector('body');
    if (body.getAttribute('data-sidebar') === 'dark') {
      body.setAttribute('data-sidebar', 'light');
    }
    
  },
  methods: {
    ...mapActions(["oLogout"]),
    // 
    logoutSubmit() {
      this.oLogout("");
      
    },
    reloadPage() {
      location.reload();
    },

  },
  computed: {
    
    UserForm() {
          let user = JSON.parse(this.$store.getters.infoUser);
          if(user){
            console.log("check user",JSON.parse(user.roles));
          }
          return {
              name: user ? user.name : ""
          }
      },
    checkNavigation() {
      // const loginResponse = JSON.parse(localStorage.getItem('loginResponse')) ?? {};
      // return this.$store.getters.getLoginResponse.authenticated || loginResponse.authenticated || false;
    },
    isGotoAdmin() {
      let user = JSON.parse(this.$store.getters.infoUser);
      let isAdmin = false;
      if(user){
        let arrayRoles= JSON.parse(user.roles);
        for (var i = 0; i < arrayRoles.length; i++) {
          console.log(arrayRoles[i]);
          if (arrayRoles[i] === "ROLE_ADMIN") {
            isAdmin = true;
          }
        }
      }
      return isAdmin;
    },
  },

  mounted() {
  },
};
</script>


