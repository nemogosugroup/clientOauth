<template>
    <h1>Vote App</h1>

    <router-link :to="{ name: 'Add Vote', params: { value: 1 } }">
        <button>Thêm bình chọn</button>
    </router-link>

    <h2>Các bình chọn đã tạo:</h2>
    <ul id="vote-list"></ul>
</template>
  
<script>
import { mapGetters, mapMutations, mapActions } from "vuex";
export default {
    props: {},
    mounted() { 
        // this.accessToken = this.$store.getters.accessToken;
    },
    data() {
        return {
            accessToken: "", // Khởi tạo access token rỗng
        };
    },
    created() {

    },
    methods: {
        ...mapActions(["logout"]),
        
    },
    // code test keyboard
    watch: {
        
    },
    computed: {
        
    },
};
</script>