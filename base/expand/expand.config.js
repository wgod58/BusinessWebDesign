define(["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.config = {
        requirejs: {
            baseUrl: '/base/expand/',
            paths: {
                'vue': '/base/expand/vue.min',
                'less': '/base/expand/less.min',
                'jquery': '/base/expand/jquery-3.2.1.min',
            },
        },
        less: {
            reload: false,
        },
    };
});
