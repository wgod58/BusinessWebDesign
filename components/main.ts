import * as Vue from 'Vue';
import { store } from '../store/store';
import router from '../router/router';
import app from './home/app'

export class main {
    element;
    attrs;
    init(element) {
        this.element = element;
        this.attrs = $expand.getAttributes(element);
        const self = this;
        var id = $expand.makeRandomString();
        // this.element.innerHTML = '<div id='+id+'><router-view id="abc"></router-view></div>'
        this.element.innerHTML = '<app id=' + id + '></app>'
        const v = new Vue({
            el: this.element,
            store,
            router,
            components: {app}
        });
    }
}