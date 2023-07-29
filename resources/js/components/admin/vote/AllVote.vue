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
          toastCount: 0,
          isLoadMore : true,
          is_public: false,
          banner_default: '/images/banner-default.jpg',
      };
    },
    created() {
        this.searchVotes(6);
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
              limit: limit
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

      copyLinkToClipboard(vote) {
        console.log('check vote',vote);
        const currentURL = window.location.href; // Lấy địa chỉ URL hiện tại
        const urlObject = new URL(currentURL);
        const domain = urlObject.hostname;
        let dynamicLink = `${domain}/voting/${vote.id}`;
        if(vote.short_link && vote.short_link!==""){
          dynamicLink = `${domain}/${vote.short_link}`;
        }
         // Thêm tham số động vào link

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
      createShortLink(vote_id){
        let formData =  {
          id: vote_id,
          auto_create:1,
          short_link: ""
        };
        let token = this.$store.getters.accessToken;
        // Add the searchTerm as a query parameter to the API call
        this.axios
          .post(`/api/vote/create-short-link`,formData, {
            headers: {
              'Authorization': 'Bearer ' + token
            },
          })
          .then((response) => {
            if (response.data.status === 200) {
              let icon = "error";
              if(response.data.success == true){
                icon = "success";
                console.log("response.data.data",response.data.data);
                console.log("this.group_vote",this.group_vote);
                const elementToUpdate = this.group_vote.find((element) => element.id === vote_id);
                if (elementToUpdate) {
                  // Cập nhật thông tin của phần tử tìm thấy
                  elementToUpdate['short_link'] = response.data.data.short_link;
                }
                console.log("check update this.group_vote",this.group_vote);
              }
              this.$swal.fire({
                  position: "center",
                  icon: icon,
                  title: response.data.message,
                  showConfirmButton: false,
                  timer: 1500
              });
              
              
              // if(response.data.success === true){
              //   this.group_vote[vote_id]['short_link'] = response.data.data.short_link;
              // }
            }
          })
          .catch((error) => {
            
            console.log('Error:', error);
          });
      },
      publishVote(vote) {
        let action = 'off';
        if(vote.is_public == 0 ){
          action = 'on';
        }
        let formDataPublic = {
            id: vote.id,
            action: action // Assuming 'on' represents the published state.
        };

        let token = this.$store.getters.accessToken;

        this.axios.post(`/api/vote/vote-public`, formDataPublic, {
            headers: {
                'Authorization': 'Bearer ' + token
            }
        })
        .then((response) => {
            if (response.data.status === 200 && response.data.success == true) {
                vote.is_public = !vote.is_public; // Update the status of the specific vote to 'published'
                this.$swal.fire({
                    position: "center",
                    icon: "success",
                    title: "Bạn đã xuất bản thành công",
                    showConfirmButton: false,
                    timer: 1500
                });
            } else {
                this.$swal.fire({
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
    },
};
</script>

<template>
  <div class="page-title-right d-flex">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="javascript:void(0);" class="mb-0">Quản lý</a>
        </li>
    </ol>
  </div>
  <div class="container mb-5 all-vote">
    <div class="row justify-content-between mb-4 align-items-center">
      <div class="col-md-3">
        <router-link to="/admin/create-vote">
          <button class="btn btn-primary"><i class="fas fa-pen-square"></i>&nbsp;Tạo mới</button>
        </router-link>
      </div>
      <div class="col-md-4">
        <form class="app-search d-none d-lg-block" @submit.prevent="searchVotes(6)">
          <div class="position-relative">
            <input type="text" class="form-control" v-model="searchTerm" placeholder="Tìm kiếm..." />
            <span class="ri-search-line"></span>
          </div>
        </form>
      </div>
    </div>
    <div class="row card-all-vote">
      <div class="col-md-6" v-for="(vote, voteId) in group_vote" :key="voteId">
        <div class="card">
          <img class="card-img-top img-fluid" v-if="vote.banner === null || vote.banner === ''" :src="banner_default" alt="Card image cap">
          <img class="card-img-top img-fluid" v-else :src="vote.banner" alt="Card image cap">
          <div class="card-body">
            <h3 class="card-title">{{ vote.title }}</h3>
            <div class="action-btn">
                <router-link :to="{ path: `/admin/detail-vote/` + vote.id, params: { id: vote.id } }">
                  <button class="btn btn-dark mr-2 mb-2"><i class="fas fa-file-alt"></i>&nbsp;Chi tiết</button>
                </router-link>
                <router-link v-if="!vote.is_public" :to="{ path: `/viewvote/` + vote.id, params: { id: vote.id } }">
                  <button class="btn btn-primary mr-2 mb-2"><i class="fas fa-desktop"></i>&nbsp;Xem trước</button>
                </router-link>
                <button v-if="!vote.is_public" class="btn btn-success mr-2 mb-2" @click="publishVote(vote)">
                  <i class="ri-earth-line"></i>&nbsp;Xuất bản
                </button>
                <button v-if="vote.is_public" :class="['btn', { 'btn-success': vote.status, 'btn-danger': !vote.status }]" class="mr-2 mb-2" @click="toggleStatus(vote)">
                  <i class="fas fa-power-off"></i>&nbsp;{{ vote.status ? 'Đang mở' : 'Đang đóng' }}
                </button>
                <button class="btn btn-info mb-2" v-if="vote.short_link" @click="copyLinkToClipboard(vote)"><i class="ri-file-copy-2-fill"></i>&nbsp;Sao chép liên kết</button>
                  <button class="btn btn-info mb-2" v-else @click="createShortLink(vote.id)"><i class="ri-file-copy-2-fill"></i>&nbsp;Tạo Liên kết ngắn</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row load-more mt-4">
      <div class="col text-center">
        <button class="btn btn-primary" @click="loadmore" v-if="isLoadMore && group_vote.length >= 5">Xem thêm</button>
      </div>
    </div>
  </div>
</template>

<style>
.all-vote .app-search input{
  border: 1px solid #ced4da;
}

.card-all-vote .card{
  overflow: hidden;
}

.card-all-vote .card .img{
  
}

.card-all-vote img.card-img-top{
  object-fit: cover;
  height: 230px;
}
</style>