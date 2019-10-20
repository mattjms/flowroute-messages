<template>
  <v-dialog persistent v-model="dialog" width="400">
    <v-card>
      <v-form @submit.prevent="login">
        <v-card-title>
          <span class="headline">Flowroute API Credentials</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-text-field label="Access Key" autofocus v-model="accessKey" :rules="required"></v-text-field>
            <v-text-field label="Secret Key" type="password" v-model="secretKey" :rules="required"></v-text-field>
            <small>*indicates required field</small>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn type="submit">Login</v-btn>
        </v-card-actions>
      </v-form>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  data() {
    return {
      accessKey: null,
      secretKey: null,
      dialog: true,
      required: [v => !!v || "*Required"]
    };
  },
  methods: {
    login() {
      this.$emit("login", this);
    }
  }
};
</script>