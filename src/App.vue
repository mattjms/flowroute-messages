<template>
  <div id="app">
    <h1>Flowroute Messages</h1>
    <MessageList v-if="isAuthenticated" :client="client"/>
    <Login v-else @login="login"/>
  </div>
</template>

<script>
import FlowrouteSMS from 'flowroute-sms'
import Login from '@/views/Login.vue'
import MessageList from '@/views/MessageList.vue'

export default {
  components: {
    Login,
    MessageList
  },
  data() {
    return {
      credentials: {}
    }
  },
  computed: {
    client: function(){
      if (this.credentials.accessKey && this.credentials.secretKey){
        return new FlowrouteSMS(
          this.credentials.accessKey,
          this.credentials.secretKey
        )
      }else{
        return null
      }
    },
    isAuthenticated: function(){
      return(this.client !== null)
    }
  },
  methods: {
    login(credentials) {
      this.credentials = credentials
    }
  }
}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
