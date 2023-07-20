<script>
  export default {
    data() {
      return {
        group_question: [],
        type_options: [
          { id: 1, option: 'Hộp kiểm' },
          { id: 2, option: 'Trắc nghiệm' },
          { id: 3, option: 'Đoạn ngắn' },
        ],
        options:[],
        title_vote: "",
        validationErrors: {
          title: '',
          questions: []
        },
      };
    },
    methods: {
      addAnswer(question) {
        question.options.push({ answer_value: '' });
      },
      removeAnswer(question, index) {
        question.options.splice(index, 1);
      },
      addQuestion() {
        const newQuestion = { question: '', options: [{ answer_value: '' }], type: 1 };
        this.group_question.push(newQuestion);
      },
      removeQuestion(index) {
        this.group_question.splice(index, 1);
      },
      clearData() {
        this.group_question = [];
      },
      // saveData() {
      //   let token = this.$store.getters.accessToken;
      //   if (this.validateForm()) {
      //     let dataQuestion = JSON.stringify(this.group_question);
      //     let formCreateVote = {
      //       vote_id: this.$route.params.id,
      //       type_view: 1,
      //       questions: dataQuestion,
      //     };
      //     console.log(formCreateVote);
      //     // Gửi dữ liệu formCreateVote đi
      //     axios.post(`/api/vote/update`, formCreateVote, {
      //     headers: {
      //       'Authorization': 'Bearer ' + token
      //     }
      //     })
      //     .then(function (response) {
      //       console.log("vote/add: ", response.data);
      //     })
      //     .catch(function (error) {
      //       console.log("vote/add error: ", error);
      //     });
      //     this.$swal.fire({
      //       position: "center",
      //       icon: "success",
      //       title: "Bạn đã tạo biểu mẫu thành công",
      //       showConfirmButton: false,
      //       timer: 1500
      //     });
      //   }
      // },
    },
    created() {
      let token = this.$store.getters.accessToken;
      axios
        .get(`/api/vote/get-info?id=${this.$route.params.id}`, {
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
            
            console.log("check voteData:",voteData);
            for (const questionKey in voteData.questions) {
              const question = voteData.questions[questionKey];
              console.log("check question2:",question);
              const type = question.type;
              const questionName = question['question'];
              const options = question['options'];
              
              console.log("check options:",options);
              const optionsArray = options.map((option) => {
                return { answer_value: option.option };
              });
              const newQuestion = {
                question: questionName,
                options: optionsArray,
                type: type
              };
              console.log("group");
              this.group_question.push(newQuestion);
              
            }
            console.log("check group_question",this.group_question);
          }
        })
        .catch((error) => {
          console.log('Error:', error);
        });

        console.log(this.group_question);
    }
  };
</script>

<template>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <form class="form-horizontal" role="form" @submit.prevent="saveData">
            <div class="card title">
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <label class="card-title font-size-16 font-weight-bold">Tiêu đề</label>
                    <b-form-group>
                      <b-form-input v-model="title_vote" disabled placeholder=""></b-form-input>
                    </b-form-group>
                  </div>
                </div>
              </div>
            </div>
            <div ref="questionContainer">
              <div class="card question" v-for="(question, indexQuestion) in group_question" :key="indexQuestion">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-9">
                      <label class="card-title font-size-16 font-weight-bold">Câu hỏi</label>
                      <b-form-group>
                        <b-form-input v-model="question.question" disabled placeholder=""></b-form-input>
                      </b-form-group>
                    </div>
                    <div class="col-lg-3">
                      <label>Loại:</label>
                      <select class="form-control select2" v-model="question.type" disabled>
                        <option v-for="value in type_options" :key="value.id" :value="value.id">{{ value.option }}</option>
                      </select>
                    </div>
                  </div>
                  <label class="card-title" v-if="question.type !== 3">Câu trả lời</label>
                  <div class="row" v-if="question.type !== 3" v-for="(answer, indexAnswer) in question.options" :key="indexAnswer">
                    <div class="col-lg-9">
                      <b-form-group>
                        <b-form-input v-model="answer.answer_value" disabled placeholder=""></b-form-input>
                      </b-form-group>
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
  