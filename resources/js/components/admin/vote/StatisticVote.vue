<script>
/**
 * Form-element component
 */

import { saveAs } from "file-saver";
export default {
    data() {
        return {
            data_json:'',
            textContent: '', 
            minHeight: 'auto',
            group_vote: [],
            group_question:[],
            modalShow: false,
            tableFields: [
                // { key: 'question_id', label: 'Question ID' },
                { key: 'title', label: 'Câu hỏi' , thStyle: { width: '50%' }},
                { key: 'options', label: 'Các câu trả lời' , thStyle: { width: '50%' }},
            ],
            currentVoteId: null,
            visibleRowCount:5,
            isLoadMore : true,
            voteModal: {'question': null},
            banner_default: '/images/banner-default.jpg',
        };
    },
    created() {
        this.getVotes(6);
    },
    methods:{
        
        loadmore() {
            // Tăng số lượng dòng hiển thị lên
            this.getVotes(this.visibleRowCount+6);
            // Copy dữ liệu từ allData vào displayedData với số lượng dòng cần hiển thị
        },
        openModals(voteId) {
            this.modalShow = true;
            this.currentVoteId = voteId;
            this.voteModal = {'question': null};
            this.getInfoVote(voteId);
        },
        closeModal() {
            this.modalShow = false;
        },
        getInfoVote(voteId){
            console.log("check voteId",voteId);
            const token = this.$store.getters.accessToken;
            axios
            .get(`/api/vote/get-info?id=${voteId}`, {
            headers: {
                Authorization: 'Bearer ' + token
            }
            })
            .then((response) => {
            if (response.data.status === 200 && response.data.success === true) {
                const voteInfo = response.data.data.voteInfo;
                console.log("response.data.data.voteInfo",response.data.data.voteInfo);
                const voteId2 = Object.keys(voteInfo)[0];
                this.voteModal = voteInfo[voteId2];
                console.log('this.voteModal',this.voteModal);
            }
            })
            .catch((error) => {
            console.log('Error:', error);
            });
        },
        getQuestionsByVoteId(questions) {
            // Kiểm tra nếu questions là một đối tượng hợp lệ
            if (questions && typeof questions === 'object') {
            // Xử lý dữ liệu từ các questions trong vote
            
            console.log("questions",questions);
            const questionsData = [];
            for (const questionId in questions) {
                if (Object.hasOwnProperty.call(questions, questionId)) {
                    const question = questions[questionId];
                    console.log("question",question);
                    questionsData.push({
                        question_id: question.question_id,
                        title: question.question,
                        options: question.options,
                        type: question.type,
                    });
                }
            }
            console.log(questionsData);
            return questionsData;
            } else {
            return [];
            }
        },
        getVotes(limit){
            this.visibleRowCount = limit;
            this.isLoadMore = true;
            let token = this.$store.getters.accessToken;
            this.axios.get(`/api/vote/search`,{
                params: {
                limit: this.visibleRowCount
                },
                headers: {
                    'Authorization': 'Bearer ' + token
                }
            })
            .then((response) => {
                if (response.data.status === 200) {
                    this.group_vote = response.data.data.voteInfo;
                    this.isLoaded = true;
                    // Đặt modalShow thành true cho tất cả các modal khi dữ liệu đã tải xong
                    // for (const voteId in this.group_vote) {
                    //     if (Object.hasOwnProperty.call(this.group_vote, voteId)) {
                    //         this.modalShow = false;
                    //         this.currentVoteId = voteId;
                    //     }
                    // }
                    if (response.data.data.countVoteInfo < this.visibleRowCount){
                        this.isLoadMore = false;
                    }
                }
            })
            .catch((error) => {
                console.log("vote/get error: ", error);
            });
        },

        searchVotes(limit) {
            let token = this.$store.getters.accessToken;
            let searchTerm = this.searchTerm.trim(); 

            // if (searchTerm === '') {
            //   this.searchVotes(6);
            //   return;
            // }

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
                if (response.data.status === 200) {
                this.group_vote = response.data.data.voteInfo;
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

        parseAnswer(answer) {
            try {
                // Unescape chuỗi JSON trước khi parse
                const unescapedValue = answer.replace(/\\'/g, "'");
                const parsedValue = JSON.parse(unescapedValue);
                return Array.isArray(parsedValue) ? parsedValue : [];
            } catch (error) {
                return [];
            }
        },
        isNonEmptyArray(arr) {
            return Array.isArray(arr) && arr.length > 0;
        },

        exportExcel(voteId){
            const formData = new FormData();
            formData.append("vote_id", voteId);
            const token = this.$store.getters.accessToken;
            axios.post("/api/vote/export-excel", formData, {
                headers: {
                    Authorization: 'Bearer ' + token
                },
                responseType: "blob",
            })
            .then((response) => {
                if (response.status === 200) {
                    // alert("File export successful");
                    const blob = new Blob([response.data], {
                    type: "application/vnd.ms-excel",
                    });
                    saveAs(blob, "filecallback.xlsx");
                }
            })
            .catch((error) => {
                console.log(error);      
            })
            .finally();
            }
    },
};
</script>

<template>
    <div class="page-title-right d-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
            <a href="javascript:void(0);" class="mb-0">Thống kê</a>
            </li>
        </ol>
    </div>
    <div class="container mb-5 statistic-vote">
        <div class="row justify-content-between mb-4 align-items-center">
            <div class="col-md-3">
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
        <div class="row">
            <div class="col-md-6" v-for="(vote, voteId) in group_vote" :key="voteId">
                <div class="card">
                    <img class="card-img-top img-fluid" v-if="vote.banner === null || vote.banner === ''" :src="banner_default" alt="Card image cap">
                    <img class="card-img-top img-fluid" v-else :src="vote.banner" alt="Card image cap">
                    <div class="card-body">
                        <h3 class="card-title">{{ vote.title }}</h3>
                        <b-button @click="openModals(vote.id)" variant="primary" class="btn-block mt-3">
                            <i class="ri-line-chart-fill"></i>&nbsp;Thống kê
                        </b-button>
                        <b-button @click="exportExcel(vote.id)" variant="primary" class="btn-block mt-3">
                            <i class="ri-line-chart-fill"></i>&nbsp;Xuất excel
                        </b-button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row load-more mt-4">
            <div class="col text-center">
                <button class="btn btn-primary" @click="loadmore" v-if="isLoadMore && group_vote.length >= 5">Xem thêm</button>
            </div>
        </div>
        <b-modal  :scrollable="true" :id="'modal-' + currentVoteId" size="xl" hide-footer hide-header v-model="modalShow">
            <div class="row justify-content-end">
                <div class="col-lg-9"></div>
                <div class="col-lg-3 text-right">
                    <b-button variant="link" @click="closeModal"><i class="fas fa-times"></i></b-button>
                </div>
            </div>
            <h3 class="text-center mb-2">{{ voteModal.title }}</h3>
            <b-table
                v-if="voteModal.questions"
                striped
                hover
                :items="getQuestionsByVoteId(voteModal.questions)"
                :fields="tableFields"
                bordered
                responsive
                sticky-header
            >
            <template #cell(options)="row">
                <ul class="mb-0">
                    <!-- {{ row.value }} -->
                    <li class="mb-1" v-for="option in row.value" :key="option.option_id">
                        <!-- Sử dụng row.type để lọc các option dựa trên type -->
                        <template v-if="row.item.type === 3">
                            <span>
                                <ol>
                                    <li v-for="answerItem in parseAnswer(option.answer)">
                                        {{ answerItem }}
                                    </li>
                                </ol>
                            </span>
                        </template>
                        <template v-else-if="row.item.type !== 3">
                            {{ option.option }}<br>( Tổng số lượt đã vote: <strong style="font-family: Inter,sans-serif;">{{ option.total_voted }}</strong> )
                        </template>
                        <!-- Các type khác nếu có -->
                    </li>
                </ul>
            </template>
            </b-table>
        </b-modal>
    </div>
</template>

<style>
.statistic-vote .app-search input{
  border: 1px solid #ced4da;
}

.statistic-vote .card img.card-img-top{
  object-fit: cover;
  height: 230px;
}
</style>