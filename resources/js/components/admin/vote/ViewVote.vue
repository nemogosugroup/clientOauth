<script>
/**
 * Form-element component
 */
export default {
  data() {
    return {
      data_checkbox: [
        { id: 0, text: 'filter_a' },
        { id: 1, text: 'filter_b' },
        { id: 2, text: 'filter_c' },
        { id: 3, text: 'filter_d' },
      ],
      data_radio: [
        { id: 4, text: 'filter_a' },
        { id: 5, text: 'filter_b' },
        { id: 6, text: 'filter_c' },
        { id: 7, text: 'filter_d' },
      ],
      selected_checkbox: [],
      selected_radio: [],
      data_json:'',
      textContent: '', 
      minHeight: 'auto'
    };
  },
};
</script>

<template>
    <div class="container">
      <h3>Kiểu 1</h3>
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-body">
              <form class="gosu-form-evaluation"  role="form">
                <div class="row mb-3">
                  <div class="col-md-12">
                    <div>
                      <h5 class="font-size-16 mb-4">Default Checkboxes</h5>
                      <div class="row flex-wrap">
                        <div class="col-md-3" v-for="data_f in data_checkbox" :key="data_f.id">
                          <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" :id="data_f.id" v-model="selected_checkbox" :value="data_f.id" />
                            <label class="custom-control-label" :for="data_f.id">{{ data_f.text }}</label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="mt-3">
                      <h5 class="font-size-16 mb-4">Default Radios</h5>
                      <div class="row flex-wrap">
                        <div class="col-md-3" v-for="data_f in data_radio" :key="data_f.id">
                          <div class="custom-control custom-radio mb-3">
                            <input
                              type="radio"
                              name="customRadio"
                              class="custom-control-input"
                              :id="data_f.id" v-model="selected_radio" :value="data_f.id"
                            />
                            <label class="custom-control-label" :for="data_f.id">{{ data_f.text }}</label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="mt-3">
                      <h5 class="font-size-16 mb-4">Default Radios</h5>
                      <textarea
                        v-model="textarea"
                        class="form-control"
                        rows="1"
                        placeholder=""
                      ></textarea>
                    </div>
                  </div>
                </div>
                <button class="btn btn-primary float-right" type="submit">Gửi Đánh Giá</button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <h3>Kiểu 2</h3>
      <div class="row">
        <div class="col-md-12">
          <form class="gosu-form-evaluation" role="form">
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <h5 class="font-size-16 mb-4">Default Checkboxes</h5>
                    <div class="row flex-wrap">
                      <div class="col-md-3" v-for="data_f in data_checkbox" :key="data_f.id">
                        <div class="custom-control custom-checkbox mb-3">
                          <input type="checkbox" class="custom-control-input" :id="data_f.id" v-model="selected_checkbox" :value="data_f.id" />
                          <label class="custom-control-label" :for="data_f.id">{{ data_f.text }}</label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <h5 class="font-size-16 mb-4">Default Radios</h5>
                    <div class="row flex-wrap">
                      <div class="col-md-3" v-for="data_f in data_radio" :key="data_f.id">
                        <div class="custom-control custom-radio mb-3">
                          <input
                            type="radio"
                            name="customRadio"
                            class="custom-control-input"
                            :id="data_f.id" v-model="selected_radio" :value="data_f.id"
                          />
                          <label class="custom-control-label" :for="data_f.id">{{ data_f.text }}</label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <h5 class="font-size-16 mb-4">Default Radios</h5>
                    <div class="row flex-wrap">
                      <div class="col-md-3" v-for="data_f in data_radio" :key="data_f.id">
                        <div class="custom-control custom-radio mb-3">
                          <input
                            type="radio"
                            name="customRadio"
                            class="custom-control-input"
                            :id="data_f.id" v-model="selected_radio" :value="data_f.id"
                          />
                          <label class="custom-control-label" :for="data_f.id">{{ data_f.text }}</label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <button class="btn btn-primary float-right" type="submit">Gửi Đánh Giá</button>
          </form>
        </div>
      </div>
    </div>
</template>   