/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to the show",
      productions: []
    };
  },
  created: function() {
    axios.get("/api/productions").then(function(response){
     this.productions = response.data;
     console.log(this.productions);
   }.bind(this));
  },
  methods: {},
  computed: {}
};



var router = new VueRouter({
  routes: [{ path: "/", component: HomePage }],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});