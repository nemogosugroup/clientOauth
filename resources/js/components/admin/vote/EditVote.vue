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
      saveData() {
        if (this.validateForm()) {
          let dataQuestion = JSON.stringify(this.group_question);
          let formCreateVote = {
            title: this.title_vote,
            type_view: 1,
            questions: dataQuestion,
          };
          console.log(formCreateVote);
          // Gửi dữ liệu formCreateVote đi
        }
      },
      validateForm() {
        let isValid = true;
  
        // Validate title
        if (this.title_vote.trim() === '') {
          this.validationErrors.title = 'Vui lòng nhập tiêu đề.';
          isValid = false;
        } else {
          this.validationErrors.title = '';
        }
  
        // Validate questions
        this.validationErrors.questions = [];
        this.group_question.forEach((question, index) => {
          if (question.question.trim() === '') {
            this.validationErrors.questions[index] = 'Vui lòng nhập câu hỏi.';
            isValid = false;
          } else {
            this.validationErrors.questions[index] = '';
          }
        });
  
        return isValid;
      },
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
            for (const questionKey in voteData.questions) {
              const question = voteData.questions[questionKey];
              const type = question.type;
              const questionName = Object.keys(question)[1];
              const options = question[questionName];
              const optionsArray = options.map((option) => {
                return { answer_value: option.option };
              });
              const newQuestion = {
                question: questionName,
                options: optionsArray,
                type: type
              };
              this.group_question.push(newQuestion);
            }
          }
        })
        .catch((error) => {
          console.log('Error:', error);
        });
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
                    <label class="card-title">Tiêu đề<span class="text-danger">*</span></label>
                    <b-form-group id="title-text" :state="validationErrors.title ? false : null" :invalid-feedback="validationErrors.title">
                      <b-form-input v-model="title_vote" placeholder=""></b-form-input>
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
                      <label class="card-title">Câu hỏi<span class="text-danger">*</span></label>
                      <b-form-group :state="validationErrors.questions[indexQuestion] ? false : null" :invalid-feedback="validationErrors.questions[indexQuestion]">
                        <b-form-input v-model="question.question" placeholder=""></b-form-input>
                      </b-form-group>
                    </div>
                    <div class="col-lg-3">
                      <label>Loại:</label>
                      <select class="form-control select2" v-model="question.type">
                        <option v-for="value in type_options" :key="value.id" :value="value.id">{{ value.option }}</option>
                      </select>
                    </div>
                  </div>
                  <label class="card-title" v-if="question.type !== 3">Câu trả lời</label>
                  <div class="row" v-if="question.type !== 3" v-for="(answer, indexAnswer) in question.options" :key="indexAnswer">
                    <div class="col-lg-9">
                      <b-form-group>
                        <b-form-input v-model="answer.answer_value" placeholder=""></b-form-input>
                      </b-form-group>
                    </div>
                    <a v-if="question.options.length > 1" class="text-danger mt-1" @click="removeAnswer(question, indexAnswer)" href="#"><i class="fas fa-trash-alt"></i>&nbsp;Xoá</a>
                  </div>
                  <a href="#" @click="addAnswer(question)" v-if="question.type !== 3"><i class="fas fa-plus"></i>&nbsp;&nbsp;Thêm câu trả lời</a>
                  <div class="row float-right">
                    <div v-if="group_question.length > 1" class="mr-3">
                      <a class="text-danger" href="#" @click="removeQuestion(indexQuestion)"><i class="fas fa-trash-alt"></i>&nbsp;Xoá câu hỏi</a>
                    </div>
                    <div class="mr-2">
                      <a href="#" @click="addQuestion"><i class="fas fa-plus"></i>&nbsp;Thêm câu hỏi</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <button class="btn btn-primary float-right mb-4" type="submit">Lưu biểu mẫu</button>
          </form>
        </div>
      </div>
    </div>
</template>
  