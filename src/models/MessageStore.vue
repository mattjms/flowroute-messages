<script>
export default {
  props: {
    client: {
      type: Object
    },
  },
  data() {
    return {
      loading: false,
      error: null,
      data: [],
    };
  },
  watch: {
    client: {
      immediate: true,
      handler: 'load',
    },
  },
  methods: {
    load() {
      let start = "2016-06-03";
      let end = new Date();
      let limit = 25;
      let offset = 0;

      // ensure that only one request is in flight at a time
      if (this.loading || !this.client) return;
      this.loading = true;

      try {
        this.client.search(start, end, limit, offset).then(results => {
          this.data = results;
          this.loading = false;
        });
      } catch (error) {
        this.loading = false;
        this.data = [];
        this.error = error.response;
      }
    },
  },
  render() {
    return this.$scopedSlots.default({
      client: this.client,
      loading: this.loading,
      error: this.error,
      data: this.data,
    });
  },
};
</script>