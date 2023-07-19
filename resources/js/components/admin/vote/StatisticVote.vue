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
            modalShow: false,
            tableData: [
                { id: 1, name: 'John Doe', age: 25, email: 'john@example.com' },
                { id: 2, name: 'Jane Smith', age: 32, email: 'jane@example.com' },
                { id: 3, name: 'Tom Johnson', age: 42, email: 'tom@example.com' },
                { id: 4, name: 'Emily Davis', age: 28, email: 'emily@example.com' },
            ],
            tableFields: [
                { key: 'id', label: 'ID' },
                { key: 'name', label: 'Name' },
                { key: 'age', label: 'Age' },
                { key: 'email', label: 'Email' },
            ],
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
    methods:{
        openModals(){
            this.modalShow = true;
        },
        closeModal () {
            this.modalShow = false;
        },
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
                        <div class="col-lg-9">
                            <h3 class="card-title mb-0">{{ vote.title }}</h3>
                        </div>
                        <div class="col-lg-3 text-right">
                            <b-button @click="openModals" variant="primary"><i class="ri-line-chart-fill"></i>&nbsp;Thống kê</b-button>
                            <b-modal id="modal-xl" size="xl" hide-footer hide-header v-model="modalShow">
                                <div class="row justify-content-end">
                                    <div class="col-lg-9"></div>
                                    <div class="col-lg-3 text-right">
                                        <b-button variant="link" @click="closeModal"><i class="fas fa-times"></i></b-button>
                                    </div>
                                </div>
                                <b-table striped hover :items="tableData" :fields="tableFields" bordered responsive sticky-header>
                                    <template #cell(name)="row">
                                        <strong>{{ row.value }}</strong>
                                    </template>
                                    <template #cell(age)="row">
                                        {{ row.value }}
                                    </template>
                                    <template #cell(email)="row">
                                        <a :href="'mailto:' + row.value">{{ row.value }}</a>
                                    </template>
                                </b-table>
                            </b-modal>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
</template>