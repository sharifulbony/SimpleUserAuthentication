var Unauthorized = {
    template: '<div>' +
        '<h1 style="text-align: center">' +
        'Http Status Code 401: Token  expired. You can renew this token by clicking the button below within {{expire}} seconds  </h1>' +
        '<v-btn\n style="left: 50%"' +
        '                        class="Success"\n' +
        '                        dark\n' +
        '                        @click="renew()"\n' +
        '                >\n' +
        '                    renew' +
        '</v-btn>' +
        '</div>',
    data: function () {
        return {
            expire: 300, /*60 * 5 for five minutes*/

        }
    },

    methods: {
        renew() {
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
                    app.success = true;
                    app.successMessage = "Token Renewed  Successfully!!!";

                }).catch(function (error) {
                    app.alert=true;
                    app.errorMessage = error.response.data.message;
                    localStorage.setItem("expire",300);
                    router.push("/login");

                });


            } else {
                router.push("/login");
                localStorage.setItem("expire",300);
            }

        },
    },
    watch: {
        expire: function (val) {

            localStorage.setItem("expire", val);
            if (val === 0) {
                localStorage.clear();
                router.push("/login");

            }
        }
    },
    created() {
        let ifExpireExist = localStorage.getItem("expire");
        localStorage.setItem("refresh", 10);
        if(ifExpireExist){
            this.expire=ifExpireExist;
        }
        startTimer(this.expire, this);
    },


};