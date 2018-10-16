import * as Vue from 'Vue';
import * as Vuex from 'Vuex';

Vue.use(Vuex);

const state = {
    x: 'aaa3',
    getAuthFileCont: '',
};
const getters = {
    getA(state) {
        return state.x + '20';
    }
};
const mutations = {
    setA(state, data) {
        state.x = data;
    },
    setAuthFileCont(_state, _data) {
        _state.getAuthFileCont = _data;
    }
};
const actions = {
    setAAA({
        state,
        getters,
        commit,
        dispatch
    }, data) {
        commit('setA', data);
    },
    getSmsAuthCode({
        state,
        commit,
        dispatch
    }, data) {
        let fileName = data;
        // 因為還未有真正的手機簡訊，所以先讀檔  2018.08.17
        let res = new Promise(function (resolve, reject) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4) {
                    if (xhttp.status === 200) {
                        resolve(xhttp.responseText);
                    } else {
                        reject(new Error(xhttp.statusText));
                    }
                }
            };
            xhttp.onerror = function () {
                reject(new Error("Network Error"));
            };
            let url = "./myWebservice/readSmsAuthFile.jsp";
            let data = `fileName=${fileName}`;

            xhttp.open("POST", url, true);
            xhttp.responseType = "text";
            xhttp.setRequestHeader(
                "Content-type",
                "application/x-www-form-urlencoded"
            );
            xhttp.send(data);
        });
        res
            .then(function (result) {
                commit('setAuthFileCont', result);
            })
            .catch(function (e) {
                console.log(e.message);
            });
    },
    doAjax({
        state,
        commit,
        dispatch
    }, data) {
        let httpMethodObj = data.httpMethodObj;
        return new Promise(function (resolve, reject) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === XMLHttpRequest.DONE) {
                    if (xhttp.status === 200) {
                        resolve(xhttp.responseText);
                    } else {
                        reject(new Error(xhttp.statusText));
                    }
                }
            };
            xhttp.onerror = function () {
                reject(new Error("Network Error"));
            };
            xhttp.open(httpMethodObj.method, data.url, true);
            xhttp.responseType = data.resType;
            xhttp.setRequestHeader(
                httpMethodObj.reqHeader.key,
                httpMethodObj.reqHeader.value
            );
            xhttp.send(data.data);
        });
    },
};

export const store = new Vuex.Store({
    state,
    getters,
    mutations,
    actions,
});