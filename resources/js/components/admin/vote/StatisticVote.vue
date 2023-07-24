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
            modalShow: false,
            tableFields: [
                // { key: 'question_id', label: 'Question ID' },
                { key: 'title', label: 'Câu hỏi' , thStyle: { width: '50%' }},
                { key: 'options', label: 'Các câu trả lời' , thStyle: { width: '50%' }},
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
                // Đặt modalShow thành true cho tất cả các modal khi dữ liệu đã tải xong
                for (const voteId in this.group_vote) {
                    if (Object.hasOwnProperty.call(this.group_vote, voteId)) {
                        this.modalShow = false;
                        this.currentVoteId = voteId;
                    }
                }
            }
        })
        .catch((error) => {
            console.log("vote/get error: ", error);
        });
    },
    methods:{
        openModals(voteId) {
            this.modalShow = true;
            this.currentVoteId = voteId;
        },
        closeModal() {
            this.modalShow = false;
        },
        getQuestionsByVoteId(questions) {
            // Kiểm tra nếu questions là một đối tượng hợp lệ
            if (questions && typeof questions === 'object') {
            // Xử lý dữ liệu từ các questions trong vote
            const questionsData = [];
            for (const questionId in questions) {
                if (Object.hasOwnProperty.call(questions, questionId)) {
                    const question = questions[questionId];
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
                            <b-button @click="openModals(vote.vote_id)" variant="primary">
                                <i class="ri-line-chart-fill"></i>&nbsp;Thống kê
                            </b-button>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
      <b-modal v-if="currentVoteId" :scrollable="true" :id="'modal-' + currentVoteId" size="xl" hide-footer hide-header v-model="modalShow">
        <div class="row justify-content-end">
            <div class="col-lg-9"></div>
            <div class="col-lg-3 text-right">
                <b-button variant="link" @click="closeModal"><i class="fas fa-times"></i></b-button>
            </div>
        </div>
        <h3 class="text-center mb-2">Thông kê lượt vote:</h3>
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
        <template #cell(options)="row">
            <ol class="mb-0">
                <!-- {{ row.value }} -->
                <li class="mb-1" v-for="option in row.value" :key="option.option_id">
                    <!-- Sử dụng row.type để lọc các option dựa trên type -->
                    <template v-if="row.item.type === 3">
                        <span>
                            <ul>
                                <li v-for="answerItem in parseAnswer(option.answer)">
                                    {{ answerItem }}
                                </li>
                            </ul>
                        </span>
                    </template>
                    <template v-else-if="row.item.type !== 3">
                        {{ option.option }}<br>( Tổng số lượt đã vote: <strong style="font-family: Inter,sans-serif;">{{ option.total_voted }}</strong> )
                    </template>
                    <!-- Các type khác nếu có -->
                </li>
            </ol>
        </template>
        </b-table>
      </b-modal>

      
    </div>
</template>