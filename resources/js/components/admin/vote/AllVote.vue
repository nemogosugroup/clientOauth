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
    mounted() {
        
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
        <button class="btn btn-primary mb-4"><i class="ri-chat-new-line"></i>&nbsp;Tạo mới</button>
      </router-link>
      <div class="row">
        <div class="col-lg-4" v-for="(vote, voteId) in group_vote" :key="voteId">
          <b-card no-body>
            <b-card-body>
              <b-card-title>
                <h4 class="card-title">{{ vote.title }}</h4>
              </b-card-title>
              <router-link :to="{ path: `/admin/edit-vote/` + vote.vote_id, params: { id: vote.vote_id } }">
                <button class="btn btn-dark mt-4"><i class="ri-file-list-3-line"></i>&nbsp;Chi tiết</button>
              </router-link>
              <router-link :to="{ path: `/voting/` + vote.vote_id, params: { id: vote.vote_id } }">
                <button class="btn btn-primary mt-4 float-right"><i class="ri-slideshow-2-fill"></i>&nbsp;Hiển thị</button>
              </router-link>
            </b-card-body>
          </b-card>
        </div>
      </div>
    </div>
</template>