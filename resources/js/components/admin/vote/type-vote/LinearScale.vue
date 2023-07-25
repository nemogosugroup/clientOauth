<template>
  <div class="linear-scale">
    <div class="scale-inputs">
      <a
        href="javascript:void(0);"
        v-for="(valueItem, index) in valueItems"
        :key="index"
        :class="{ active: currentValue === valueItem.value }"
        @click="setCurrentValue(valueItem.value)"
      >
        {{ valueItem.value }}
      </a>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    minValue: {
      type: Number,
      default: 0,
    },
    maxValue: {
      type: Number,
      default: 100,
    },
    step: {
      type: Number,
      default: 1,
    },
    initialValue: {
      type: Number,
      default: 50,
    },
  },
  data() {
    return {
      valueItems: [],
      currentValue: this.initialValue,
    };
  },
  watch: {
    // Nếu giá trị tối thiểu (minValue) hoặc giá trị tối đa (maxValue) thay đổi,
    // ta cập nhật lại danh sách các giá trị cho Linear Scale.
    minValue: "generateValueItems",
    maxValue: "generateValueItems",
  },
  mounted() {
    // Khởi tạo danh sách các giá trị cho Linear Scale khi component được tạo.
    this.generateValueItems();
  },
  methods: {
    generateValueItems() {
      this.valueItems = [];
      for (let value = this.minValue; value <= this.maxValue; value += this.step) {
        this.valueItems.push({ value });
      }
      this.setCurrentValue(this.currentValue);
    },
    setCurrentValue(value) {
      // Giới hạn giá trị currentValue trong khoảng minValue và maxValue
      this.currentValue = Math.min(Math.max(value, this.minValue), this.maxValue);
      // Gửi giá trị currentValue lên component cha (nếu cần)
      this.$emit("input", this.currentValue);
    },

    updateScaleValue(newValue) {
      this.scaleValue = newValue;
      this.$emit('input', newValue);
    },
  },
};
</script>

<style>
.linear-scale {
  display: flex;
  align-items: center;
}

.scale-inputs {
  display: flex;
}

.linear-scale a {
  margin-right: 5px;
  padding: 5px;
  border: 2px solid #ccc;
  border-radius: 5px;
  background-color: #fff;
  cursor: pointer;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
  width: 40px;
  height: 40px;
  text-align: center;
  font-size: 18px;
  color: #414141;
}

.linear-scale a.active {
  background-color: #5664d2;
  color: #fff;
  font-weight: bold;
  border-color: #5664d2;
}

.current-value {
  font-weight: bold;
}
</style>
