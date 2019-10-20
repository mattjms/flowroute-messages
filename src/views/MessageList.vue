<template>
  <div>
    <p v-if="loading">Loading...</p>
    <v-timeline v-else>
      <v-timeline-item v-for="message in messages" :key="message.id" :left="message.attributes.direction === 'inbound'">
        <Message :message="message"/>
      </v-timeline-item>
    </v-timeline>
  </div>
</template>

<script>
import Message from "@/components/Message.vue";

export default {
  components: {
    Message
  },
  props: {
    client: null
  },
  data() {
    return {
      loading: true,
      messages: []
    };
  },
  created() {
    if (this.client) {
      let start = "2016-06-03";
      let end = new Date();
      let limit = 100;
      let offset = 0;

      this.client.search(start, end, limit, offset).then(results => {
        this.messages = results;
        this.loading = false;
      });
    }
  }
};
</script>

<style scope lang="scss">
</style>