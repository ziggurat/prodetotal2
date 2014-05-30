Prodetotal2.ApplicationRoute = Ember.Route.extend({
    model: function() {
      if (localStorage.currentUser != null) {
        return JSON.parse(localStorage.currentUser);
      } else {
        return null;
      }
    }
});