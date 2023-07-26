<script>
/**
 * Form-element component
 */

export default {
    data() {
        return {
            data_json:'',
            textContent: '', 
            minHeight: 'auto',
            group_vote: [],
            isLoaded: false,
            status:false,
            searchTerm: '',
            toastCount: 0,
        };
    },
    created() {
        let token = this.$store.getters.accessToken;
        this.axios.get(`/api/vote/get-all`,{
          headers: {
            'Authorization': 'Bearer ' + token
          }
        })
        .then((response) => {
          if (response.data.status === 200) {
            this.group_vote = response.data.data.voteInfo;
          }
        })
        .catch((error) => {
          if (error.response.status == 403) {
            console.log('Error:', error);
          }
          if (error.response.status == 401) {
            console.log('Error:', error);
          }
        });
    },
    methods: {
      toggleStatus(vote) {
        let status = 'off';
        console.log('check vote',vote);
        if(vote.status == 0 ){
          status = 'on';
        }
        let formData =  {
          id: vote.vote_id,
          action: status
        };
        let token = this.$store.getters.accessToken;
        console.log("check formData",formData);
        let seft = this;
        this.axios.post(`/api/vote/set-status`, formData,{
          headers: {
            'Authorization': 'Bearer ' + token
          }
        })
        .then((response) => {
          console.log("check response",response);
          if (response.data.status === 200 && response.data.success == true) {
            
            vote.status = !vote.status; 
            seft.$swal.fire({
                position: "center",
                icon: "success",
                title: "Bạn đã cập nhật trạng thái thành công",
                showConfirmButton: false,
                timer: 1500
              });
            // this.group_vote = response.data.data.voteInfo;
          }else{
            seft.$swal.fire({
                position: "center",
                icon: "error",
                title: response.data.message,
                showConfirmButton: false,
                timer: 1500
              });
          }
        })
        .catch((error) => {
          if (error.response.status == 403) {
            console.log('Error:', error);
          }
          if (error.response.status == 401) {
            console.log('Error:', error);
          }
        });
      },

      searchVotes() {
      let token = this.$store.getters.accessToken;
      let searchTerm = this.searchTerm.trim(); 

      // Add the searchTerm as a query parameter to the API call
      this.axios
        .get(`/api/vote/search`, {
          params: {
            search: searchTerm,
          },
          headers: {
            'Authorization': 'Bearer ' + token
          },
        })
        .then((response) => {
          if (response.data.status === 200) {
            this.group_vote = response.data.data.voteInfo;
          }
        })
        .catch((error) => {
          if (error.response.status == 403) {
            console.log('Error:', error);
          }
          if (error.response.status == 401) {
            console.log('Error:', error);
          }
        });
      },

      copyLinkToClipboard(vote_id) {
        const currentURL = window.location.href; // Lấy địa chỉ URL hiện tại
        const urlObject = new URL(currentURL);
        const domain = urlObject.hostname;
        const dynamicLink = `${domain}/voting/${vote_id}`; // Thêm tham số động vào link

        const textarea = document.createElement("textarea");
        textarea.style.position = "fixed";
        textarea.style.top = 0;
        textarea.style.left = 0;
        textarea.style.opacity = 0;
        textarea.value = dynamicLink;

        document.body.appendChild(textarea);

        textarea.select();
        document.execCommand("copy");

        document.body.removeChild(textarea);

        this.showToast();
        // alert("Liên kết đã được sao chép!");
      },

      showToast() {
        this.$toast.success('Liên kết đã được sao chép', {
          autoClose: 1500,
        });
      },
    },
};
</script>

<template>
    <div class="container mb-5 all-vote">
      <div class="row justify-content-between mb-4 align-items-center">
        <div class="col-md-3">
          <router-link to="/admin/create-vote">
            <button class="btn btn-primary"><i class="fas fa-pen-square"></i>&nbsp;Tạo mới</button>
          </router-link>
        </div>
        <div class="col-md-4">
          <form class="app-search d-none d-lg-block" @submit.prevent="searchVotes">
            <div class="position-relative">
              <input type="text" class="form-control" v-model="searchTerm" @keyup.enter="searchVotes" placeholder="Tìm kiếm..." />
              <span class="ri-search-line"></span>
            </div>
          </form>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12" v-for="(vote, voteId) in group_vote" :key="voteId">
          <div class="card">
            <div class="card-body">
              <div class="row align-items-center">
                <div class="col-lg-6">
                  <h3 class="card-title mb-0">{{ vote.title }}</h3>
                </div>
                <div class="col-lg-6 text-right">
                  <router-link :to="{ path: `/admin/detail-vote/` + vote.vote_id, params: { id: vote.vote_id } }">
                    <button class="btn btn-dark mr-2"><i class="fas fa-file-alt"></i>&nbsp;Chi tiết</button>
                  </router-link>
                  <router-link :to="{ path: `/voting/` + vote.vote_id, params: { id: vote.vote_id } }">
                    <button class="btn btn-primary mr-2"><i class="fas fa-desktop"></i>&nbsp;Xem trước</button>
                  </router-link>
                  <button :class="['btn', { 'btn-success': vote.status, 'btn-danger': !vote.status }]" class="mr-2" @click="toggleStatus(vote)">
                    <i class="fas fa-power-off"></i>&nbsp;{{ vote.status ? 'Mở' : 'Đóng' }}
                  </button>
                  <button class="btn btn-info float-right"  @click="copyLinkToClipboard(vote.vote_id)"><i class="ri-file-copy-2-fill"></i>&nbsp;Sao chép liên kết</button>
                </div>
              </div> 
            </div>
          </div>
        </div>
      </div>
    </div>
</template>

<style>
.all-vote .app-search input{
  border: 1px solid #ced4da;
}
</style>