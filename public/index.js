  /* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to the show",
      productions: [],
      performance: {}
    };
  },
  created: function() {
    axios.get("/api/productions").then(function(response){
     this.productions = response.data;
     console.log(this.productions);
   }.bind(this));
  },
  methods: {
    isAdmin: function() {
      return localStorage.getItem("admin")
    },
    setPerf: function(performance) {
      this.performance = performance;
    },
    save: function(performance) {
      console.log(performance);
      var params = {
        date: performance.date,
        time: performance.time,
        tickets_available: performance.tickets_available,
        tickets_sold: performance.tickets_sold,
        ticket_price: performance.ticket_price
        };
        console.log(params);  
      axios
        .patch("/api/performances/" + performance.id, params)
        // .then(function(response) {}) 
    },    
  },
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

var TicketCartPage = {
  template: "#ticket-cart-page",
  data: function() {
    return {
      cartedTickets: []
    };
  },
  created: function() {
    axios.get("/api/carted_tickets").then(function(response){
     this.cartedTickets = response.data;
     console.log(this.cartedTickets);
   }.bind(this));
  },
  methods: {
    deleteCartedTicket(ticket){
      axios.delete("api/carted_tickets/" + ticket.id).
      then(function(response){
        router.push("/");
      })
    }
  },
  computed: {}
};

var TicketEditPage = {
  template: "#ticket-edit-page",
  data: function() {
    return {
      quantity: ""
    };
  },
  created: function() {
    axios.get("/api/carted_tickets/" + this.$route.params.id).then(function(response){
     this.quantity = response.data.quantity;
     console.log(this.quantity);
   }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        quantity: this.quantity
      };
      axios
        .patch("/api/carted_tickets/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/carted_tickets");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    },
  },
  computed: {}
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
            console.log(response);
          localStorage.setItem("jwt", response.data.jwt);
          localStorage.setItem("admin", response.data.member.admin);
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
    localStorage.removeItem("admin");
    router.push("/");
  }
};



var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  { path: "/productions/:id", component: ShowProductionPage },
  { path: "/carted_tickets/", component: TicketCartPage },
  { path: "/carted_tickets/:id/edit", component: TicketEditPage },
  { path: "/signup", component: SignupPage },
  { path: "/login", component: LoginPage },
  { path: "/logout", component: LogoutPage }

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
  },
  methods: {
    isLoggedIn: function() {
      if (localStorage.getItem("jwt")) {
        return true;
      }
      return false;
    },
  }
});