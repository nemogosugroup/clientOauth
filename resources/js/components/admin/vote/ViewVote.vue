<script>
/**
 * Form-element component
 */
export default {
  data() {
    return {
      group_question: [],
      options:[],
      title_vote: "",
      selected_checkbox: [],
      selected_radio: {},
      data_json:'',
      textContent: '',
      optionstogetTotal:[],
    };
  },
  created() {
    let token = this.$store.getters.accessToken;
    axios.get(`/api/vote/get-info?id=${this.$route.params.id}`, {
      headers: {
        Authorization: 'Bearer ' + token
      }
    })
    .then((response) => {
      if (response.data.status === 200) {
        const voteInfo = response.data.data.voteInfo;
        const voteId = Object.keys(voteInfo)[0];
        const voteData = voteInfo[voteId];
        this.title_vote = voteData.title;
        for (const questionKey in voteData.questions) {
          const question = voteData.questions[questionKey];
          const type = question.type;
          const questionName = Object.keys(question)[1];
          const options = question[questionName];
          const optionsArray = options.map((option) => {
            return { answer_id: option.option_id , answer_value: option.option, total_voted: option.total_voted };
          });
          this.optionstogetTotal = voteData.questions;
          const newQuestion = {
            question_id: questionKey,
            question: questionName,
            options: optionsArray,
            type: type
          };
          this.group_question.push(newQuestion);
          console.log(this.group_question);
        }
    
      }
    })
    .catch((error) => {
      console.log('Error:', error);
    });
  },
  methods:{
    // saveData(){
    //   let formVoteData = {
    //     id: this.$route.params.id,
        
    //   };
    //   console.log(formVoteData);
    // }  
    saveData() {
      let vote_info = {};
      for (const question of this.group_question) {
        if (question.type === 1) {
          vote_info[question.question_id] = this.selected_checkbox.filter((answer_id) => {
            return question.options.some((option) => option.answer_id === answer_id);
          });
        } else if (question.type === 2) {
          vote_info[question.question_id] = this.selected_radio[question.question_id] || '';
        } else if (question.type === 3) {
          // Loại hình câu hỏi dạng văn bản, không có phương án được chọn
          // Có thể xử lý dữ liệu văn bản ở đây nếu cần thiết
        }
      }

      let formVoteData = {
        id: this.$route.params.id,
        vote_info: JSON.stringify(vote_info),
      };
      let token = this.$store.getters.accessToken;
      
      axios.post('/api/vote/vote', formVoteData, {
        headers: {
          'Authorization': 'Bearer ' + token
        }
      })
      .then(function (response) {
        console.log("vote/add: ", response.data);
      })
      .catch(function (error) {
        console.log("vote/add error: ", error);
      });
      this.$swal.fire({
        position: "center",
        icon: "success",
        title: "Bạn thực hiện đánh giá thành công",
        showConfirmButton: false,
        timer: 1500
      });

      console.log(formVoteData);
    },
  },
  computed: {
    totalVotedSum() {
      return (question_id) => {
        let question = this.group_question.find((q) => q.question_id === question_id);
        if (question) {
          return question.options.reduce((sum, option) => sum + option.total_voted, 0);
        }
        return 0;
      };
    }
},
};
</script>

<template>
  <div class="container">
    <div class="card">
      <div class="card-body">
        <h3 class="text-capitalize mb-0">{{ title_vote }}</h3>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <form class="gosu-form-evaluation" role="form" @submit.prevent="saveData">
            <div class="row mt-2">
              <div class="col-md-12" :ref="`questionCard_${indexQuestion}`" v-for="(question, indexQuestion) in group_question" :key="indexQuestion">
                <div class="card">
                  <div class="card-body">
                    <h5 class="font-size-16 mb-4 text-capitalize">{{ question.question }}</h5>
                    <div class="row flex-wrap" v-if="question.type === 1">
                      <div class="col-md-3" v-for="(answer, indexAnswer) in question.options" :key="indexAnswer">
                        <div class="custom-control custom-checkbox mb-3">
                          <input type="checkbox" class="custom-control-input" :name="'checkbox_' + answer.answer_id" :id="answer.answer_id" :value="answer.answer_id" v-model="selected_checkbox" />
                          <label class="custom-control-label text-capitalize" :for="answer.answer_id">{{ answer.answer_value }}</label>
                        </div>
                      </div>
                    </div>
                    <div class="row flex-wrap" v-if="question.type === 2">
                      <div class="col-md-3" v-for="(answer, indexAnswer) in question.options" :key="indexAnswer">
                        <div class="custom-control custom-radio mb-3">
                          <input type="radio" class="custom-control-input" :name="'radio_' + answer.answer_id" :id="answer.answer_id" :value="answer.answer_id" v-model="selected_radio" />
                          <label class="custom-control-label text-capitalize" :for="answer.answer_id">{{ answer.answer_value }}</label>
                        </div>
                      </div>
                    </div>
                    <div class="row flex-wrap" v-if="question.type === 3">
                      <div class="col-md-12">
                        <div class="mb-3">
                          <textarea
                            v-model="textContent"
                            class="form-control"
                            rows="2"
                            placeholder="Nhập câu trả lời ..."
                            name="textarea"
                          ></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
</template>   