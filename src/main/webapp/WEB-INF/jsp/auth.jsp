<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->


<head>
    <meta charset="utf-8"/>
    <title>Simple Authentication Application</title>
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css" rel="stylesheet">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <%--    <link rel="stylesheet" href="https://unpkg.com/vue-multiselect@2.1.0/dist/vue-multiselect.min.css">--%>

    <style>
        table.v-table tbody td,
        table.v-table tbody th {
            height: 19px;
        }
    </style>

    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.2.6/vue.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.16.1/axios.min.js"></script>
    <script src="https://unpkg.com/vue-multiselect@2.1.0"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>
    <script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>


</head>
<body>
<div id="app">

    <v-app id="inspire">

        <v-card v-if="showMenu"
                color="grey lighten-4"
                flat
                height="100px"
                tile>
            <v-toolbar dense dark>
                <v-app-bar-nav-icon></v-app-bar-nav-icon>

                <v-toolbar-title>Simple Authentication System</v-toolbar-title>

                <div class="flex-grow-1"></div>

                <v-btn icon>
                    <v-icon>mdi-magnify</v-icon>
                </v-btn>

                <v-btn icon>
                    <v-icon>mdi-heart</v-icon>
                </v-btn>

                <v-btn icon dark>
                    <v-icon>mdi-dots-vertical</v-icon>
                </v-btn>
            </v-toolbar>
        </v-card>

        <v-card>
            <v-alert
                    style="z-index: 50;margin-left: 5%!important;margin-right: 5%!important;margin-top: -10%!important;"
                    v-model="alert"
                    border="left"
                    close-text="Close Alert"
                    color="deep-purple accent-4"
                    elevation="5"
                    dark
                    dismissible
            >

                {{errorMessage}}
            </v-alert>

        </v-card>

        <v-dialog v-model="dialog" max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="headline">User Registration</span>
                </v-card-title>

                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols="12" sm="6" md="12">
                                <v-text-field
                                        v-model="user.firstName"
                                        label="First Name: "
                                        :rules="nameRules"
                                        required
                                >

                                </v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col cols="12" sm="6" md="12">
                                <v-text-field
                                        v-model="user.lastName"
                                        label="Last Name: "
                                        :rules="nameRules"
                                        required
                                >

                                </v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col cols="12" sm="6" md="12">
                                <v-text-field
                                        v-model="user.email"
                                        label="Email: "
                                        :rules="emailRules"
                                        required
                                ></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col cols="12" sm="6" md="12">
                                <v-text-field
                                        v-model="user.personalCode"
                                        label="Personal Code: "
                                <%--                                        :rules="emailRules"--%>
                                        required
                                ></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col cols="12" sm="6" md="12">
                                <v-text-field
                                        :append-icon="show ? 'visibility' : 'visibility_off'"
                                        :rules="[rules.required, rules.min]"
                                        :type="show ? 'text' : 'password'"
                                        name="input-10-2"
                                        label="Password: "
                                        hint="At least 8 characters"
                                        v-model="user.password"
                                        class="input-group--focused"
                                        @click:append="show = !show"
                                ></v-text-field>
                            </v-col>
                        </v-row>

                        <v-row justify="space-around">
                            <v-col cols="12" sm="6" md="12">


                                <v-menu
                                        v-model="menu2"
                                        :close-on-content-click="false"
                                        :nudge-right="40"
                                        transition="scale-transition"
                                        offset-y
                                        min-width="290px"
                                >
                                    <template v-slot:activator="{ on }">
                                        <v-text-field
                                                v-model="user.birthDate"
                                                label="Birth Date: "
                                                prepend-icon="event"
                                                readonly
                                                v-on="on"
                                                required
                                        ></v-text-field>
                                    </template>
                                    <v-date-picker
                                            v-model="user.birthDate"
                                            @input="menu2 = false"

                                    >

                                    </v-date-picker>
                                </v-menu>
                            </v-col>
                        </v-row>

                    </v-container>
                </v-card-text>

                <v-card-actions>
                    <div class="flex-grow-1"></div>
                    <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
                    <v-btn color="blue darken-1" text @click="save">Save</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>


<%--        <v-row>--%>

<%--            <v-col v-if="registerButton">--%>
<%--                <div class="text-center">--%>
<%--                    <v-btn--%>
<%--                            class="Primary"--%>
<%--                            dark--%>
<%--                            @click="register"--%>
<%--                    >--%>
<%--                        Register--%>
<%--                    </v-btn>--%>

<%--                </div>--%>
<%--            </v-col>--%>
<%--        </v-row>--%>


        <p>
<%--            <router-link to="/about">About</router-link>--%>
<%--            <router-link to="/dashboard">Dashboard</router-link>--%>

        </p>
        <router-view></router-view>


    </v-app>


    <%--    <v-footer color="indigo" app inset>--%>
    <%--            <span class="white--text">&copy; Developed By:--%>
    <%--                <a style="color:red;" href="https://www.linkedin.com/in/bonyshariful">A K M Shariful Islam--%>
    <%--                </a>--%>
    <%--            </span>--%>
    <%--    </v-footer>--%>


</div>


<script>


</script>

<%--<script src="/assets/js/app.js"></script>--%>

<script>
    var Unauthorized = {
        template: '<div>' +
            '<h1>' +
            'expired</h1>' +
            '<v-btn\n' +
            '                        class="Primary"\n' +
            '                        dark\n' +
            '                        @click="renew()"\n' +
            '                >\n' +
            '                    renew' +
            '</v-btn>' +
            '</div>',

        methods:{
            renew(){
                if (localStorage.getItem("token")) {
                    axios.get('/renew-token', {
                        headers: {
                            Authorization: 'Bearer ' + localStorage.getItem("token")
                        },
                    }).then(function (result) {
                        localStorage.setItem("token", result.data.token);
                        Auth.login();
                        router.push("/dashboard");
                        validToken = true;

                    }).catch(function (error) {
                        debugger;
                        // vue.alert = true;
                        // this.validToken=false;
                        // vue.errorMessage = error.response.data.message;
                        // app.expirationMessage = error.response.data.message;
                        router.push("/login");

                    });


                } else {
                    router.push("/login");
                }

            },
        }




    };
    var Dashboard = {
        // template: '<h1>Dashboard</h1>',
        template: `
        <v-card>

            <v-data-table
                    style="margin-left: 5%!important;margin-right: 5%!important;margin-top: 5%!important;"
                    :headers="headers"
                    :search="search"
                    :dark="true"
                    :items="userInfo"
                    :items-per-page="1"

                    multi-sort
                    class="elevation-1"
            >

                <template v-slot:top>
                    <v-toolbar flat color="red">
                        <v-toolbar-title>User Info</v-toolbar-title>
                        <v-divider
                                class="mx-4"
                                inset
                                vertical
                        ></v-divider>
                        <div class="flex-grow-1"></div>
                        <v-dialog v-model="dialog" max-width="500px">
                            <template v-slot:activator="{ on }">
                                <v-btn color="warn" @click="logout" dark class="mb-2" v-on="on">Logout</v-btn>
                            </template>
                        </v-dialog>
                    </v-toolbar>
                </template>
                <template v-slot:no-data>
                    <v-btn color="primary" @click="initialize">Reset</v-btn>
                </template>
            </v-data-table>
        </v-card>`,
        vuetify: new Vuetify(),
        data: function () {
            return {

                user: {
                    firstName: '',
                    lastName: '',
                    personalCode: '',
                    password: '',
                    birthDate: new Date().toISOString().substr(0, 10),


                },

                rules: {
                    required: value => !!value || 'Required.',
                    min: v => v.length >= 8 || 'Min 8 characters',
                    emailMatch: () => ('The email and password you entered don\'t match'),
                },
                nameRules: [
                    v => !!v || 'This field is required',
                ],
                emailRules: [
                    v => !!v || 'E-mail is required',
                    v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
                ],

                search: '',
                dialog: false,
                alert: false,
                errorMessage: 'error!!!',
                userInfo: [],
                headers: [
                    {text: 'First Name', value: 'firstName'},
                    {text: 'Last Name', value: 'lastName'},
                    {text: 'Email', value: 'email'},
                    {text: 'Personal Code', value: 'personalCode'},
                    {text: 'Birth Date', value: 'birthDate'},

                ],

                editedIndex: -1,
            }
        },
        computed: {},

        created() {
            this.initialize()
        },
        mounted() {

        },
        watch: {
            dialog(val) {
                val || this.close()
            },
        },

        methods: {
            initialize() {
                // axios.defaults.headers.common['Authorization'] = `Bearer `+localStorage.getItem("token");
                axios.get("/get-user", {
                    headers: {
                        Authorization: 'Bearer ' + localStorage.getItem("token")
                    },
                }).then(
                    (result) => {
                        debugger;
                        this.userInfo = result.data;
                    }
                ).catch(

                )
            },


            logout() {

                localStorage.clear();
                router.push("/login")


            },


        },
    };

    var Auth = {
        loggedIn: false,
        login: function () {
            this.loggedIn = true
        },
        logout: function () {
            this.loggedIn = false
        }
    };

    var LoginForm = {
        // template: '<input type="submit" value="Login" v-on:click="login">',
        template: '<v-form>\n' +
            '            <v-container>\n' +
            '                <v-row>\n' +
            '\n' +
            '                    <v-col cols="12" md="12" sm="12">\n' +
            '                        <v-text-field\n' +
            '                                v-model="userLogin.username"\n' +
            '                                :rules="[rules.required]"\n' +
            '                                label="Email or Personal Code"\n' +
            '                                outlined\n' +
            '                        ></v-text-field>\n' +
            '                    </v-col>\n' +
            '                </v-row>\n' +
            '                <v-row>\n' +
            '\n' +
            '                    <v-col cols="12" md="12" sm="12">\n' +
            '\n' +
            '                        <v-text-field\n' +
            '                                :append-icon="show2 ? \'visibility\' : \'visibility_off\'"\n' +
            '                                v-model="userLogin.password"\n' +
            '                                :rules="[rules.required]"\n' +
            '                                :type="show2 ? \'text\' : \'password\'"\n' +
            '                                label="Password"\n' +
            '                                hint="At least 8 characters"\n' +
            '                                class="input-group--focused"\n' +
            '                                @click:append="show2 = !show2"\n' +
            '                                outlined\n' +
            '                        ></v-text-field>\n' +
            '                    </v-col>\n' +
            '\n' +
            '                </v-row>\n' +
            '\n' +
            '                <v-row>\n' +
            '                    <v-col>\n' +
            '                        <div class="text-center">\n' +
            '                            <v-btn\n' +
            '                                    class="success"\n' +
            '                                    dark\n' +
            '                                    @click="authenticate()"\n' +
            '                            >\n' +
            '                                Login\n' +
            '                            </v-btn>\n' +
            '                        </div>\n' +
            '                    </v-col>\n' +
                ' <v-row>\n' +
            '\n' +
            '            <v-col >\n' +
            '                <div class="text-center">\n' +
            '                    <v-btn\n' +
            '                            class="Primary"\n' +
            '                            dark\n' +
            '                            @click="register"\n' +
            '                    >\n' +
            '                        Register\n' +
            '                    </v-btn>\n' +
            '\n' +
            '                </div>\n' +
            '            </v-col>\n' +
            '        </v-row>'+


            '\n' +
            '                </v-row>\n' +
            '            </v-container>\n' +
            '        </v-form>',
        vuetify: new Vuetify(),
        data: function () {
            return {

                date: new Date().toISOString().substr(0, 10),
                menu: false,
                modal: false,
                menu2: false,


                userLogin: {
                    username: '',
                    password: '',
                },

                show: false,
                show2: false,
                rules: {
                    required: value => !!value || 'Required.',
                    min: v => v.length >= 8 || 'Min 8 characters',
                    emailMatch: () => ('The email and password you entered don\'t match'),
                },
                nameRules: [
                    v => !!v || 'This field is required',
                ],
                emailRules: [
                    v => !!v || 'E-mail is required',
                    v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
                ],
                alert: false,
                errorMessage: '',


            }
        },

        methods: {
            login: function () {
                Auth.login();
                router.push(this.$route.query.redirect);
            },

            register() {
                app.dialog = true;
            },
            authenticate() {

                axios.post("/authenticate", this.userLogin)
                    .then(
                        (result) => {
                            debugger;
                            localStorage.setItem("token", result.data.token);

                            // vue.swapComponent('view-02');
                            // vue.showMenu=false;
                            // vue.registerButton=false;


                            // vue.prototype.http.defaults.headers.common['Authorization']=result.data.token;
                            Auth.login();
                            router.push("/dashboard");

                            // axios.defaults.headers.common['Authorization'] = `Bearer `+localStorage.getItem("token");
                            // axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
                            //
                            // axios.get('/simple-auth/get-dashboard', {
                            //     headers: {
                            //         Authorization: 'Bearer ' + localStorage.getItem("token")
                            //     },
                            // }).then(function (result) {
                            //     debugger;
                            //     // resolve(result);
                            // })

                        }
                    ).catch(function (error) {
                    debugger;
                    vue.alert = true;
                    vue.errorMessage = error.response.data.message;

                });
            },
        }
    };

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
            debugger;
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

    var validToken = false;

    function checkToken() {
        if (localStorage.getItem("token")) {
            axios.get('/refresh-token', {
                headers: {
                    Authorization: 'Bearer ' + localStorage.getItem("token")
                },
            }).then(function (result) {
                localStorage.setItem("token", result.data.token);
                Auth.login();
                router.push("/dashboard");
                validToken = true;

            }).catch(function (error) {
                debugger;
                // vue.alert = true;
                // this.validToken=false;
                // vue.errorMessage = error.response.data.message;
                app.expirationMessage = error.response.data.message;
                router.push("/unauthorized");

            });


        } else {
            router.push("/login");
        }
    }


    var app = new Vue({
        el: '#app',
        vuetify: new Vuetify(),
        router,
        data() {
            return {
                userInfo: [],
                menu: false,
                modal: false,
                menu2: false,
                registerButton: true,
                expirationMessage: "expired",
                showMenu: true,
                validToken: false,
                //
                // userLogin: {
                //     username: '',
                //     password: '',
                // },

                user: {
                    firstName: '',
                    lastName: '',
                    personalCode: '',
                    email: '',
                    password: '',
                    birthDate: new Date().toISOString().substr(0, 10),


                },
                show: false,
                show2: false,
                rules: {
                    required: value => !!value || 'Required.',
                    min: v => v.length >= 8 || 'Min 8 characters',
                    emailMatch: () => ('The email and password you entered don\'t match'),
                },
                nameRules: [
                    v => !!v || 'This field is required',
                ],
                emailRules: [
                    v => !!v || 'E-mail is required',
                    v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
                ],
                dialog: false,
                alert: false,
                errorMessage: '',


            }
        },
        created() {

        },
        methods: {
            close() {
                this.dialog = false;
            },

            register() {
                this.dialog = true;
            },
            save() {
                postData("/register", this.user);
                this.close();
            },


        },
    });


    function postData(url, data) {

        axios.post(url, data)
            .then(
                function (result) {

                }
            ).catch(function (error) {
            app.alert = true;
            app.errorMessage = error.response.data.message;

        });
    }
</script>

<%--<script src="../js/app.js"></script>--%>


</body>

</html>
