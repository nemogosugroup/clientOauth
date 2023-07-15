<template>
    <p>{{ this.$store.getters.accessToken }}</p>
    <form @submit.prevent="addVote">
        <input type="text" placeholder="Enter description" class="form-control"
                        v-model="FormData.name"  required >
        <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-all-add-edit">
                Add Word
            </button>
        </div>
    </form>
</template>
  
<script>
import { mapGetters, mapMutations, mapActions } from "vuex";
export default {
    props: {},
    mounted() {
        // this.accessToken = this.$store.getters.accessToken;
        if (this.$route.params.value) {
            this.value = this.$route.params.value;
        }
    },
    data() {
        return {
            value: null, // Khởi tạo giá trị ban đầu
            FormData: {},
        };
    },
    created() {

    },
    methods: {
        ...mapActions(["logout"]),
        addVote() {
            this.FormData;
            let arrayVote = {
                'name': this.FormData.name,
                'vote_options' : JSON.stringify(["abc","def","ghi"]),
                'type' : 1, // 1: chọn duy nhất, 2 là chon đồng thời
                'type_view': this.value
            };
            let token = this.$store.getters.accessToken;
            $.ajax({
                url: '/api/vote/add',
                type: 'post',
                headers: {
                    'Authorization': 'Bearer ' + token
                },
                data:arrayVote, // Chuyển đổi arrayVote thành chuỗi JSON
                success: function(response) {
                    console.log("vote/add: ",response);
                }
            });
        }
    },
    // code test keyboard
    watch: {

    },
    computed: {

    },
};
</script>