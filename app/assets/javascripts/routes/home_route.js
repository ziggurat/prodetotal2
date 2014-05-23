Prodetotal2.HomeRoute = Ember.Route.extend({
    model: function() {
      //return this.store.findById('user', Prodetotal2.currentUser.get("id"));
      return {
        blue: "BLUE!"
      };
    }
});