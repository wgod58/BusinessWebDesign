export var config = {
    //http://requirejs.org/docs/api.html
    requirejs: {
        baseUrl: '/base/expand/',
        paths: {
            'vue': '/base/expand/vue.min',
            'less': '/base/expand/less.min',
			'jquery': '/base/expand/jquery-3.2.1.min',
			//'jquery': '/base/expand/jquery-1.12.4.min',
        },
    },
    less: {
        reload: false,
    },
};