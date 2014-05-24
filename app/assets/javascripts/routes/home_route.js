Prodetotal2.HomeRoute = Prodetotal2.AuthenticatedRoute.extend({
    model: function() {
      return this.store.findById('user', localStorage.userId);
    },
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