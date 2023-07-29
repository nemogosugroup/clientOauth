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
      isPublic: false,
      scaleValue: {},
      logo_vote: '',
      banner_default: '/images/banner-default.jpg',
      logo_default: '/images/logo-default.jpg',
      banner_vote:'',
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
          this.isPublic = voteData.is_public == 1 ? true : false;
          console.log("check this.status",this.status)
          this.title_vote = voteData.title;
          this.banner_vote = voteData.banner;
          this.logo_vote = voteData.logo;
          
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
  },
  methods:{
    // saveData(){
    //   let formVoteData = {
    //     id: this.$route.params.id,
        
    //   };
    //   console.log(formVoteData);
    // }  
    // saveData() {
    //   let vote_info = {};
    //   for (const question of this.group_question) {
    //     console.log("check question", question)
    //     if (question.type === 1) {
    //       vote_info[question.question_id] = this.selected_checkbox.filter((option_id) => {
    //         return question.options.some((option) => option.option_id === option_id);
    //       });
    //     } else if (question.type === 2) {
    //       let selected_radio_temp = this.selected_radio[question.question_id] || '';
    //       vote_info[question.question_id] = selected_radio_temp !== '' ? [selected_radio_temp] : [];
    //     } else if (question.type === 3) {
    //       // Loại hình câu hỏi dạng văn bản, không có phương án được chọn
    //       // Có thể xử lý dữ liệu văn bản ở đây nếu cần thiết
    //       vote_info[question.question_id] = this.textContents[question.question_id] || '';
    //     } else if (question.type === 4) {
    //       // Loại hình câu hỏi dạng LinearScale
    //       vote_info[question.question_id] = this.scaleValue[question.question_id] || '';
    //     }
    //   }

    //   for (const question of this.group_question) {
    //     if (question.is_required === 1) {
    //       // Check if the question is answered based on its type
    //       let isQuestionAnswered = false;
    //       if (question.type === 1) {
    //         isQuestionAnswered = this.selected_checkbox.some((option_id) =>
    //           question.options.some((option) => option.option_id === option_id)
    //         );
    //       } else if (question.type === 2) {
    //         isQuestionAnswered = !!this.selected_radio[question.question_id];
    //       } else if (question.type === 3) {
    //         isQuestionAnswered = !!this.textContents[question.question_id];
    //       } else if (question.type === 4) {
    //         isQuestionAnswered = !!this.scaleValue[question.question_id];
    //       }

    //       if (!isQuestionAnswered) {
    //         // Display an error message or handle the validation as needed
    //         this.$swal.fire({
    //           position: "center",
    //           icon: "error",
    //           title: `Xin vui lòng trả lời câu hỏi: ${question.question}`,
    //           showConfirmButton: false,
    //           timer: 1500
    //         });
    //         return; // Stop the form submission if any required question is not answered
    //       }
    //     }
    //   }

    //   let formVoteData = {
    //     id: this.$route.params.id,
    //     vote_info: JSON.stringify(vote_info),
    //   };
    //   console.log(formVoteData);
    //   let token = this.$store.getters.accessToken;
    //   // console.log("this.group_question", this.group_question);
    //   let seft = this;
    //   axios.post('/api/vote/vote', formVoteData, {
    //     headers: {
    //       'Authorization': 'Bearer ' + token
    //     }
    //   })
    //     .then(function (response) {
    //       // console.log("vote/add: ", response.data);
    //       if (response.data.status === 200 && response.data.success == true) {
    //         seft.group_question = [];
    //         const voteInfo = response.data.data.voteInfo;
    //         const voteId = Object.keys(voteInfo)[0];
    //         const voteData = voteInfo[voteId];
    //         seft.isVoted = true;
    //         seft.status = voteData.status == 1 ? true : false;
    //         seft.title_vote = voteData.title;
    //         // console.log(voteData);
    //         for (const questionKey in voteData.questions) {
    //           let question_total_voted = 0;
    //           let question = voteData.questions[questionKey];
    //           for (const option of question.options) {
    //             question_total_voted += option.total_voted;
    //             // console.log(option);
    //           }
    //           if (question_total_voted == 0) {
    //             question_total_voted = 1;
    //           }
    //           question.total_voted = question_total_voted
    //           seft.group_question.push(question);
    //           // console.log("group_question", seft.group_question);
    //           //gửi thông báo
    //           seft.$swal.fire({
    //             position: "center",
    //             icon: "success",
    //             title: "Bạn thực hiện đánh giá thành công",
    //             showConfirmButton: false,
    //             timer: 1500
    //           });
    //         }
    //         // console.log("this.group_question", seft.group_question);
    //       }else{
    //         seft.$swal.fire({
    //           position: "center",
    //           icon: "error",
    //           title: response.data.message,
    //           showConfirmButton: false,
    //           timer: 1500
    //         });
    //       }

    //     })
    //     .catch(function (error) {
    //       console.log("vote/add error: ", error);
    //     });
      

    //   console.log(formVoteData);
    // },
    // updateData() {
    //   if(this.$route.params.id && this.$route.params.id >0){
    //     let token = this.$store.getters.accessToken;
    //     axios.get(`/api/vote/get-info?id=${this.$route.params.id}`, {
    //       headers: {
    //         Authorization: 'Bearer ' + token
    //       }
    //     })
    //     .then((response) => {
    //       if (response.data.status === 200 && response.data.success) {
    //         // Cập nhật dữ liệu vào state hoặc các biến khác của component
    //         const voteInfo = response.data.data.voteInfo;
    //         this.isVoted = response.data.data.is_voted;
    //         const voteId = Object.keys(voteInfo)[0];
    //         const voteData = voteInfo[voteId];
    //         this.status = voteData.status == 1;
    //         this.title_vote = voteData.title;

    //         // Cập nhật lại các giá trị total_voted của câu hỏi
    //         for (const questionKey in voteData.questions) {
    //           let question_total_voted = 0;
    //           let question = voteData.questions[questionKey];
    //           for (const option of question.options) {
    //             question_total_voted += option.total_voted;
    //           }
    //           if (question_total_voted == 0) {
    //             question_total_voted = 1;
    //           }
    //           question.total_voted = question_total_voted;
    //         }

    //         // Gán lại giá trị cho group_question
    //         this.group_question = Object.values(voteData.questions);
    //       }
    //     })
    //     .catch((error) => {
    //       console.log('Error:', error);
    //     });
    //   }
      
    // },


    onScaleValueChange(value) {
      this.scaleValue = value;
    },

  },
  computed: {
    bannerImageUrl() {
      let banner_vote = this.banner_vote;
      if(banner_vote === null || banner_vote === ""){
        banner_vote = this.banner_default
      }
      return `url(${banner_vote})`;
    },
  },
};
</script>

<template>
  <div class="container mb-5 mt-5">
    <router-link :to="{ path: `/admin/all-vote/`}">
      <button class="btn btn-dark mr-2 mb-4"><i class="ri-arrow-left-line"></i>&nbsp;Quay lại</button>
    </router-link>
    <div class="card banner fade-in" style="background-repeat: no-repeat;background-position: center ;background-size: cover;" :style="{ backgroundImage: bannerImageUrl }">
        <div class="logo-vote">
          <img class="fade-in" v-if="logo_vote" :src="logo_vote" alt="Logo Vote">
          <img class="fade-in" v-else :src="logo_default" alt="Logo Vote">
        </div>
    </div>
    <div class="card">
      <div class="card-body">
        <h3 class="text-capitalize mb-0">{{ title_vote }}</h3>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <form class="gosu-form-evaluation" role="form">
          <div class="row mt-2">
            <div class="col-md-12" v-for="(question) in group_question" :key="question.question_id">
              <div class="card">
                <div class="card-body">
                  <h5 class="font-size-16 mb-4 text-capitalize">{{ question.question }}<span v-if="question.is_required === true" class="font-size-18 text-danger">*</span></h5>
                  <div class="row" v-if="question.type === 1">
                    <div class="col-md-12 mb-3" v-for="(answer) in question.options" :key="answer.option_id">
                      <div class="custom-control custom-checkbox mb-2">
                        <input type="checkbox" class="custom-control-input" :name="'checkbox_' + answer.option_id"
                          :id="answer.option_id" :value="answer.option_id" v-model="selected_checkbox" :disabled="isVoted || !status || !isPublic"/>
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
                          v-model="selected_radio[question.question_id]" :disabled="isVoted || !status || !isPublic"/>
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
                          placeholder="Nhập câu trả lời ..." name="textarea" :disabled="isVoted || !status || !isPublic"></textarea>
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
        </form>
      </div>
    </div>
  </div>
</template>   

<style>
.card.banner{
  min-height: 300px;
  margin-bottom: 100px;
}

.logo-vote{
  width: 150px;
  height: 150px;
  min-height: 150px;
  background-color: white;
  position: absolute;
  bottom: -25%;
  left: 10%;
  border-radius: 100%;
  box-shadow: 0px 5px 20px 0px rgba(24, 24, 24, 0.637);
  overflow: hidden;
}

.logo-vote img{
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 50%;
  display: block;
}

.fade-in {
  animation: fadeIn ease 2s;
  -webkit-animation: fadeIn ease 2s;
  -moz-animation: fadeIn ease 2s;
  -o-animation: fadeIn ease 2s;
  -ms-animation: fadeIn ease 2s;
}


@keyframes fadeIn{
  0% {
    opacity:0;
  }
  100% {
    opacity:1;
  }
}

@-moz-keyframes fadeIn {
  0% {
    opacity:0;
  }
  100% {
    opacity:1;
  }
}

@-webkit-keyframes fadeIn {
  0% {
    opacity:0;
  }
  100% {
    opacity:1;
  }
}

@-o-keyframes fadeIn {
  0% {
    opacity:0;
  }
  100% {
    opacity:1;
  }
}

@-ms-keyframes fadeIn {
  0% {
    opacity:0;
  }
  100% {
    opacity:1;
  }
}
</style>