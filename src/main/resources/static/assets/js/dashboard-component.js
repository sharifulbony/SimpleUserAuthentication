var Dashboard = {
    template: `
        <v-card>
        
        

            <v-data-table
                    style="margin-left: 5%!important;margin-right: 5%!important;margin-top: 5%!important;"
                    :headers="headers"
                
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
                        <div>Token expires in <span id="time">{{expire}}</span> seconds!</div>
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
            expire: 10,

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
        this.initialize();
        localStorage.setItem("expire", 300);
        let ifCanRefresh = localStorage.getItem("refresh");
        if (ifCanRefresh) {
            this.expire = ifCanRefresh;
        }
        startTimer(this.expire, this);
    },
    mounted() {

    },
    watch: {
        dialog(val) {
            val || this.close()
        },
        expire: function (val) {
            if (typeof val === 'string' || val instanceof String) {
                let minutes = parseInt(val.split(":")[0]) * 60;
                let seconds = parseInt(val.split(":")[1]);
                localStorage.setItem("refresh", minutes + seconds);
            }
            if (val === "00:00") {
                localStorage.setItem("expire", 300);
                localStorage.setItem("refresh", 10);
                router.push("/unauthorized");
            }
        }
    },


    methods: {
        initialize() {
            axios.get("/get-user", {
                headers: {
                    Authorization: 'Bearer ' + localStorage.getItem("token")
                },
            }).then(
                (result) => {
                    this.userInfo = result.data;
                    this.userInfo.forEach( item=> {
                        let timeS = timeConverter(item.birthDate);
                        item.birthDate = timeS;

                    })
                }
            ).catch(

            )
        },


        logout() {
            localStorage.clear();
            app.success=true;
            app.successMessage="Logout Successfully!!!"
            router.push("/login")
        },


    },
};