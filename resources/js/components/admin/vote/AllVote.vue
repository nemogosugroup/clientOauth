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
            this.logout();
            }
            if (error.response.status == 401) {
            this.logout();
            }
        });
    },
};
</script>

<template>
    <div class="container">
      <router-link to="/admin/create-vote">
        <button class="btn btn-primary mb-4"><i class="fas fa-pen-square"></i>&nbsp;Tạo mới</button>
      </router-link>
      <div class="row">
        <div class="col-md-12" v-for="(vote, voteId) in group_vote" :key="voteId">
          <div class="card">
            <div class="card-body">
              <div class="row align-items-center">
                <div class="col-lg-8">
                  <h3 class="card-title mb-0">{{ vote.title }}</h3>
                </div>
                <div class="col-lg-4 text-right">
                  <router-link :to="{ path: `/admin/edit-vote/` + vote.vote_id, params: { id: vote.vote_id } }">
                    <button class="btn btn-dark mr-2"><i class="fas fa-file-alt"></i>&nbsp;Chi tiết</button>
                  </router-link>
                  <router-link :to="{ path: `/voting/` + vote.vote_id, params: { id: vote.vote_id } }">
                    <button class="btn btn-primary mr-2"><i class="fas fa-desktop"></i>&nbsp;Hiển thị</button>
                  </router-link>
                  <router-link :to="{ path: `/voting/` + vote.vote_id, params: { id: vote.vote_id } }">
                    <button class="btn btn-success"><i class="fas fa-power-off"></i>&nbsp;Đóng/mở</button>
                  </router-link>
                </div>
              </div> 
            </div>
          </div>
        </div>
      </div>
    </div>
</template>