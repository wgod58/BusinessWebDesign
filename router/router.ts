import * as Vue from 'Vue';
import * as VueRouter from 'VueRouter';
import mainbody from '../components/body/mainbody';
import home from '../components/home/home'

Vue.use(VueRouter)

const routes = [
    {
        //path: '/:id',
        path: '/main',
        name: 'mainbody',
        //props: true,
        component: mainbody,
    }, {
        path: '/',
        name: 'home',
        component: home,
    }
];

export default new VueRouter({
    routes: routes,
    //mode: 'history',
    fallback: false,
});

