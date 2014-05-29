Prodetotal2.ApplicationRoute = Ember.Route.extend({
    model: function() {      
      return JSON.parse(localStorage.currentUser);
    }
});