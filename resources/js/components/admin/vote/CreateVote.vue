<script>
/**
 * Form-element component
 */
export default {
  data() {
    return {
      group_question: [
        { question: '', options: [{ answer_value: '' }], type: 1, is_required: 0 }
      ],
      options: [
        { answer_value: '' }
      ],
      type_options: [
        { id: 1, option: 'Hộp kiểm' },
        { id: 2, option: 'Trắc nghiệm' },
        { id: 3, option: 'Đoạn ngắn' },
        // { id: 4, option: 'Đánh giá điểm' },
      ],
      title_vote: "",
      is_anonymous: true,
      statuscode: null,
      selected_banner_File: null,
      selected_logo_File: null,
      image_banner_Url: null,
      image_logo_Url: null,
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
      const newQuestion = { question: '', options: [{ answer_value: '' }], type: 1, is_required: 0 };
      this.group_question.push(newQuestion);
    },
    removeQuestion(index) {
      this.group_question.splice(index, 1);
    },

    onBannerFileChange(event) {
      // Lấy tập tin ảnh từ sự kiện change
      this.selected_banner_File = event.target.files[0];

      // Hiển thị ảnh được chọn trước khi tải lên (tuỳ chọn)
      if (this.selected_banner_File) {
        const reader = new FileReader();
        reader.onload = (e) => {
          this.image_banner_Url = e.target.result;
        };
        reader.readAsDataURL(this.selected_banner_File);
      }
    },

    deleteBanner() {
      this.image_banner_Url = null;
      this.selected_banner_File = null;
    },

    deleteLogo() {
      this.image_logo_Url = null;
      this.selected_logo_File = null;
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
      }
    },

    saveData() {
      // this.position();
      let dataQuestion = JSON.stringify(this.group_question);
      console.log(this.selected_banner_File);
      let formData = new FormData();
      formData.append('title', this.title_vote);
      formData.append('is_anonymous', this.is_anonymous);
      formData.append('type_view', 1);
      formData.append('questions', dataQuestion);
      formData.append('banner', this.selected_banner_File);
      formData.append('logo', this.selected_logo_File);
      console.log("formData", formData);
      let token = this.$store.getters.accessToken;
      axios.post('/api/vote/add', formData, {
        headers: {
          'Authorization': 'Bearer ' + token
        }
      })
        .then(function (response) {
          console.log("vote/add: ", response.data);
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
          }
        }.bind(this))
        .catch(function (error) {
          console.log("vote/add error: ", error);
        });
    },
  },
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
          <a href="javascript:void(0);" class="mb-0">Tạo mới</a>
        </li>
    </ol>
  </div>
  <div class="container mb-5">
    <div class="row">
      <div class="col-md-12">
        <form class="form-horizontal" role="form" @submit.prevent="saveData">
          <div class="card title">
            <div class="card-body">
              <div class="row align-items-center">
                <div class="col-md-9">
                  <label class="card-title">Nhập tiêu đề<span class="text-danger">*</span></label>
                  <b-form-group id="title-text">
                    <b-form-input for="text" v-model="title_vote" name="title-text" id="title-text" placeholder=""
                      required></b-form-input>
                  </b-form-group>
                </div>
                <div class="col-lg-3">
                  <div class="mt-3">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="is_anonymous" v-model="is_anonymous"
                        style="z-index: 99;">
                      <label class="custom-control-label">Đánh giá ẩn danh</label>
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
                    <i class="fas fa-trash-alt"></i> Xoá
                  </button>
                </div>
                <div class="col-md-12">
                  <div class="input-banner">
                    <input v-if="!image_banner_Url" type="file" ref="fileInput" @change="onBannerFileChange" class="my-3" />
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
                    <i class="fas fa-trash-alt"></i> Xoá
                  </button>
                </div>
                <div class="col-md-12">
                  <div class="row input-logo">
                    <div class="col-md-12">
                      <input type="file" v-if="!image_logo_Url" ref="fileInput" @change="onLogoFileChange" class="my-3" />
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
            <div class="card question" :ref="`questionCard_${indexQuestion}`"
              v-for="(question, indexQuestion) in group_question" :key="indexQuestion">
              <div class="card-body">
                <div class="row">
                  <div class="col-lg-9">
                    <label class="card-title">Nhập câu hỏi<span class="text-danger">*</span></label>
                    <b-form-group>
                      <b-form-input name="question-text" id="question-text" v-model="question.question" placeholder=""
                        required></b-form-input>
                    </b-form-group>
                  </div>
                  <div class="col-lg-3">
                    <label>Loại:</label>
                    <select class="form-control select2" v-model="question.type">
                      <option v-for="value in type_options" :key="value.id" :value="value.id">{{ value.option }}</option>
                    </select>
                    <div class="mt-3">
                      <div class="custom-control custom-checkbox">
                        <input type="checkbox" :id="`is_required_${indexQuestion}`" class="custom-control-input"
                          v-model="question.is_required">
                        <label class="custom-control-label" :for="`is_required_${indexQuestion}`">Bắt buộc</label>
                      </div>
                    </div>
                  </div>
                </div>
                <label class="card-title" v-if="question.type !== 3 && question.type !== 4">Nhập câu trả lời</label>
                <label class="card-title" v-if="question.type === 4">Nhập số điểm tối đa</label>
                <div class="row" v-if="question.type !== 3" v-for="(answer, indexAnswer) in question.options"
                  :key="indexAnswer">
                  <div class="col-lg-9" ref="lastInput">
                    <b-form-group>
                      <b-form-input id="answer-text" v-if="question.type !== 4" name="answer-text"
                        v-model="answer.answer_value" placeholder="" @keypress.enter.prevent
                        @keyup.enter="addAnswer(question)" required></b-form-input>
                      <b-form-input id="answer-text" v-else name="answer-text" v-model="answer.answer_value" min="0"
                        max="10" type="number" placeholder="" required></b-form-input>
                    </b-form-group>
                  </div>
                  <a v-if="question.options.length > 1" class="text-danger mt-1"
                    @click="removeAnswer(question, indexAnswer)" href="javascript:void(0);"><i
                      class="fas fa-trash-alt"></i>&nbsp;Xoá</a>
                </div>
                <a href="javascript:void(0);" @click="addAnswer(question)" v-if="question.type !== 3"><i
                    class="fas fa-plus"></i>&nbsp;&nbsp;Thêm câu trả lời</a>
                <div class="row float-right">
                  <div v-if="group_question.length > 1" class="mr-3">
                    <a class="text-danger" href="javascript:void(0);" @click="removeQuestion(indexQuestion)"><i
                        class="fas fa-trash-alt"></i>&nbsp;Xoá câu hỏi</a>
                  </div>
                  <div class="mr-2">
                    <a href="javascript:void(0);" @click="addQuestion"><i class="fas fa-plus"></i>&nbsp;Thêm câu hỏi</a>
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

<style>
.input-banner img {
  max-height: 300px;
  width: 100%;
  object-fit: cover;
}

.input-logo img {
  max-height: 150px;
  width: 150px;
  height: 150px;
  object-fit: cover;
  border-radius: 50%;
  box-shadow: 0px 5px 20px 0px rgba(24, 24, 24, 0.6);
}

</style>