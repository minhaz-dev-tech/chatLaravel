import { createRouter, createWebHistory } from 'vue-router';
import Welcome from '../components/Welcome.vue';
import Login from '../components/Login.vue';
import Register from '../components/Register.vue';
import Chat from '../components/Chat.vue';

const routes = [
    { path: '/', name: 'welcome', component: Welcome },
    { path: '/login', name: 'login', component: Login },
    { path: '/register', name: 'register', component: Register },
    {
        path: '/chat',
        name: 'chat',
        component: Chat,
        meta: { requiresAuth: true }
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

// Middleware check
router.beforeEach((to, from, next) => {
    const token = localStorage.getItem('access_token_employer');

    if (to.meta.requiresAuth && !token) {
        next('/login');
    } else if ((to.path === '/login' || to.path === '/register') && token) {
        next('/chat');
    } else {
        next();
    }
});

export default router;
