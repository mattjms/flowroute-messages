<template>
  <div class="login">
    <p>Please enter your Flowroute API Credentials:</p>
    <form @submit.prevent="login">
      <input type="text" v-model="accessKey"/>
      <input type="password" v-model="secretKey"/>
      <button type="submit">Login</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      accessKey: null,
      secretKey: null
    }
  },
  methods: {
    login() {
      this.$emit('login', this)
    }
  }
}
</script>

<style scoped lang="scss">
h1 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
