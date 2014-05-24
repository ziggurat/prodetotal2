Prodetotal2.AuthenticatedRoute = Ember.Route.extend({
  actions: {
    error: function(reason, transition) {
      if (reason.status === 401) {
        console.log("Unauthorized");
        this.transitionTo("login");
      } else {
        alert('Something went wrong');
      }
    }
  }
});