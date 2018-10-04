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

var ShowProductionPage = {
  template: "#show-production-page",
  data: function(){
    return {
      production: {performances: [{}]}
    };
  },
  created: function() {
    axios.get("api/productions/" + this.$route.params.id).then(function(response){
      this.production = response.data;
      console.log(this.production);
    }.bind(this)); 
  },
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      phone: "",
      address: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        phone: this.phone,
        address: this.address,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/members", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/member_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};



var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  {path: "/signup", component: SignupPage },
  { path: "/login", component: LoginPage },
  { path: "/logout", component: LogoutPage },
  { path: "/productions/:id", component: ShowProductionPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});