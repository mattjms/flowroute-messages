<template>
  <v-card>
    <v-card-title>{{ message.attributes.from }}</v-card-title>
    <v-card-subtitle>{{ message.attributes.timestamp }}</v-card-subtitle>
    <v-card-text>{{ message.attributes.body }}</v-card-text>
  </v-card>
</template>

<script>
export default {
  props: {
    message: Object,
  },
}
</script>