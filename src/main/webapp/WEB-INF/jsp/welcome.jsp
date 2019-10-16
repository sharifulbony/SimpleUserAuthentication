<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->


<head>
    <meta charset="utf-8"/>
    <title>Simple Search Application</title>
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="https://unpkg.com/vue-multiselect@2.1.0/dist/vue-multiselect.min.css">

    <style>
        table.v-table tbody td,
        table.v-table tbody th {
            height: 19px;
        }
    </style>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.2.6/vue.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.16.1/axios.min.js"></script>
    <%--        <script src="https://unpkg.com/vuetable-2@1.6.0"></script>--%>
    <script src="https://unpkg.com/vue-multiselect@2.1.0"></script>


</head>
<body>
<div id="app">

    <v-app id="inspire">

        <v-card>

<%--            <v-btn color="success" dark class="mb-2" >New Ticket</v-btn>--%>
            <v-data-table
                    style="margin-left: 5%!important;margin-right: 5%!important;margin-top: 5%!important;"
                    :headers="headers"
                    :search="search"
                    :dark="true"
                    :items="userInfo"
                    :items-per-page="1"
                    :sort-by="['id', 'title','email']"
                    :sort-desc="[true, true,true]"
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
                                <v-btn color="warn" dark class="mb-2" v-on="on">Logout</v-btn>
                            </template>
                        </v-dialog>
                    </v-toolbar>
                </template>
                <template v-slot:no-data>
                    <v-btn color="primary" @click="initialize">Reset</v-btn>
                </template>
            </v-data-table>
        </v-card>
    </v-app>


</div>


<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>

<script>

    let vue = new Vue({
        el: '#app',
        vuetify: new Vuetify(),
        data() {
            return {

                dialog:false,
                user: {
                    firstName: '',
                    lastName: '',
                    personalCode: '',
                    email: '',
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
                errorMessage:'',
                email:'shariful.bony@gmail.com',
                headers: [
                    {text: 'First Name', value: 'firstName'},
                    {text: 'Last Name', value: 'lastName'},
                    {text: 'Email', value: 'email'},
                    {text: 'Personal Code', value: 'personalCode'},
                    {text: 'Birth Date', value: 'birthDate'},

                ],
                userInfo: [],
                editedIndex: -1,
            }
        },
        computed: {
        },

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
                axios.post("/get-user",this.email)
                    .then(
                        function (result) {
                            debugger;

                            vue.userInfo = result.data;
                        }
                    ).catch(

                )
            },



            logout() {


            },


        },
    });


    function timeConverter(UNIX_timestamp) {
        let a = new Date(UNIX_timestamp);
        let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        let year = a.getFullYear();
        let month = months[a.getMonth()];
        let date = a.getDate();
        let hour = a.getHours();
        let min = a.getMinutes();
        let sec = a.getSeconds();
        let time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec;
        return time;
    }

    function postData(url, data) {

        axios.post(url, data)
            .then(
                function (result) {

                }
            ).catch(function (error) {
            vue.alert = true;
            vue.errorMessage=error.response.data.message;

        });

    }
</script>

<%--<script src="../js/app.js"></script>--%>


</body>

</html>
