var LoginForm = {
    template:
        '<v-form>\n' +
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
        register() {
            app.dialog = true;
        },
        authenticate() {

            axios.post("/authenticate", this.userLogin)
                .then(
                    (result) => {
                        localStorage.setItem("token", result.data.token);
                        Auth.login();
                        router.push("/dashboard");
                        app.success = true;
                        app.successMessage = "Login  Successfully!!!";
                    }
                ).catch(function (error) {
                app.alert = true;
                app.errorMessage = error.response.data.message;
            });
        },
    }
};
