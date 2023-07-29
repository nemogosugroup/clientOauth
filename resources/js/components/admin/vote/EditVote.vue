<script>
export default {
  data() {
    return {
      // group_question: [],
      type_options: [
        { id: 1, option: 'Hộp kiểm' },
        { id: 2, option: 'Trắc nghiệm' },
        { id: 3, option: 'Đoạn ngắn' },
        // { id: 4, option: 'Đánh giá điểm' },
      ],
      voteData: {
        title: null,
        status: null,
        is_public: null,
        vote_id: null,
        questions: null
      },
      selected_banner_File: null,
      selected_logo_File: null,
      image_banner_Url: null,
      image_logo_Url: null,
    };
  },
  methods: {
    addAnswer(question) {
      question.options.push({ option: '', sub_type: 'new' });
    },
    removeAnswer(options, index) {
      if (options[index].option_id > 0) {
        options[index].sub_type = 'remove';
      } else {
        options.splice(index, 1);
      }
    },
    addQuestion() {
      const newQuestionKey = Date.now();
      const newQuestion = {
        question: '',
        options: [{}],
        question_id: newQuestionKey,
        type: 1,
        sub_type: 'new',
        is_required: 0
      };
      console.log("this.voteData.questions", this.voteData.questions);
      this.voteData.questions[newQuestionKey] = newQuestion;
    },
    removeQuestion(index) {
      if (this.voteData.questions[index].sub_type !== 'new') {
        this.voteData.questions[index].sub_type = 'remove';
      } else {
        delete this.voteData.questions[index]
      }
    },
    clearData() {
      // this.group_question = [];
    },
    updateData() {
      // this.position();
      // let dataQuestion = JSON.stringify(this.group_question);
      console.log("check this.voteData", this.voteData);
      
      let formCreateVote = new FormData();
      formCreateVote.append('banner', this.selected_banner_File);
      formCreateVote.append('is_remove_banner', this.image_banner_Url == null);
      formCreateVote.append('logo', this.selected_logo_File);
      formCreateVote.append('is_remove_logo', this.image_logo_Url == null);
      formCreateVote.append('title', this.voteData.title);
      formCreateVote.append('is_anonymous', this.voteData.is_anonymous);
      formCreateVote.append('show_results', this.voteData.show_results);
      formCreateVote.append('type_view', 1);
      formCreateVote.append('questions', JSON.stringify(this.voteData.questions));
      formCreateVote.append('vote_id', this.voteData.vote_id);
      console.log("formCreateVote", formCreateVote);
      let token = this.$store.getters.accessToken;
      axios.post('/api/vote/update', formCreateVote, {
        headers: {
          'Authorization': 'Bearer ' + token
        }
      })
        .then(function (response) {
          if (response.data.status === 200 && response.data.success == true) {
            this.$swal.fire({
              position: "center",
              icon: "success",
              title: "Bạn đã tạo biểu mẫu thành công",
              showConfirmButton: false,
              timer: 1500
            });
            this.$router.push({ name: 'All Vote' });
          } else {
            this.$swal.fire({
              position: "center",
              icon: "error",
              title: response.data.message,
              showConfirmButton: false,
              timer: 1500
            });
            // this.$router.push({ name: 'All Vote' });
          }
        }.bind(this))
        .catch(function (error) {
          console.log("vote/add error: ", error);
        });
    },
    filteredOptions(options) {
      console.log("options.filter(option => option.sub_type !== 'remove')", options.filter(option => option.sub_type !== 'remove'));
      return options.filter(option => option.sub_type !== 'remove').length > 1;
    },
    filteredQuestions(questions) {
      // const questionArray = Object.values(this.questions);
      const questionArray = Object.values(questions);
      // Lọc các câu hỏi không có question.remove bằng true
      const validQuestions = questionArray.filter(question => question.sub_type !== 'remove');

      // Kiểm tra xem có hơn 1 câu hỏi hợp lệ hay không
      return validQuestions.length > 1;
      // return questions.filter(question => question.sub_type !== 'remove').length > 1;
    },

    deleteBanner() {
      this.image_banner_Url = null;
      this.selected_banner_File = null;
    },

    deleteLogo() {
      this.image_logo_Url = null;
      this.selected_logo_File = null;
    },

    onBannerFileChange(event) {
      console.log("check onBannerFileChange");
      // Lấy tập tin ảnh từ sự kiện change
      this.selected_banner_File = event.target.files[0];

      // Hiển thị ảnh được chọn trước khi tải lên (tuỳ chọn)
      if (this.selected_banner_File) {
        const reader = new FileReader();
        reader.onload = (e) => {
          this.image_banner_Url = e.target.result;
        };
        reader.readAsDataURL(this.selected_banner_File);
      }else{
        this.image_banner_Url = this.voteData.banner;
      }
    },

    onLogoFileChange(event) {
      // Lấy tập tin ảnh từ sự kiện change
      this.selected_logo_File = event.target.files[0];

      // Hiển thị ảnh được chọn trước khi tải lên (tuỳ chọn)
      if (this.selected_logo_File) {
        const reader = new FileReader();
        reader.onload = (e) => {
          this.image_logo_Url = e.target.result;
        };
        reader.readAsDataURL(this.selected_logo_File);
      }else{
        this.image_logo_Url = this.voteData.logo;
      }
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
          this.voteData = voteInfo[voteId];
          this.image_banner_Url = this.voteData.banner;
          this.image_logo_Url = this.voteData.logo;
          console.log("this.image_banner_Url",this.image_banner_Url);
          console.log("this.voteData", this.voteData);
        }
      })
      .catch((error) => {
        console.log('Error:', error);
      });
  }
};
</script>

<template>
  <div class="page-title-right d-flex">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <router-link :to="{ path: `/admin/all-vote/`}">
              Quản lý
          </router-link>
        </li>
        <li class="breadcrumb-item">
          <a href="javascript:void(0);" class="mb-0">Chi tiết</a>
        </li>
    </ol>
  </div>
  <div class="container mb-5">
    <div class="row">
      <div class="col-md-12">
        <form class="form-horizontal" role="form" @submit.prevent="updateData">
          <div class="card title">
            <div class="card-body">
              <div class="row align-items-center">
                <div class="col-md-9">
                  <label class="card-title">Nhập tiêu đề<span class="text-danger">*</span></label>
                  <!-- <b-form-group id="title-text" :state="voteData.title ? false : null" :invalid-feedback="voteData.title"> -->
                  <b-form-input for="text" v-model="voteData.title" name="title-text" id="title-text" placeholder=""
                    required :disabled="voteData.is_public == 1"></b-form-input>
                  <!-- </b-form-group> -->
                </div>
                <div class="col-lg-3">
                  <div class="mt-3">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="is_anonymous"
                        v-model="voteData.is_anonymous" style="z-index: 99;" :disabled="voteData.is_public == 1">
                      <label class="custom-control-label">Vote ẩn danh</label>
                    </div>
                  </div>
                  <div class="mt-3">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="show_results"
                        v-model="voteData.show_results" style="z-index: 99;" :disabled="voteData.is_public == 1">
                      <label class="custom-control-label">Hiện kết quả khảo sát</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card add-banner">
            <div class="card-body">
              <div class="row">
                <div class="col-md-12 d-flex justify-content-between">
                  <label class="card-title">Ảnh bìa (Banner):</label>
                  <button v-if="image_banner_Url" class="btn btn-danger btn-sm mb-3" @click="deleteBanner">
                    <i class="fas fa-trash-alt"></i>&nbsp;Xoá
                  </button>
                </div>
                <div class="col-md-12">
                  <div class="input-banner">
                    <input v-if="!image_banner_Url" type="file" ref="fileInput" @change="onBannerFileChange" class="my-3" :disabled="voteData.is_public == 1"/>
                    <img v-if="image_banner_Url" :src="image_banner_Url" alt="Uploaded Image" />
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card add-logo">
            <div class="card-body">
              <div class="row">
                <div class="col-md-12 d-flex justify-content-between">
                  <label class="card-title">Logo:</label>
                  <button v-if="image_logo_Url" class="btn btn-danger btn-sm mt-2" @click="deleteLogo">
                    <i class="fas fa-trash-alt"></i>&nbsp;Xoá
                  </button>
                </div>
                <div class="col-md-12">
                  <div class="row input-logo">
                    <div class="col-md-12">
                      <input type="file" v-if="!image_logo_Url" ref="fileInput" @change="onLogoFileChange" class="my-3" :disabled="voteData.is_public == 1"/>
                    </div>
                    <div class="col-md-12 text-center" v-if="image_logo_Url">
                      <img :src="image_logo_Url" alt="Uploaded Image" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div ref="questionContainer">
            <div class="card question" v-for="question in voteData.questions">
              <div class="card-body" v-if="question.sub_type !== 'remove'">
                <div class="row">
                  <div class="col-lg-8">
                    <label class="card-title">Nhập câu hỏi<span class="text-danger">*</span></label>
                    <!-- <b-form-group :state="question.question ? false : null" :invalid-feedback="question.question"> -->
                    <b-form-input name="question-text" id="question-text" v-model="question.question" placeholder=""
                      required :disabled="voteData.is_public == 1">{{ question }}</b-form-input>
                    <!-- </b-form-group> -->
                  </div>
                  <div class="col-lg-3">
                    <label>Loại:</label>
                    <select class="form-control select2" v-model="question.type" :disabled="voteData.is_public == 1">
                      <option v-for="value in type_options" :key="value.id" :value="value.id">{{ value.option }}</option>
                    </select>
                    <div class="mt-3">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" :id="`is_required_${question.question_id}`" class="custom-control-input"
                        v-model="question.is_required" :disabled="voteData.is_public == 1">
                      <label class="custom-control-label" :for="`is_required_${question.question_id}`">Bắt buộc</label>
                    </div>
                  </div>
                  </div>
                  
                </div>
                <label class="card-title" v-if="question.type !== 3 && question.type !== 4">Nhập câu trả lời</label>
                <label class="card-title" v-if="question.type === 4">Nhập số điểm tối đa</label>
                <div class="row" v-if="question.type !== 3" v-for="(option, index) in question.options" :key="index">
                  <div class="col-lg-9" ref="lastInput" v-if="option.sub_type !== 'remove'">
                    <b-form-input id="answer-text" class="mb-3" name="answer-text" v-model="option.option" placeholder=""
                      @keypress.enter.prevent @keyup.enter="addAnswer(question)" required
                      :disabled="voteData.is_public == 1"></b-form-input>
                  </div>
                  <!-- <a v-if="question.options.length > 1" class="text-danger mt-1" @click="removeAnswer(question.options, index)"
                    href="javascript:void(0);"><i class="fas fa-trash-alt"></i>&nbsp;Xoá</a> -->
                  <a v-if="(filteredOptions(question.options) && option.sub_type !== 'remove') && voteData.is_public == 0"
                    class="text-danger mt-1" @click="removeAnswer(question.options, index)" href="javascript:void(0);"><i
                      class="fas fa-trash-alt"></i>&nbsp;Xoá</a>
                </div>
                <a href="javascript:void(0);" @click="addAnswer(question)"
                  v-if="question.type !== 3 && voteData.is_public == 0"><i class="fas fa-plus"></i>&nbsp;&nbsp;Thêm câu trả
                  lời</a>
                <div class="row float-right">
                  <div v-if="filteredQuestions(voteData.questions) && voteData.is_public == 0" class="mr-3">
                    <a class="text-danger" href="javascript:void(0);" @click="removeQuestion(question.question_id)"><i
                        class="fas fa-trash-alt"></i>&nbsp;Xoá câu hỏi</a>
                  </div>
                  <div class="mr-2">
                    <a href="javascript:void(0);" @click="addQuestion" v-if="voteData.is_public == 0"><i
                        class="fas fa-plus"></i>&nbsp;Thêm câu hỏi</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <button class="btn btn-primary float-right mb-4" type="submit" v-if="voteData.is_public == 1" :disabled="true">Trang vote đã được xuất bản</button>
          <button class="btn btn-primary float-right mb-4" type="submit" v-else :disabled="voteData.is_public == 1">Lưu biểu
            mẫu</button>
        </form>
    </div>
  </div>
</div></template>
  