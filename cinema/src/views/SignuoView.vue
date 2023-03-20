<template>
   <body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign up</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form @submit.prevent="Register()" >
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" v-model="username" name="username" placeholder="username">
						
					</div>
                    <div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" v-model="Email" name="Email" placeholder="Email">
					</div>
					
					<div class="form-group">
						<button class="btn float-right login_btn">Register</button>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
                    <router-link style="color: red" to="/signin">Sign in</router-link>
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
  name: 'SinguoView',
  data() {
    return {
      username: "",
      Email:"",
      user_id: "",
      ruser_id: ""
    };
  },
  methods: {
    Register() {
      let fd = new FormData();
      fd.append("user_name", this.username);
      fd.append("user_username", this.Email);
     axios({
        method: "post",
        url: "http://localhost/server/Cenima/Users/register",
        data : fd,
      })
        .then((res) => {
            window.location = 'http://localhost:8080/signin';
            this.ruser_id = localStorage.setItem('ruser_id' , res.data)
          console.log(res.data);
        })
        .catch((err) => {
          console.log(err.data);
        });
    },
  },
};
</script>