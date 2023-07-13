<template>
    <p>Đăng nhập thành công test</p>
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