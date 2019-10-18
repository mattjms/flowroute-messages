<template>
  <v-app id="app">
    <v-navigation-drawer app clipped permanent>
      <v-list dense>
        <v-list-item @click="selectConversation">
          <v-list-item-action>
            <v-icon>mdi-view-dashboard</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>All Messages</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item @click="selectConversation">
          <v-list-item-action>
            <v-icon>mdi-settings</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>(dynamic)</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app clipped-left>
      <v-toolbar-title>Flowroute Messages</v-toolbar-title>
    </v-app-bar>

    <v-content>
      <v-container class="fill-height" fluid>
        <MessageList v-if="isAuthenticated" :client="client" />
        <div v-else>
          <v-overlay opacity="0.7"></v-overlay>
          <Login @login="login"/>
        </div>
      </v-container>
    </v-content>

    <v-footer app>
      <span>&copy; 2019</span>
    </v-footer>
  </v-app>
</template>

<script>
import FlowrouteSMS from "flowroute-sms";
import Login from "@/views/Login.vue";
import MessageList from "@/views/MessageList.vue";

export default {
  name: "App",
  components: {
    Login,
    MessageList
  },
  props: {
    source: String
  },

  data: () => ({
    credentials: {},
  }),

  created() {
    this.$vuetify.theme.dark = true;
  },
  computed: {
    client: function() {
      if (this.credentials.accessKey && this.credentials.secretKey) {
        return new FlowrouteSMS(
          this.credentials.accessKey,
          this.credentials.secretKey
        );
      } else {
        return null;
      }
    },
    isAuthenticated: function() {
      return this.client !== null;
    }
  },
  methods: {
    login(credentials) {
      this.credentials = credentials;
    },
    selectConversation() {}
  }
};
</script>