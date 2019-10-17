var Auth = {
    loggedIn: false,
    login: function () {
        this.loggedIn = true
    },
    logout: function () {
        this.loggedIn = false
    }
};
var validToken = false;




var app = new Vue({
    el: '#app',
    vuetify: new Vuetify(),
    router,
    data() {
        return {
            userInfo: [],
            timeout:3000,
            menu: false,
            modal: false,
            menu2: false,
            registerButton: true,
            dialog: false,
            alert: false,
            success: false,
            errorMessage: '',
            successMessage: '',
            showMenu: true,
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


        }
    },
    created() {

    },
    computed: {},

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


