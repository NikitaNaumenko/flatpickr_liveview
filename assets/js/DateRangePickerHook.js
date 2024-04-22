import flatpickr from "flatpickr";

export default {
  mounted() {
    const defaultDates = JSON.parse(this.el.dataset.defaultDates);
    this.pickr = flatpickr(this.el, {
      maxDate: "today",
      dateFormat: "Y-m-d",
      mode: "range",
      defaultDate: defaultDates,
    });
  },

  destroyed() {
    this.pickr.destroy();
  },
};
