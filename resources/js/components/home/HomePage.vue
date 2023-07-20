<template>
    <h3 class="text-center mt-5">Thời gian thực hiện đánh giá đã kết thúc.</h3>
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

<style>

</style>