<template>
  <div class="register-container">
    <div class="register-box">
      <h2>Register</h2>
      <form @submit.prevent="register">
        <div class="form-group">
          <label for="name">Name</label>
          <input
            type="text"
            id="name"
            v-model="name"
            placeholder="Enter your name"
            required
          />
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input
            type="email"
            id="email"
            v-model="email"
            placeholder="Enter your email"
            required
          />
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input
            type="password"
            id="password"
            v-model="password"
            placeholder="Enter your password"
            required
          />
        </div>
        <div class="form-group">
          <label for="password_confirmation">Confirm Password</label>
          <input
            type="password"
            id="password_confirmation"
            v-model="password_confirmation"
            placeholder="Confirm your password"
            required
          />
        </div>
        <button type="submit" class="register-btn">Register</button>
      </form>
      <p class="login-text">
        Already have an account?
        <router-link to="/login">Login</router-link>
      </p>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Register",
  data() {
    return {
      name: "",
      email: "",
      password: "",
      password_confirmation: "",
    };
  },
  methods: {
    async register() {
      try {
        const response = await axios.post("/register", {
          name: this.name,
          email: this.email,
          password: this.password,
          password_confirmation: this.password_confirmation,
        });

        localStorage.setItem("access_token_employer", response.data.access_token);
        this.$router.push("/chat");
      } catch (error) {
        alert("Registration failed");
      }
    },
  },
};
</script>

<style scoped>
/* Container centered vertically & horizontally */
.register-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
  padding: 20px;
  box-sizing: border-box;
}

/* Box */
.register-box {
  background-color: #fff;
  padding: 30px 25px;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
  box-sizing: border-box;
}

.register-box h2 {
  text-align: center;
  margin-bottom: 20px;
  font-size: 24px;
}

/* Form group */
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

/* Button */
.register-btn {
  width: 100%;
  padding: 10px 0;
  background-color: #4f46e5;
  color: #fff;
  border: none;
  border-radius: 6px;
  font-size: 16px;
  cursor: pointer;
  margin-top: 10px;
}

.register-btn:hover {
  background-color: #4338ca;
}

/* Login text */
.login-text {
  text-align: center;
  margin-top: 15px;
  font-size: 14px;
}

.login-text a {
  color: #4f46e5;
  text-decoration: none;
}

.login-text a:hover {
  text-decoration: underline;
}

/* Responsive */
@media (max-width: 480px) {
  .register-box {
    padding: 25px 20px;
  }
  .register-box h2 {
    font-size: 20px;
  }
}
</style>
