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
            app.expirationMessage = error.response.data.message;
            validToken=false;
            router.push("/unauthorized");

        });


    } else {
        router.push("/login");
    }
}
function postData(url, data) {

    axios.post(url, data)
        .then(
            function (result) {
                app.success = true;
                app.successMessage = "Registered  Successfully!!!";

            }
        )
        .catch(function (error) {
            app.alert = true;
            app.errorMessage = error.response.data.message;

        });
}
function startTimer(duration, display) {
    var timer = duration;

    setInterval(function () {
        display.expire = timer;
        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}

function timeConverter(UNIX_timestamp) {
    let a = new Date(UNIX_timestamp);
    let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    let year = a.getFullYear();
    let month = months[a.getMonth()];
    let date = a.getDate();
    return  date + ' ' + month + ' ' + year ;

}