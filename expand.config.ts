export var config = {
    //http://requirejs.org/docs/api.html
    requirejs: {
        baseUrl: 'components/',
        paths: {
            'bootstrap':['../assets/bootstrap-4.1.1/js/bootstrap.bundle.min'],
            'jquery': ['../assets/jquery/jquery.min'],
            'text': ['../assets/requirejs-text/text'],
            'Vue': ['../assets/vue/vue.min'],
            'Vuex':['../assets/vuex/vuex.min'],
            'VueRouter':['../assets/vue-router/vue-router.min'],
            //'Promise': ['../assets/polyfill/Promise.min']
        }
    },
    less: {
        reload: false,
    },
};