<template>
  <div class="login-container">
    <div class="login-box">
      <h2>Login</h2>
      <form @submit.prevent="login">
        <div class="form-group">
          <label for="email">Email</label>
          <input
            type="email"
            id="email"
            v-model="email"
            required
            placeholder="Enter your email"
          />
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input
            type="password"
            id="password"
            v-model="password"
            required
            placeholder="Enter your password"
          />
        </div>
        <button type="submit" class="login-btn">Login</button>
      </form>
      <p class="register-text">
        Don’t have an account?
        <router-link to="/register">Register</router-link>
      </p>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Login",
  data() {
    return {
      email: "",
      password: "",
    };
  },
  methods: {
    async login() {
      try {
        const response = await axios.post("/login", {
          email: this.email,
          password: this.password,
        });

        localStorage.setItem("access_token_employer", response.data.access_token);
        this.$router.push("/chat");
      } catch (error) {
        alert("Invalid credentials");
      }
    },
  },
};
</script>

<style scoped>
/* Container centered vertically & horizontally */
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
  padding: 20px;
  box-sizing: border-box;
}

/* Login box */
.login-box {
  background-color: #fff;
  padding: 30px 25px;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
  box-sizing: border-box;
}

.login-box h2 {
  text-align: center;
  margin-bottom: 20px;
  font-size: 24px;
}

/* Form groups */
.form-group {
  margin-bottom: 15px;
  display: flex;
  flex-direction: column;
}

.form-group label {
  margin-bottom: 5px;
  font-weight: 500;
}

.form-group input {
  padding: 10px 12px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
}

/* Login button */
.login-btn {
  width: 100%;
  padding: 10px 0;
  background-color: #4f46e5; /* Indigo color */
  color: #fff;
  border: none;
  border-radius: 6px;
  font-size: 16px;
  cursor: pointer;
  margin-top: 10px;
}

.login-btn:hover {
  background-color: #4338ca;
}

/* Register text */
.register-text {
  text-align: center;
  margin-top: 15px;
  font-size: 14px;
}

.register-text a {
  color: #4f46e5;
  text-decoration: none;
}

.register-text a:hover {
  text-decoration: underline;
}

/* Responsive */
@media (max-width: 480px) {
  .login-box {
    padding: 25px 20px;
  }
  .login-box h2 {
    font-size: 20px;
  }
}
</style>
