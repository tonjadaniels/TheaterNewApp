/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to the show",
      productions: [],
      performance: {},
      performances: {}
    };
  },
  created: function() {
    axios.get("/api/productions").then(
      function(response) {
        this.productions = response.data;
        console.log(this.productions);
      }.bind(this)
    );
  },

  computed: {}
};

var ShowProductionPage = {
  template: "#show-production-page",
  data: function() {
    return {
      production: { performances: [{}] },
      performance: {},
      quantity: 1
    };
  },
  created: function() {
    axios.get("api/productions/" + this.$route.params.id).then(
      function(response) {
        this.production = response.data;
        console.log(this.production);
      }.bind(this)
    );
  },
  methods: {
    isAdmin: function() {
      var adminTest = localStorage.getItem("admin");
      if (adminTest === "true") {
        return true;
      } else {
        return false;
      }
    },
    isLoggedIn: function() {
      if (localStorage.getItem("jwt")) {
        return true;
      }
      return false;
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
      axios.patch("/api/performances/" + performance.id, params);
      // .then(function(response) {})
    },
    addOne: function(quantity) {
      this.quantity += 1;
    },
    subtractOne: function(quantity) {
      this.quantity -= 1;
    },
    resetQuantity: function(quantity) {
      this.quantity = 1;
    },
    available: function(performance) {
      if (this.quantity < this.performance.unsold_tickets) {
        return true;
      }
    },
    saveToCart: function(performance) {
      console.log(performance);
      var params = {
        quantity: this.quantity,
        performance_id: performance.id
      };
      console.log(params);
      axios.post("/api/carted_tickets/", params);
      this.quantity = 1;
    }
  }
};

var ProfessionalIndexPage = {
  template: "#professional-index-page",
  data: function() {
    return {
      message: "List of Professionals",
      professionals: [],
      professional: {}
    };
  },
  created: function() {
    axios.get("/api/professionals").then(
      function(response) {
        this.professionals = response.data;
        console.log(this.professionals);
      }.bind(this)
    );
  },
  methods: {
    setProfessional: function(professional) {
      this.professional = professional;
    },
    save: function(professional) {
      console.log(professional);
      var params = {
        name: professional.name,
        bio: professional.bio,
        image: professional.image
      };
      console.log(params);
      axios.patch("/api/professionals/" + professional.id, params);
      // .then(function(response) {})
    }
  },
  computed: {}
};

var ProfessionalNewPage = {
  template: "#professional-new-page",
  data: function() {
    return {
      name: "",
      bio: "",
      image: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        bio: this.bio,
        image: this.image
      };
      axios
        .post("/api/professionals", params)
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

var PerformanceNewPage = {
  template: "#performance-new-page",
  data: function() {
    return {
      production_id: "",
      date: "",
      time: "",
      tickets_available: "",
      tickets_sold: "",
      ticket_price: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        production_id: this.production_id,
        date: this.date,
        time: this.time,
        tickets_available: this.tickets_available,
        tickets_sold: this.tickets_sold,
        ticket_price: this.ticket_price
      };
      axios
        .post("/api/performances", params)
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

var RoleIndexPage = {
  template: "#role-index-page",
  data: function() {
    return {
      message: "List of Roles",
      roles: [],
      role: {}
      // productions: []
    };
  },
  created: function() {
    axios.get("/api/roles").then(
      function(response) {
        this.roles = response.data;
        console.log(this.roles);
      }.bind(this)
    );
  },
  methods: {
    isAdmin: function() {
      var adminTest = localStorage.getItem("admin");
      if (adminTest === "true") {
        return true;
      } else {
        return false;
      }
    },
    setRole: function(role) {
      this.role = role;
    },
    save: function(role) {
      console.log(role);
      var params = {
        production_id: role.production_id,
        professional_id: role.professional_id,
        title: role.title
      };
      console.log(params);
      axios.patch("/api/roles/" + role.id, params);
      // .then(function(response) {})
    }
  },
  computed: {}
};

var RoleNewPage = {
  template: "#role-new-page",
  data: function() {
    return {
      production_id: "",
      professional_id: "",
      title: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        production_id: this.production_id,
        professional_id: this.professional_id,
        title: this.title
      };
      axios
        .post("/api/roles", params)
        .then(function(response) {
          router.push("/roles");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var TicketCartPage = {
  template: "#ticket-cart-page",
  data: function() {
    return {
      cartedTickets: [],
      orderId: ""
    };
  },
  created: function() {
    axios.get("/api/carted_tickets").then(
      function(response) {
        this.cartedTickets = response.data;
        console.log(this.cartedTickets);
      }.bind(this)
    );
  },
  methods: {
    deleteCartedTicket(ticket) {
      axios.delete("api/carted_tickets/" + ticket.id).then(function(response) {
        router.push("/");
      });
    },
    orderTickets(cartedTickets) {
      cartedTickets.forEach(function(ticket) {
        var params = {
          total: ticket.total,
          ticket_id: ticket.id
        };
        axios.post("api/orders", params).then(function(response) {});
        router.push("/");
      });
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
    axios.get("/api/carted_tickets/" + this.$route.params.id).then(
      function(response) {
        this.quantity = response.data.quantity;
        console.log(this.quantity);
      }.bind(this)
    );
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
    }
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
    { path: "/roles", component: RoleIndexPage },
    { path: "/roles/new", component: RoleNewPage },
    { path: "/professionals/new", component: ProfessionalNewPage },
    { path: "/professionals", component: ProfessionalIndexPage },
    { path: "/performances/new", component: PerformanceNewPage },
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
    isAdmin: function() {
      var adminTest = localStorage.getItem("admin");
      if (adminTest === "true") {
        return true;
      } else {
        return false;
      }
    }
  }
});
