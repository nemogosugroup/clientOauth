<script>
/**
 * Form-element component
 */
import LinearScale from "../vote/type-vote/LinearScale.vue";

export default {
  components: {
    LinearScale,
  },
  data() {
    return {
      group_question: [],
      options: [],
      title_vote: "",
      selected_checkbox: [],
      selected_radio: [],
      data_json: '',
      textContents: {},
      optionstogetTotal: [],
      isVoted: false,
      status: false,
      scaleValue: {},
    };
  },
  created() {
    let token = this.$store.getters.accessToken;
    console.log("check token: ", token);
    axios.get(`/api/vote/get-info?id=${this.$route.params.id}`, {
      headers: {
        Authorization: 'Bearer ' + token
      }
    })
      .then((response) => {
        if (response.data.status === 200 && response.data.success == true) {
          const voteInfo = response.data.data.voteInfo;
          this.isVoted = response.data.data.is_voted;
          
          console.log("check this.isVoted",this.isVoted)
          const voteId = Object.keys(voteInfo)[0];
          const voteData = voteInfo[voteId];
          this.status = voteData.status == 1 ? true : false;
          console.log("check this.status",this.status)
          this.title_vote = voteData.title;
          for (const questionKey in voteData.questions) {
            let question_total_voted = 0;
            let question = voteData.questions[questionKey];
            for (const option of question.options) {
              question_total_voted += option.total_voted;
            }
            if (question_total_voted == 0) {
              question_total_voted = 1;
            }
            question.total_voted = question_total_voted
            this.group_question.push(question);
          }
        }
      })
      .catch((error) => {
        console.log('Error:', error);
      });
    
    // Gọi hàm updateData() ban đầu khi component được tạo
    this.updateData();

    // Gọi hàm updateData() mỗi 5 giây
    this.updateInterval = setInterval(this.updateData, 10000);
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
        console.log("check question", question)
        if (question.type === 1) {
          vote_info[question.question_id] = this.selected_checkbox.filter((option_id) => {
            return question.options.some((option) => option.option_id === option_id);
          });
        } else if (question.type === 2) {
          let selected_radio_temp = this.selected_radio[question.question_id] || '';
          vote_info[question.question_id] = selected_radio_temp !== '' ? [selected_radio_temp] : [];
        } else if (question.type === 3) {
          // Loại hình câu hỏi dạng văn bản, không có phương án được chọn
          // Có thể xử lý dữ liệu văn bản ở đây nếu cần thiết
          vote_info[question.question_id] = this.textContents[question.question_id] || '';
        } else if (question.type === 4) {
          // Loại hình câu hỏi dạng LinearScale
          vote_info[question.question_id] = this.scaleValue[question.question_id] || '';
        }
      }

      let formVoteData = {
        id: this.$route.params.id,
        vote_info: JSON.stringify(vote_info),
      };
      console.log(formVoteData);
      let token = this.$store.getters.accessToken;
      // console.log("this.group_question", this.group_question);
      let seft = this;
      axios.post('/api/vote/vote', formVoteData, {
        headers: {
          'Authorization': 'Bearer ' + token
        }
      })
        .then(function (response) {
          // console.log("vote/add: ", response.data);
          if (response.data.status === 200 && response.data.success == true) {
            seft.group_question = [];
            const voteInfo = response.data.data.voteInfo;
            const voteId = Object.keys(voteInfo)[0];
            const voteData = voteInfo[voteId];
            seft.isVoted = true;
            seft.status = voteData.status == 1 ? true : false;
            seft.title_vote = voteData.title;
            // console.log(voteData);
            for (const questionKey in voteData.questions) {
              let question_total_voted = 0;
              let question = voteData.questions[questionKey];
              for (const option of question.options) {
                question_total_voted += option.total_voted;
                // console.log(option);
              }
              if (question_total_voted == 0) {
                question_total_voted = 1;
              }
              question.total_voted = question_total_voted
              seft.group_question.push(question);
              // console.log("group_question", seft.group_question);
              //gửi thông báo
              seft.$swal.fire({
                position: "center",
                icon: "success",
                title: "Bạn thực hiện đánh giá thành công",
                showConfirmButton: false,
                timer: 1500
              });
            }
            // console.log("this.group_question", seft.group_question);
          }else{
            seft.$swal.fire({
              position: "center",
              icon: "error",
              title: response.data.message,
              showConfirmButton: false,
              timer: 1500
            });
          }

        })
        .catch(function (error) {
          console.log("vote/add error: ", error);
        });
      

      console.log(formVoteData);
    },
    updateData() {
      let token = this.$store.getters.accessToken;
      axios.get(`/api/vote/get-info?id=${this.$route.params.id}`, {
        headers: {
          Authorization: 'Bearer ' + token
        }
      })
      .then((response) => {
        if (response.data.status === 200 && response.data.success) {
          // Cập nhật dữ liệu vào state hoặc các biến khác của component
          const voteInfo = response.data.data.voteInfo;
          this.isVoted = response.data.data.is_voted;
          const voteId = Object.keys(voteInfo)[0];
          const voteData = voteInfo[voteId];
          this.status = voteData.status == 1;
          this.title_vote = voteData.title;

          // Cập nhật lại các giá trị total_voted của câu hỏi
          for (const questionKey in voteData.questions) {
            let question_total_voted = 0;
            let question = voteData.questions[questionKey];
            for (const option of question.options) {
              question_total_voted += option.total_voted;
            }
            if (question_total_voted == 0) {
              question_total_voted = 1;
            }
            question.total_voted = question_total_voted;
          }

          // Gán lại giá trị cho group_question
          this.group_question = Object.values(voteData.questions);
        }
      })
      .catch((error) => {
        console.log('Error:', error);
      });
    },


    onScaleValueChange(value) {
      this.scaleValue = value;
    },

  },
  computed: {
  },
};
</script>

<template>
  <div class="container mb-5 mt-5">
    <div class="card">
      <div class="card-body">
        <h3 class="text-capitalize mb-0">{{ title_vote }}</h3>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <form class="gosu-form-evaluation" role="form" @submit.prevent="saveData">
          <div class="row mt-2">
            <div class="col-md-12" v-for="(question) in group_question" :key="question.question_id">
              <div class="card">
                <div class="card-body">
                  <h5 class="font-size-16 mb-4 text-capitalize">{{ question.question }}</h5>
                  <div class="row" v-if="question.type === 1">
                    <div class="col-md-12 mb-3" v-for="(answer) in question.options" :key="answer.option_id">
                      <div class="custom-control custom-checkbox mb-2">
                        <input type="checkbox" class="custom-control-input" :name="'checkbox_' + answer.option_id"
                          :id="answer.option_id" :value="answer.option_id" v-model="selected_checkbox" :disabled="isVoted || !status"/>
                        <label class="custom-control-label text-capitalize" :for="answer.option_id">{{ answer.option}}</label>
                      </div>
                      <b-progress :max="100" height="14px">
                        <b-progress-bar :value="(answer.total_voted / question.total_voted) * 100"
                          :label="`${((answer.total_voted / question.total_voted) * 100).toFixed(0)}%`"></b-progress-bar>
                      </b-progress>
                    </div>
                  </div>
                  <div class="row" v-if="question.type === 2">
                    <div class="col-md-12 mb-3" v-for="(answer) in question.options" :key="answer.option_id">
                      <div class="custom-control custom-radio mb-2">
                        <input type="radio" class="custom-control-input" :name="'radio_' + answer.option_id"
                          :id="answer.option_id" :value="answer.option_id"
                          v-model="selected_radio[question.question_id]" :disabled="isVoted || !status"/>
                        <label class="custom-control-label text-capitalize" :for="answer.option_id">{{ answer.option
                        }}</label>
                      </div>
                      <b-progress :max="100" height="14px">
                        <b-progress-bar :value="(answer.total_voted / question.total_voted) * 100"
                          :label="`${((answer.total_voted / question.total_voted) * 100).toFixed(0)}%`"></b-progress-bar>
                      </b-progress>
                    </div>
                  </div>
                  <div class="row flex-wrap" v-if="question.type === 3">
                    <div class="col-md-12">
                      <div class="mb-3">
                        <textarea v-model="textContents[question.question_id]" class="form-control" rows="2"
                          placeholder="Nhập câu trả lời ..." name="textarea" :disabled="isVoted || !status"></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row flex-wrap" v-if="question.type === 4">
                    <div class="col-md-12" v-for="(answer) in question.options" :key="answer.option_id">
                      <div class="mb-3">
                        <LinearScale
                          :minValue="0"
                          :maxValue="answer.option"
                          :step="1"
                          :initialValue="0"
                          @input="onScaleValueChange"
                          :v-model="scaleValue"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <button class="btn btn-primary float-right mb-4" type="submit" v-bind:class="{ 'disabled-button': isVoted || !status }">Gửi Đánh Giá</button>
        </form>
      </div>
    </div>
  </div>
</template>   