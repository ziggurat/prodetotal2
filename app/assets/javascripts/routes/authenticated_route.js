Prodetotal2.AuthenticatedRoute = Ember.Route.extend({
  beforeModel: function() {
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
        //alert('Something went wrong');
        this.transitionTo("login");
      }
    }
  }
});