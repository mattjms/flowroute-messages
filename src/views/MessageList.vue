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
    loading: Boolean,
    error: String,
    messages: Array,
  },
  data() {
    return {
    };
  },
};
</script>

<style scope lang="scss">
</style>