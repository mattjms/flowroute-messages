<script>
export default {
  props: {
    client: {
      type: Object,
    },
    initialData: {
      type: Object,
    },
  },
  data() {
    return {
      loading: false,
      error: null,
      data: this.initialData,
    };
  },
  methods: {
    load() {
      // ensure that only one request is in flight at a time
      if (this.loading || !this.client) return;
      this.loading = true;

      try {
        this.client.lookup(this.data.id).then(result => {
          if (result.errors){
            console.log(result.errors)
          }else{
            this.data = result;
          }
          this.loading = false;
        });
      } catch (error) {
        this.loading = false;
        this.error = error.response;
      }
    },
  },
  render() {
    return this.$scopedSlots.default({
      data: this.data,
      loading: this.loading,
      error: this.error,
      load: this.load,
    });
  },
};
</script>