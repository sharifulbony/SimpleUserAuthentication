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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">

    <style>
        table.v-table tbody td,
        table.v-table tbody th {
            height: 19px;
        }
    </style>
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

            </v-toolbar>
        </v-card>

        <v-snackbar
                v-model="alert"
                :bottom="true"
                color="error"
                :multi-line="true"
                :right="true"
                :timeout="timeout"
        >
            {{ errorMessage }}
            <v-btn
                    color="black"
                    text
                    @click="alert = false"
            >
                Close
            </v-btn>
        </v-snackbar>

        <v-snackbar
                v-model="success"
                :bottom="true"
                color="success"
                :multi-line="true"
                :right="true"
                :timeout="timeout"
        >
            {{ successMessage }}
            <v-btn
                    color="black"
                    text
                    @click="success = false"
            >
                Close
            </v-btn>
        </v-snackbar>



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
        <router-view></router-view>
    </v-app>
        <v-footer color="indigo" app inset>
                <span class="white--text">&copy; Developed By:
                    <a style="color:red;" href="https://www.linkedin.com/in/bonyshariful">A K M Shariful Islam
                    </a>
                </span>
        </v-footer>
</div>
<script src="/assets/js/login-component.js"></script>
<script src="/assets/js/unauthorized-component.js"></script>
<script src="/assets/js/dashboard-component.js"></script>
<script src="/assets/js/router.js"></script>
<script src="/assets/js/vanila-js-methods.js"></script>
<script src="/assets/js/app.js"></script>
</body>

</html>
