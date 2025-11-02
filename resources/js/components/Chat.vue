<template>
  <div class="chat-app" v-if="user">
    <!-- ===== Sidebar ===== -->
    <aside class="sidebar">
      <div class="logo">
        <div class="logo-icon">💬</div>
        <div class="logo-text">Chat</div>
      </div>

      <!-- User Profile -->
      <div class="user-profile">
        <div class="avatar">
          <img v-if="user.avatar" :src="user.avatar" alt="Avatar" />
          <div v-else>{{ user.name.charAt(0).toUpperCase() }}</div>
        </div>
        <div class="user-name">{{ user.name }}</div>
        <div class="user-email">{{ user.email }}</div>
        <button class="logout-btn" @click="logout">Logout</button>
      </div>

      <!-- Users -->
      <div class="sidebar-section">
        <div class="section-header">
          <span>Users</span>
          <span class="count">{{ users.length }}</span>
        </div>
        <div class="section-list">
          <button
            v-for="u in users"
            :key="u.id"
            @click="selectUser(u)"
            :class="['item', selectedUser && selectedUser.id === u.id ? 'active' : '']"
          >
            <div class="item-avatar">{{ u.name.charAt(0).toUpperCase() }}</div>
            <div class="item-name">{{ u.name }}</div>
          </button>
        </div>
      </div>

      <!-- Groups -->
      <!-- <div class="sidebar-section">
        <div class="section-header">
          <span>Groups</span>
          <span class="count">{{ groups.length }}</span>
          <button class="create-group-btn" @click="createGroup">＋</button>
        </div>
        <div class="section-list">
          <button
            v-for="group in groups"
            :key="group.id"
            @click="selectGroup(group)"
            :class="[
              'item',
              selectedGroup && selectedGroup.id === group.id ? 'active' : '',
            ]"
          >
            <div class="item-avatar">{{ group.name.charAt(0).toUpperCase() }}</div>
            <div class="item-name">{{ group.name }}</div>
          </button>
        </div>
      </div> -->
    </aside>

    <!-- ===== Chat Area ===== -->
    <main class="chat-area">
      <div class="chat-header">
        <h2 v-if="selectedUser || selectedGroup">
          {{ selectedUser ? selectedUser.name : selectedGroup.name }}
        </h2>
        <span v-else>Select a chat</span>
      </div>

      <div class="messages" ref="messageContainer">
        <div
          v-for="msg in messages"
          :key="msg.id"
          :class="[
            'message',
            msg.from_id === user.id ? 'sent' : 'received',
            msg.is_group ? 'group-message' : '',
          ]"
        >
          <div class="avatar">
            {{ msg.sender ? msg.sender.name.charAt(0).toUpperCase() : "?" }}
          </div>
          <div class="message-content">
            <div class="text">{{ msg.message }}</div>

            <!-- Attachment -->
            <div v-if="msg.attachment" class="attachment">
              <a
                :href="msg.attachment_url || '/storage/' + msg.attachment"
                target="_blank"
              >
                <img
                  v-if="isImage(msg.attachment)"
                  :src="msg.attachment_url || '/storage/' + msg.attachment"
                  class="attachment-image"
                />
                <span v-else class="attachment-file">{{
                  msg.attachment.split("/").pop()
                }}</span>
              </a>
            </div>

            <div class="timestamp">{{ formatTime(msg.created_at) }}</div>
          </div>
        </div>
      </div>

      <!-- Input Area -->
      <div class="input-area">
        <input type="file" @change="handleFileUpload" />
        <input
          type="text"
          v-model="newMessage"
          placeholder="Type a message..."
          @keyup.enter="sendMessage"
        />
        <button @click="sendMessage">Send</button>
      </div>
    </main>
  </div>
</template>

<script>
import axios from "axios";
import io from "socket.io-client";

export default {
  name: "Chat",
  data() {
    return {
      user: null,
      users: [],
      groups: [],
      messages: [],
      newMessage: "",
      selectedUser: null,
      selectedGroup: null,
      socket: null,
      attachment: null,
    };
  },
  methods: {
    async fetchUser() {
      try {
        const response = await axios.get("/user");
        this.user = response.data;
      } catch {
        this.logout();
      }
    },
    async getUsers() {
      const response = await axios.get("/users");
      this.users = response.data.filter((u) => u.id !== this.user.id);
    },
    async getGroups() {
      const response = await axios.get("/groups");
      this.groups = response.data;
    },
    async getMessages() {
      if (!this.selectedUser && !this.selectedGroup) return;
      let url = this.selectedUser
        ? `/messages/${this.selectedUser.id}`
        : `/messages/${this.selectedGroup.id}?is_group=1`;

      const response = await axios.get(url);
      this.messages = response.data;
      this.$nextTick(() => this.scrollToBottom());
    },
    scrollToBottom() {
      const container = this.$refs.messageContainer;
      if (container) container.scrollTop = container.scrollHeight;
    },
    handleFileUpload(event) {
      this.attachment = event.target.files[0];
    },
    isImage(url) {
      return url.match(/\.(jpeg|jpg|png|gif)$/i);
    },
    formatTime(date) {
      if (!date) return "";
      const d = new Date(date);
      return d.toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" });
    },
    async sendMessage() {
      if (!this.newMessage.trim() && !this.attachment) return;
      if (!this.selectedUser && !this.selectedGroup) return alert("Select a chat first.");

      const formData = new FormData();
      formData.append(
        "to_id",
        this.selectedUser ? this.selectedUser.id : this.selectedGroup.id
      );
      formData.append("message", this.newMessage);
      formData.append("is_group", this.selectedGroup ? 1 : 0);
      if (this.attachment) formData.append("attachment", this.attachment);

      const response = await axios.post("/messages", formData, {
        headers: { "Content-Type": "multipart/form-data" },
      });

      if (response.data.attachment) {
        response.data.attachment_url =
          response.data.attachment_url || `/storage/${response.data.attachment}`;
      }

      this.messages.push(response.data);
      this.newMessage = "";
      this.attachment = null;
      this.scrollToBottom();

      if (this.socket)
        this.socket.emit(
          this.selectedGroup ? "group_message" : "private_message",
          response.data
        );
    },
    async createGroup() {
      // Step 1: Prompt for group name
      const name = prompt("Enter group name:");
      if (!name) return;

      // Step 2: Show available users with ID and Name
      const userList = this.users.map((u) => `${u.id}: ${u.name}`).join("\n");

      const selectedUserIds = prompt(
        `Enter user IDs separated by comma (Available Users):\n${userList}`
      );

      if (!selectedUserIds) return;

      // Convert to array of integers
      const user_ids = selectedUserIds.split(",").map((id) => parseInt(id.trim()));

      try {
        const response = await axios.post("/groups", { name, user_ids });
        this.groups.push(response.data);
        alert("Group created with selected users!");
      } catch (err) {
        console.error(err);
        alert("Failed to create group");
      }
    },

    selectUser(user) {
      this.selectedUser = user;
      this.selectedGroup = null;
      this.getMessages();
    },
    selectGroup(group) {
      this.selectedGroup = group;
      this.selectedUser = null;
      this.getMessages();
    },
    logout() {
      localStorage.removeItem("access_token_employer");
      this.$router.push("/login");
    },
  },
  async created() {
    await this.fetchUser();
    await this.getUsers();
    await this.getGroups();

    // Socket.io
    this.socket = io("http://localhost:3000");
    this.socket.on("connect", () => {
      this.socket.emit("store_user_id", this.user.id);
    });

    this.socket.on("private_message", (message) => {
      if (this.selectedUser && message.from_id === this.selectedUser.id) {
        this.messages.push(message);
        this.$nextTick(() => this.scrollToBottom());
      }
    });

    this.socket.on("group_message", (message) => {
      if (this.selectedGroup && message.to_id === this.selectedGroup.id) {
        this.messages.push(message);
        this.$nextTick(() => this.scrollToBottom());
      }
    });
  },
};
</script>

<style scoped>
/* ===== General Styles ===== */
.chat-app {
  display: flex;
  height: 100vh;
  font-family: "Inter", sans-serif;
  background: #f9fafb;
  color: #1f2937;
}

/* ===== Sidebar ===== */
.sidebar {
  width: 280px;
  background: #fff;
  border-right: 1px solid #e5e7eb;
  display: flex;
  flex-direction: column;
  padding: 16px;
  overflow-y: auto;
}
.logo {
  display: flex;
  align-items: center;
  gap: 10px;
  font-weight: 700;
  font-size: 20px;
  color: #4f46e5;
  margin-bottom: 24px;
}
.user-profile {
  background: #f3f4f6;
  border-radius: 12px;
  padding: 16px;
  text-align: center;
  margin-bottom: 24px;
}
.user-profile .avatar img {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  object-fit: cover;
}
.logout-btn {
  background: #ef4444;
  color: #fff;
  border: none;
  padding: 6px 12px;
  border-radius: 8px;
  cursor: pointer;
}
.logout-btn:hover {
  background: #dc2626;
}

/* ===== Sidebar Sections ===== */
.sidebar-section {
  margin-bottom: 20px;
}
.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: 600;
  margin-bottom: 8px;
}
.count {
  background: #e5e7eb;
  border-radius: 12px;
  padding: 2px 8px;
  font-size: 12px;
}
.section-list {
  display: flex;
  flex-direction: column;
  gap: 6px;
}
.item {
  display: flex;
  align-items: center;
  gap: 10px;
  background: #f9fafb;
  border-radius: 10px;
  padding: 8px 10px;
  cursor: pointer;
  border: 1px solid transparent;
}
.item.active {
  background: #e0e7ff;
  border-color: #6366f1;
}
.item-avatar {
  background: #6366f1;
  color: #fff;
  width: 32px;
  height: 32px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 600;
}
.item-name {
  font-size: 15px;
}
.create-group-btn {
  background: #4f46e5;
  color: white;
  border: none;
  border-radius: 50%;
  width: 22px;
  height: 22px;
  font-size: 14px;
  cursor: pointer;
}
.create-group-btn:hover {
  background: #3730a3;
}

/* ===== Chat Area ===== */
.chat-area {
  flex: 1;
  display: flex;
  flex-direction: column;
  background: #f3f4f6;
}
.chat-header {
  background: #fff;
  padding: 14px 20px;
  border-bottom: 1px solid #e5e7eb;
  font-weight: 600;
  display: flex;
  align-items: center;
}
.messages {
  flex: 1;
  overflow-y: auto;
  padding: 20px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  scroll-behavior: smooth;
}
.message {
  display: flex;
  align-items: flex-end;
  gap: 10px;
}
.message.sent {
  flex-direction: row-reverse;
}
.message-content {
  max-width: 70%;
  padding: 10px 14px;
  border-radius: 16px;
  background: #fff;
  word-wrap: break-word;
}
.message.sent .message-content {
  background: #6366f1;
  color: #fff;
}
.message .avatar {
  width: 34px;
  height: 34px;
  border-radius: 50%;
  background: #9ca3af;
  color: #fff;
  font-weight: 600;
  display: flex;
  align-items: center;
  justify-content: center;
}
.timestamp {
  font-size: 11px;
  color: #9ca3af;
  margin-top: 4px;
  text-align: right;
}
.attachment img {
  max-width: 180px;
  border-radius: 8px;
  border: 1px solid #e5e7eb;
}
.attachment-file {
  background: #f3f4f6;
  border-radius: 6px;
  padding: 4px 8px;
  font-size: 13px;
  display: inline-block;
}

/* ===== Input ===== */
.input-area {
  display: flex;
  align-items: center;
  gap: 8px;
  background: #fff;
  padding: 12px 16px;
  border-top: 1px solid #e5e7eb;
}
.input-area input[type="text"] {
  flex: 1;
  border: 1px solid #d1d5db;
  border-radius: 20px;
  padding: 8px 14px;
  outline: none;
}
.input-area input[type="file"] {
  font-size: 13px;
  color: #6b7280;
}
.input-area button {
  background: #4f46e5;
  color: #fff;
  border: none;
  border-radius: 20px;
  padding: 8px 18px;
  cursor: pointer;
}
.input-area button:hover {
  background: #3730a3;
}
</style>
