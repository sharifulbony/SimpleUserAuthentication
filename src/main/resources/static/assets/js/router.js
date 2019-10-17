var routes = [
    {
        path: '/unauthorized',
        component: Unauthorized
    },
    {
        path: '/dashboard',
        component: Dashboard,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/login',
        component: LoginForm
    },
    {
        path: '*',
        redirect: '/login'
    }
];

var router = new VueRouter({
    routes
});

router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.requiresAuth) && !Auth.loggedIn) {
        // debugger;
        checkToken();
        if (validToken) {
            next();
        } else {

            // next({path: '/login', query: {redirect: to.fullPath}});
            next({path: '/about', query: {redirect: to.fullPath}});
        }
    } else {
        next();
    }
});