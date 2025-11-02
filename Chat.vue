<template>
    <div class="flex h-screen antialiased text-gray-800">
        <div class="flex flex-row h-full w-full overflow-x-hidden">
            <div class="flex flex-col py-8 pl-6 pr-2 w-64 bg-white flex-shrink-0">
                <div class="flex flex-row items-center justify-center h-12 w-full">
                    <div class="flex items-center justify-center rounded-2xl text-indigo-700 bg-indigo-100 h-10 w-10">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"></path>
                        </svg>
                    </div>
                    <div class="ml-2 font-bold text-2xl">Chat</div>
                </div>
                <div class="flex flex-col items-center bg-indigo-100 border border-gray-200 mt-4 w-full py-6 px-4 rounded-lg">
                    <div class="h-20 w-20 rounded-full border overflow-hidden">
                        <img src="https://avatars3.githubusercontent.com/u/2763884?s=128" alt="Avatar" class="h-full w-full" />
                    </div>
                    <div class="text-sm font-semibold mt-2">{{ user.name }}</div>
                    <div class="text-xs text-gray-500">Lead UI/UX Designer</div>
                </div>
                <div class="flex flex-col mt-8">
                    <div class="flex flex-row items-center justify-between text-xs">
                        <span class="font-bold">Users</span>
                        <span class="flex items-center justify-center bg-gray-300 h-4 w-4 rounded-full">{{ users.length }}</span>
                    </div>
                    <div class="flex flex-col space-y-1 mt-4 -mx-2 h-48 overflow-y-auto">
                        <button v-for="user in users" :key="user.id" @click="selectUser(user)" class="flex flex-row items-center hover:bg-gray-100 rounded-xl p-2">
                            <div class="flex items-center justify-center h-8 w-8 bg-indigo-200 rounded-full">{{ user.name.charAt(0) }}</div>
                            <div class="ml-2 text-sm font-semibold">{{ user.name }}</div>
                        </button>
                    </div>
                    <div class="flex flex-row items-center justify-between text-xs mt-6">
                        <span class="font-bold">Groups</span>
                        <span class="flex items-center justify-center bg-gray-300 h-4 w-4 rounded-full">{{ groups.length }}</span>
                    </div>
                    <div class="flex flex-col space-y-1 mt-4 -mx-2 h-48 overflow-y-auto">
                        <button v-for="group in groups" :key="group.id" @click="selectGroup(group)" class="flex flex-row items-center hover:bg-gray-100 rounded-xl p-2">
                            <div class="flex items-center justify-center h-8 w-8 bg-indigo-200 rounded-full">{{ group.name.charAt(0) }}</div>
                            <div class="ml-2 text-sm font-semibold">{{ group.name }}</div>
                        </button>
                    </div>
                </div>
            </div>
            <div class="flex flex-col flex-auto h-full p-6">
                <div class="flex flex-col flex-auto flex-shrink-0 rounded-2xl bg-gray-100 h-full p-4">
                    <div class="flex flex-col h-full overflow-x-auto mb-4">
                        <div class="flex flex-col h-full">
                            <div class="grid grid-cols-12 gap-y-2">
                                <div v-for="message in messages" :key="message.id" :class="message.from_id === user.id ? 'col-start-6 col-end-13' : 'col-start-1 col-end-8'" class="p-3 rounded-lg">
                                    <div :class="message.from_id === user.id ? 'flex items-center justify-start flex-row-reverse' : 'flex flex-row items-center'">
                                        <div class="flex items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">{{ message.from.name.charAt(0) }}</div>
                                        <div :class="message.from_id === user.id ? 'relative mr-3 text-sm bg-indigo-100 py-2 px-4 shadow rounded-xl' : 'relative ml-3 text-sm bg-white py-2 px-4 shadow rounded-xl'">
                                            <div>{{ message.message }}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="flex flex-row items-center h-16 rounded-xl bg-white w-full px-4">
                        <div>
                            <button class="flex items-center justify-center text-gray-400 hover:text-gray-600">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.414a4 4 0 00-5.656-5.656l-6.415 6.415a6 6 0 108.486 8.486L20.5 13"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="flex-grow ml-4">
                            <div class="relative w-full">
                                <input type="text" v-model="newMessage" @keyup.enter="sendMessage" class="flex w-full border rounded-xl focus:outline-none focus:border-indigo-300 pl-4 h-10" />
                            </div>
                        </div>
                        <div class="ml-4">
                            <button @click="sendMessage" class="flex items-center justify-center bg-indigo-500 hover:bg-indigo-600 rounded-xl text-white px-4 py-1 flex-shrink-0">
                                <span>Send</span>
                                <span class="ml-2">
                                    <svg class="w-4 h-4 transform rotate-45 -mt-px" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path>
                                    </svg>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import io from 'socket.io-client';

export default {
    name: "Chat",
    data() {
        return {
            user: {},
            users: [],
            groups: [],
            messages: [],
            newMessage: "",
            selectedUser: null,
            selectedGroup: null,
            socket: null,
        };
    },
    methods: {
        async getUsers() {
            const response = await axios.get("/api/users");
            this.users = response.data;
        },
        async getGroups() {
            const response = await axios.get("/api/groups");
            this.groups = response.data;
        },
        async getMessages() {
            if (this.selectedUser) {
                const response = await axios.get(`/api/messages/${this.selectedUser.id}`);
                this.messages = response.data;
            } else if (this.selectedGroup) {
                const response = await axios.get(`/api/messages/${this.selectedGroup.id}?is_group=1`);
                this.messages = response.data;
            }
        },
        async sendMessage() {
            if (this.newMessage.trim() === "") return;

            const message = {
                to_id: this.selectedUser ? this.selectedUser.id : this.selectedGroup.id,
                message: this.newMessage,
                is_group: !!this.selectedGroup,
            };

            const response = await axios.post("/api/messages", message);
            this.messages.push(response.data);
            this.newMessage = "";

            this.socket.emit("private_message", response.data);
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
    },
    created() {
        this.user = window.user;
        this.getUsers();
        this.getGroups();

        this.socket = io("http://localhost:3000");

        this.socket.on("connect", () => {
            this.socket.emit("store_user_id", this.user.id);
        });

        this.socket.on("private_message", (message) => {
            this.messages.push(message);
        });
    },
};
</script>
