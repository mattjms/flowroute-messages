<template>
  <div>
    <p v-if="store.loading">Loading...</p>
    <v-timeline v-else>
      <v-timeline-item v-for="message in store.data" :key="message.id" :left="message.attributes.direction === 'inbound'">
        <span slot="opposite">{{ message.attributes.timestamp }}</span>
        <MessageModel :client="store.client" :initialData="message">
          <template v-slot="messageModel">
            <Message :message="messageModel"/>
          </template>
        </MessageModel>
      </v-timeline-item>
    </v-timeline>
  </div>
</template>

<script>
import MessageModel from "@/models/MessageModel.vue";
import Message from "@/components/Message.vue";

export default {
  components: {
    MessageModel,
    Message,
  },
  props: {
    store: Object,
  },
};
</script>