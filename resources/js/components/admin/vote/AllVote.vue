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
            visibleRowCount:5,
            isLoadMore : true,
        };
    },
    created() {
        this.searchVotes(5);
    },
    methods: {
      loadmore() {
        // Tăng số lượng dòng hiển thị lên
        this.searchVotes(this.visibleRowCount+5);
        // Copy dữ liệu từ allData vào displayedData với số lượng dòng cần hiển thị
      },
      toggleStatus(vote) {
        let status = 'off';
        console.log('check vote',vote);
        if(vote.status == 0 ){
          status = 'on';
        }
        let formData =  {
          id: vote.id,
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

      searchVotes(limit) {
        this.visibleRowCount = limit;
        this.isLoadMore = true;
        let token = this.$store.getters.accessToken;
        let searchTerm = this.searchTerm.trim(); 

        // Add the searchTerm as a query parameter to the API call
        this.axios
          .get(`/api/vote/search`, {
            params: {
              search: searchTerm,
              limit: this.visibleRowCount
            },
            headers: {
              'Authorization': 'Bearer ' + token
            },
          })
          .then((response) => {
            if (response.data.status === 200 && response.data.success === true) {
              console.log("check response.data.data.voteInfo",response.data.data.voteInfo);
              console.log("check this.group_vote",this.group_vote);
              this.group_vote = response.data.data.voteInfo;
              const totalRowVoteInfo = response.data.data.voteInfo.length;
              if (response.data.data.countVoteInfo < this.visibleRowCount){
                this.isLoadMore = false;
              }
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
          <form class="app-search d-none d-lg-block" @submit.prevent="searchVotes(5)">
            <div class="position-relative">
              <input type="text" class="form-control" v-model="searchTerm" placeholder="Tìm kiếm..." />
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
                <div class="col-lg-8">
                  <h3 class="card-title mb-0">{{ vote.title }}</h3>
                </div>
                <div class="col-lg-4 text-right">
                  <router-link :to="{ path: `/admin/detail-vote/` + vote.id, params: { id: vote.id } }">
                    <button class="btn btn-dark mr-2"><i class="fas fa-file-alt"></i>&nbsp;Chi tiết</button>
                  </router-link>
                  <router-link :to="{ path: `/voting/` + vote.id, params: { id: vote.id } }">
                    <button class="btn btn-primary mr-2"><i class="fas fa-desktop"></i>&nbsp;Hiển thị</button>
                  </router-link>
                  <button :class="['btn', { 'btn-success': vote.status, 'btn-danger': !vote.status }]" @click="toggleStatus(vote)">
                    <i class="fas fa-power-off"></i>&nbsp;{{ vote.status ? 'Mở' : 'Đóng' }}
                  </button>
                </div>
              </div> 
            </div>
          </div>
        </div>
        <button @click="loadmore" v-if="isLoadMore">Xem thêm</button>
      </div>
    </div>
    
</template>

<style>
.all-vote .app-search input{
  border: 1px solid #ced4da;
}
</style>