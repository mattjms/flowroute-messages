<template>
  <v-card>
    <v-img v-if="message.data.attributes.has_mms" :src="imageSrc"/>
    <v-card-title>{{ message.data.attributes.from }}</v-card-title>
    <v-card-text>{{ message.data.attributes.body }}</v-card-text>
  </v-card>
</template>

<script>
export default {
  props: {
    message: Object,
  },
  created() {
    if (this.message.data.attributes.has_mms){
      this.message.load() // we wish this would give us the attached images!
    }
  },
  computed: {
    imageSrc() {
      return ''
    },
  },
}
</script>