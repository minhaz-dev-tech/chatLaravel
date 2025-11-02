<template>
  <div class="welcome-container">
    <div class="welcome-box">
      <h1>Welcome to the Chat App</h1>
      <div class="buttons">
        <router-link to="/login" class="btn">Login</router-link>
        <router-link to="/register" class="btn btn-secondary">Register</router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Welcome",
};
</script>

<style scoped>
/* Full screen centered container */
.welcome-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
  padding: 20px;
  box-sizing: border-box;
}

/* Box */
.welcome-box {
  text-align: center;
  background-color: #fff;
  padding: 40px 30px;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  width: 100%;
}

.welcome-box h1 {
  font-size: 26px;
  margin-bottom: 30px;
}

/* Buttons */
.buttons {
  display: flex;
  justify-content: center;
  gap: 15px;
  flex-wrap: wrap;
}

.btn {
  padding: 10px 20px;
  border-radius: 8px;
  text-decoration: none;
  font-weight: 500;
  background-color: #4f46e5;
  color: #fff;
  transition: background-color 0.2s;
}

.btn:hover {
  background-color: #4338ca;
}

.btn-secondary {
  background-color: #6b7280;
}

.btn-secondary:hover {
  background-color: #4b5563;
}

/* Responsive */
@media (max-width: 480px) {
  .welcome-box {
    padding: 30px 20px;
  }
  .welcome-box h1 {
    font-size: 22px;
  }
}
</style>
