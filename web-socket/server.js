// server.js
import express from "express";
import http from "http";
import { Server } from "socket.io";
import cors from "cors";

const app = express();
const server = http.createServer(app);

// Allow connections from your Laravel + Vue app
const io = new Server(server, {
  cors: {
    origin: "*", // Replace with your frontend URL, e.g., http://localhost:5173
    methods: ["GET", "POST"],
  },
});

app.use(cors());
app.use(express.json());

let users = {}; // userId -> socketId mapping
let groups = {}; // groupId -> list of socketIds

// For testing
app.get("/", (req, res) => {
  res.send("WebSocket server is running 🚀");
});

// WebSocket Connection
io.on("connection", (socket) => {
  console.log("🟢 A user connected:", socket.id);

  // Store userId and map with socket.id
  socket.on("store_user_id", (userId) => {
    users[userId] = socket.id;
    console.log(`User ${userId} registered with socket ${socket.id}`);
  });

  // Store user in group
  socket.on("join_group", (groupId) => {
    if (!groups[groupId]) groups[groupId] = [];
    groups[groupId].push(socket.id);
    socket.join(groupId);
    console.log(`User joined group ${groupId}`);
  });

  // Private message handler
  socket.on("private_message", (message) => {
    console.log("📩 Private message received:", message);

    const { to_id, from_id } = message;
    const receiverSocketId = users[to_id];

    if (receiverSocketId) {
      io.to(receiverSocketId).emit("private_message", message);
    } else {
      console.log(`⚠️ User ${to_id} is offline`);
    }
  });

  // Group message handler
  socket.on("group_message", (message) => {
    console.log("💬 Group message received:", message);
    const { to_id } = message;
    io.to(to_id).emit("private_message", message); // Send to all in the group room
  });

  // Handle user disconnect
  socket.on("disconnect", () => {
    console.log("🔴 User disconnected:", socket.id);
    for (let userId in users) {
      if (users[userId] === socket.id) {
        delete users[userId];
        console.log(`User ${userId} removed from active list`);
      }
    }
  });
});

// Start server
const PORT = 3000;
server.listen(PORT, () => {
  console.log(`🚀 WebSocket server running on port ${PORT}`);
});
