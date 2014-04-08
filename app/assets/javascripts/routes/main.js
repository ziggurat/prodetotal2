Prodetotal2.MainRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('competition');
  }
});