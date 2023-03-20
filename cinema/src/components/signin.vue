<template>
  <body>
    <div class="container">
      <div class="d-flex justify-content-center h-100">
        <div class="card">
          <div class="card-header">
            <h3>Sign In</h3>
            <div class="d-flex justify-content-end social_icon">
              <span><i class="fab fa-facebook-square"></i></span>
              <span><i class="fab fa-google-plus-square"></i></span>
              <span><i class="fab fa-twitter-square"></i></span>
            </div>
          </div>
          <div class="card-body">
            <form @submit.prevent="login()">
                <h3>{{ ruser_id }}</h3>
              <div class="input-group form-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"
                    ><i class="fas fa-user"></i
                  ></span>
                </div>
                <input
                  type="text"
                  name="user_id"
                  class="form-control"
                  v-model="username"
                  placeholder="username"
                />
              </div>
              <div class="row align-items-center remember">
                <input type="checkbox" />Remember Me
              </div>
              <div class="form-group">
                <button
                  class="btn float-right login_btn"
                >Login</button>
              </div>
            </form>
          </div>
          <div class="card-footer">
            <div class="d-flex justify-content-center links">
              Don't have an account? <router-link style="color: red" to="/signuo">Sign Up</router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</template>
<script>
import axios from "axios";
export default {
  name: "signin",
  data() {
    return {
      username: "",
      user_id: "",
      ruser_id: localStorage.getItem('ruser_id')
    };
  },
  methods: {
    login() {
      let fd = new FormData();
      fd.append("user_id", this.username);
      axios({
        method: "post",
        url: "http://localhost/server/Cenima/Users/login",
        data : fd,
      })
        .then((res) => {
            window.location = 'http://localhost:8080/film';
            this.user_id = res.data.user_id;
            localStorage.setItem('user_id' , this.user_id)
        //   console.log(res.data);
        })
        .catch((err) => {
          console.log(err.data);
        });
    },
  },
};
</script>


<!-- Add "scoped" attribute to limit CSS to this component only -->

