<template>
  <div>
    <p v-if="loading">Loading...</p>
    <table v-else>
      <thead>
        <tr>
          <th>From</th>
          <th>Received</th>
          <th>Message Text</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="message in messages" :key="message.id">
          <td>{{ message.attributes.from }}</td>
          <td>{{ message.attributes.timestamp }}</td>
          <td>{{ message.attributes.body }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
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

      this.client.search(start, end, limit, offset).
      then((results) => {
        this.messages = results
        this.loading = false
      })
    }
  }
};
</script>

<style scope lang="scss">
</style>