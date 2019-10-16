Vue.component('dashboard',{
    template : '<div v-on:mouseover = "changename()" v-on:mouseout = "originalname();"><h1>Custom Component created by <span id = "name">{{name}}</span></h1></div>',
    data: function() {
        return {
            name : "Ria"
        }
    },
    methods:{
        changename : function() {
            this.name = "Ben";
        },
        originalname: function() {
            this.name = "Ria";
        }
    }
});