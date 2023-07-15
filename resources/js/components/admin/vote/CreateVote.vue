<script>
/**
 * Form-element component
 */
export default {

  data() {
    return {
      gen_question_id : 0,
      group_question:[
        { question_id:'', question_value: '' ,group_answer: [{ answer_id: 0,answer_value: '' }]}
      ],
      group_answer:[
        { answer_id: 0,answer_value: '' }
      ],
      gen_answer_id : 0,
      saved_group_answer: [],
      type_options: [
        { id: 0, option: 'Hộp kiểm' },
        { id: 1, option: 'Trắc nghiệm' },
        { id: 2, option: 'filter_c' },
        { id: 3, option: 'filter_d' },
      ],
      type_vote: 0,
      title_vote:"",
    };
  },
  methods: {
    addAnswer(question) {
      this.gen_answer_id ++;
      question.group_answer.push({ answer_id: this.gen_answer_id,answer_value: '' });
    },
    removeAnswer(question,index) {
      question.group_answer.splice(index, 1);
    },
    addQuestion() {
      this.gen_question_id ++;
      const newQuestion = { question_id: this.gen_question_id, question_value: '' ,group_answer: [{ answer_id: 0,answer_value: '' }]};
      this.group_question.push(newQuestion);
    },
    removeQuestion(index) {
      this.group_question.splice(index, 1);
      console.log(index);
    },
    position() {
      this.$swal.fire({
        position: "center",
        icon: "success",
        title: "Bạn đã tạo biểu mẫu thành công",
        showConfirmButton: false,
        timer: 1500
      });
    },
    saveData(){
      this.position();
     
      const formCreateVote = {
        type_vote: this.type_vote,
        title_vote: this.title_vote,
        group_question: this.group_question,
        // message: this.message
      };
      console.log(formCreateVote);
    },
  },
};
</script>

<template>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <form class="form-horizontal" role="form" @submit.prevent="saveData">
          <div class="card">
            <div class="card-body">
              <div class="row">
                <div class="col-md-12">
                    <label class="card-title">Nhập tiêu đề</label>
                    
                    <b-form-group id="question-text">
                      <b-form-input for="text" v-model="title_vote" name="title-text" id="title-text" placeholder=""></b-form-input>
                    </b-form-group>
                </div>
              </div>
            </div>
          </div>    
          <div class="card" v-for="(question, indexQuestion) in group_question" :key="indexQuestion">
            <div class="card-body">
              <div class="row">
                <div class="col-lg-9">
                    <label class="card-title">Nhập câu hỏi</label>
                    <b-form-group >
                      <b-form-input name="question-text" id="question-text" v-model="question.question_value" placeholder=""></b-form-input>
                    </b-form-group>
                </div>
                <div class="col-lg-3">
                  <label>Loại:</label>
                  <select class="form-control select2" v-model="type_vote">
                    <option v-for="value in type_options" :key="value.id" :value="value.id">{{ value.option }}</option>
                  </select>
                </div>
              </div>
              <label class="card-title">Nhập câu trả lời</label>
              <div class="row" v-for="(answer, indexAnswer) in question.group_answer" :key="indexAnswer">
                <div class="col-lg-9">
                  <b-form-group >
                    <b-form-input id="answer-text" name="answer-text" v-model="answer.answer_value" placeholder=""></b-form-input>
                  </b-form-group>
                </div>
                <a v-if="question.group_answer.length > 1" class="text-danger mt-1" @click="removeAnswer(question, indexAnswer)" href="#"><i class="fas fa-trash-alt"></i>&nbsp;Xoá</a>
              </div>
              <a href="#" @click="addAnswer(question)"><i class="fas fa-plus"></i>&nbsp;&nbsp;Thêm câu trả lời</a>
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
          <button class="btn btn-primary float-right mb-4" type="submit">Lưu biểu mẫu</button>
        </form>
      </div>
    </div>
  </div>
</template>