<script>
export default {
    data() {
        return {
            total_vote:0,
        };
    },
    created() {
        let token = this.$store.getters.accessToken;
        this.axios.get(`/api/vote/count-vote`,{
          headers: {
            'Authorization': 'Bearer ' + token
          }
        })
        .then((response) => {
          if (response.data.status === 200) {
            this.total_vote = response.data.data.count_vote;
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
}
</script>
<template>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <!-- <router-link :to="{ name: 'All Vote' }" > -->
                        <div class="media">
                            <div class="media-body overflow-hidden">
                                <p class="text-truncate font-size-14 mb-2">Tổng số đợt bình chọn</p>
                                <h4 class="mb-0">{{ total_vote }}</h4>
                            </div>
                            <div class="text-primary">
                                <i class="ri-stack-line font-size-24"></i>
                            </div>
                        </div>
                    <!-- </router-link> -->
                </div>
            </div>
        </div>
    </div>
</template>
<style></style>
