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
      selected_radio: [],
      data_json:'',
      textContent: '',
    };
  },
  created() {
    let token = this.$store.getters.accessToken;
    console.log("check token: ",token);
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
            return { answer_id: option.option_id , answer_value: option.option };
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
  },
  methods:{
    saveData(){
      
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
          <button class="btn btn-primary float-right mb-4" type="submit">Gửi Đánh Giá</button>
        </form>
      </div>
    </div>
  </div>
</template>   