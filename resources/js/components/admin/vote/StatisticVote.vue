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
            group_question:[],
            isLoaded: false,
            modalShow: false,
            tableFields: [
                { key: 'question_id', label: 'Question ID' },
                { key: 'title', label: 'Question Title' },
                { key: 'options', label: 'Options' },
            ],
            currentVoteId: null,
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
                this.isLoaded = true;
            }
        })
        .catch((error) => {
            console.log("vote/get error: ", error);
        });
    },
    methods:{
         // ... (các phương thức khác)
        openModals(voteId) {
            // Đặt voteId vào biến currentVoteId
            this.currentVoteId = voteId;
            this.modalShow = true;
        },
        closeModal() {
            this.modalShow = false;
        },
        // getQuestionsByVoteId(questions) {
        // // Xử lý dữ liệu từ các questions trong vote
        // const questionsData = [];
        // for (const questionId in questions) {
        //     if (Object.hasOwnProperty.call(questions, questionId)) {
        //     const question = questions[questionId];
        //     const title = Object.keys(question)[0];
        //     const options = question[title];
        //     questionsData.push({
        //         question_id: questionId,
        //         title: title,
        //         options: options,
        //     });
        //     }
        // }
        // return questionsData;
        // },
    },
};
</script>

<template>
    <div class="container">
      <div class="row">
        <div class="col-md-12" v-for="(vote, voteId) in group_vote" :key="voteId">
          <div class="card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-lg-9">
                            <h3 class="card-title mb-0">{{ vote.title }}</h3>
                        </div>
                        <div class="col-lg-3 text-right">
                            <b-button @click="openModals(vote.vote_id)" variant="primary"><i class="ri-line-chart-fill"></i>&nbsp;Thống kê</b-button>
                            <b-modal :id="'modal-' + currentVoteId" size="xl" hide-footer hide-header v-model="modalShow">
                            <!-- ... -->
                                <b-table
                                    v-if="group_vote[currentVoteId].questions"
                                    striped
                                    hover
                                    :items="getQuestionsByVoteId(group_vote[currentVoteId].questions)"
                                    :fields="tableFields"
                                    bordered
                                    responsive
                                    sticky-header
                                >
                                <!-- ... -->
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