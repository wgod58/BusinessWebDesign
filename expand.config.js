define(["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.config = {
        requirejs: {
            baseUrl: 'components/',
            paths: {
                'bootstrap': ['../assets/bootstrap-4.1.1/js/bootstrap.bundle.min'],
                'jquery': ['../assets/jquery/jquery.min'],
                'text': ['../assets/requirejs-text/text'],
                'Vue': ['../assets/vue/vue.min'],
                'Vuex': ['../assets/vuex/vuex.min'],
                'VueRouter': ['../assets/vue-router/vue-router.min'],
            }
        },
        less: {
            reload: false,
        },
    };
});
