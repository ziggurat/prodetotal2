Prodetotal2.AuthenticatedRoute = Ember.Route.extend({
  beforeModel: function() {
    /*if (!this.controllerFor('login').get('token')) {
      this.redirectToLogin(transition);
    }*/
    console.log("Before model on AuthenticatedRoute");
    Ember.$.ajaxSetup({
      beforeSend: function(xhr) {
          xhr.setRequestHeader('Facebook-User-Id', localStorage.userId);
          xhr.setRequestHeader('Facebook-User-Token', localStorage.token);
      }
    });
  },
  actions: {
    error: function(reason, transition) {      
      if (reason.status === 401) {
        console.log("Unauthorized");
        this.transitionTo("login");
      } else {
        console.log("Something went wrong!!");
        console.log(reason);
        this.transitionTo("login");
      }
    }
  }
});